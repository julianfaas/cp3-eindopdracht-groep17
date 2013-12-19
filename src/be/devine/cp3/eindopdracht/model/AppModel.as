package be.devine.cp3.eindopdracht.model {

import be.devine.cp3.eindopdracht.model.service.ConversionService;
import be.devine.cp3.eindopdracht.vo.ConversionVO;

import flash.events.Event;
import flash.events.EventDispatcher;

public class AppModel extends EventDispatcher {

    public static const CONVERSION_CHANGED:String = "conversionChanged";
    public static const CHANGED:String = "changedConversion";

    private var _conversions:Array;

    public function get conversions():Array {
        return _conversions;
    }

    public function set conversions(value:Array):void {
        if(_conversions != value){
            _conversions = value;

            dispatchEvent(new Event(CONVERSION_CHANGED));
        }
    }

    private var _currentConversion:ConversionVO;
    public function get currentConversion():ConversionVO {
        return _currentConversion;
    }

    public function set currentConversion(value:ConversionVO):void {
        if(_currentConversion != value) {
            _currentConversion = value;

            dispatchEvent(new Event(CHANGED));
        }
    }

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
        var conversionService:ConversionService = event.target as ConversionService;
        this.conversions = conversionService.conversions;

        this.currentConversion = _conversions[0];
    }
}
}
internal class Enforcer {};
