
package be.devine.cp3.eindopdracht.mobile.view {

import be.devine.cp3.eindopdracht.model.AppModel;

import feathers.controls.ImageLoader;
import flash.display.BitmapData;
import starling.animation.Transitions;
import starling.animation.Tween;
import starling.core.Starling;
import starling.display.Sprite;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class IntroScreen extends Sprite {

    [Embed(source="/../assets/custom/sheet.png")]
    protected static const ATLAS_IMAGE:Class;

    [Embed(source="/../assets/custom/sheet.xml",mimeType="application/octet-stream")]
    protected static const ATLAS_XML:Class;

    private var _appModel:AppModel;
    private var _atlas:TextureAtlas;
    private var _introScreen:ImageLoader;

    private var _menu:MainScreen;

    public function IntroScreen() {
        trace("[IntroScreen] Startup");

        _appModel = AppModel.getInstance();

        const atlasBitmapData:BitmapData = (new ATLAS_IMAGE()).bitmapData;
        _atlas = new TextureAtlas(Texture.fromBitmapData(atlasBitmapData, false), XML(new ATLAS_XML()));

        _introScreen = new ImageLoader();
        _introScreen.source = _atlas.getTexture("intro");
        addChild(_introScreen);

        var t:Tween = new Tween(_introScreen, 1, Transitions.EASE_IN_OUT);
        t.animate("y", _introScreen.x - 1500);
        t.delay = 1;
        Starling.juggler.add(t);

        t.onComplete = completeHandler;
    }

    private function completeHandler():void {
        _menu = new MainScreen();
        addChild( _menu );
    }
}
}
