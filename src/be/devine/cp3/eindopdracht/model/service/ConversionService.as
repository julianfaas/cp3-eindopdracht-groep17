
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
        if(!conversionsFile.exists) {
            var writeStream:FileStream = new FileStream();
            writeStream.open(conversionsFile, FileMode.WRITE);
            writeStream.writeUTFBytes(JSON.stringify([
                {
                    name: "Conversie naam 1",
                    unit_1: "mijl",
                    short_1: "mi",
                    value_1: 1,

                    unit_2: "kilometer",
                    short_2: "km",
                    value_2: 1.62
                },
                {
                    name: "Conversie naam 2",
                    unit_1: "mijl",
                    short_1: "mi",
                    value_1: 1,

                    unit_2: "kilometer",
                    short_2: "km",
                    value_2: 1.62
                },
                {
                    name: "Conversie naam 3",
                    unit_1: "mijl",
                    short_1: "mi",
                    value_1: 1,

                    unit_2: "kilometer",
                    short_2: "km",
                    value_2: 1.62
                },
                {
                    name: "Conversie naam 4",
                    unit_1: "mijl",
                    short_1: "mi",
                    value_1: 1,

                    unit_2: "kilometer",
                    short_2: "km",
                    value_2: 1.62
                },
                {
                    name: "Conversie naam 5",
                    unit_1: "mijl",
                    short_1: "mi",
                    value_1: 1,

                    unit_2: "kilometer",
                    short_2: "km",
                    value_2: 1.62
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
