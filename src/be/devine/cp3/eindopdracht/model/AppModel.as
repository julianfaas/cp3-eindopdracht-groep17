package be.devine.cp3.eindopdracht.model {

import be.devine.cp3.eindopdracht.model.service.ConversionService;
import be.devine.cp3.eindopdracht.vo.ConversionVO;

import flash.events.Event;
import flash.events.EventDispatcher;

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
        trace("[AppModel] Loading JSON");
        var conversionService:ConversionService = new ConversionService();
        conversionService.addEventListener(Event.COMPLETE, loadedCompleteHandler);
        conversionService.load();
    }

    private function loadedCompleteHandler(event:Event):void {
        trace("[AppModel] JSON Loaded");
    }
}
}
internal class Enforcer {};
