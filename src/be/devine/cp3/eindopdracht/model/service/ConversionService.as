
package be.devine.cp3.eindopdracht.model.service {

import be.devine.cp3.eindopdracht.factory.ConversionVOFactory;

import flash.events.Event;

import flash.events.EventDispatcher;
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;

public class ConversionService extends EventDispatcher {

    public var conversions:Array;

    public function ConversionService() {}

    public function load():void {
        var conversionsFile:File = File.applicationStorageDirectory.resolvePath("conversions.json");
        if(conversionsFile.exists) conversionsFile.deleteFile();
        if(!conversionsFile.exists) {
            var writeStream:FileStream = new FileStream();
            writeStream.open(conversionsFile, FileMode.WRITE);
            writeStream.writeUTFBytes(JSON.stringify([
                {
                    name: "Geld voor sigaretten",
                    unit_1: "sigaret",
                    short_1: "sig",
                    value_1: 1,

                    unit_2: "Euro",
                    short_2: "€",
                    value_2: 0.25
                },
                {
                    name: "Kaarten in een deck",
                    unit_1: "Kaarten",
                    short_1: "krt",
                    value_1: 52,

                    unit_2: "Deck",
                    short_2: "D",
                    value_2: 1
                },
                {
                    name: "Mijl omzetten naar kilometer",
                    unit_1: "mijl",
                    short_1: "mi",
                    value_1: 1,

                    unit_2: "kilometer",
                    short_2: "km",
                    value_2: 1.62
                },
                {
                    name: "Knopen omzetten naar km/h",
                    unit_1: "Knopen",
                    short_1: "knot",
                    value_1: 1,

                    unit_2: "kilometer/uur",
                    short_2: "km/u",
                    value_2: 1.85
                },
                {
                    name: "Aantal gram omzetten naar korrels",
                    unit_1: "gram",
                    short_1: "g",
                    value_1: 10,

                    unit_2: "korrel",
                    short_2: "gr",
                    value_2: 20
                }
            ]));
            writeStream.close();
        }
        var readStream:FileStream = new FileStream();
        readStream.open(conversionsFile, FileMode.READ);
        var str:String = readStream.readUTFBytes(readStream.bytesAvailable);
        var parsedJSON:Array = JSON.parse(str) as Array;
        readStream.close();
        var conversions:Array = [];
        for each(var conversion:Object in parsedJSON) {
            conversions.push(ConversionVOFactory.createConversionVOFromObject(conversion));
        }
        this.conversions = conversions;

        dispatchEvent(new Event(Event.COMPLETE));
    }


}
}
