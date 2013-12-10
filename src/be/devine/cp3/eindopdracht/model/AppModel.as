package be.devine.cp3.eindopdracht.model {

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.net.URLLoader;
import flash.net.URLRequest;

public class AppModel extends EventDispatcher {

    private static var instance:AppModel;

    public static function getInstance():AppModel {
        if (instance == null) {
            instance = new AppModel(new Enforcer());
        }
        return instance;
    }

    public function AppModel(e:Enforcer) {
        trace("[AppModel] Startup");

        if (e == null) {
            throw new Error("AppModel is a singleton, use getInstance() instead");
        }
    }

    public function load():void {
        var songsXMLLoader:URLLoader = new URLLoader();
        songsXMLLoader.addEventListener(Event.COMPLETE, conversionXMLLoaderCompleteHandler);
        songsXMLLoader.load(new URLRequest("assets/xml/conversion.xml"));
    }

    private function conversionXMLLoaderCompleteHandler(event:Event):void {
        var conversionsXML:XML = new XML(event.target.data);
        var conversions:Array = [];

        for each(var conversion:Object in conversionsXML.conversion) {
            trace("[XML] Loaded");
        }
    }
}
}
internal class Enforcer {};
