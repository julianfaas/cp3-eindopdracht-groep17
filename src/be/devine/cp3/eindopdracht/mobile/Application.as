
package be.devine.cp3.eindopdracht.mobile {

import be.devine.cp3.eindopdracht.mobile.view.IntroScreen;
import be.devine.cp3.eindopdracht.model.AppModel;

import feathers.controls.ScreenNavigator;
import feathers.controls.ScreenNavigatorItem;
import feathers.themes.MetalWorksMobileTheme;
import starling.display.Sprite;
import starling.events.Event;

public class Application extends Sprite {

    private var _appModel:AppModel;

    private var _intro:IntroScreen;


    public function Application() {
        trace("[Application] Startup");

//        new MetalWorksMobileTheme();

        _appModel = AppModel.getInstance();

        _intro = new IntroScreen();
        addChild( _intro );

        _appModel.load();
        addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);


    }

    private function addedToStageHandler(event:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
        stage.addEventListener(Event.RESIZE,  resizeHandler);

        layout();
    }

    private function resizeHandler(event:Event):void {
        layout();
    }

    private function layout():void {
        trace("[Starling] ", stage.stageWidth, stage.stageHeight);
    }
}
}
