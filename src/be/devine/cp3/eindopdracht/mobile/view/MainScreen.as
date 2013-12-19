
package be.devine.cp3.eindopdracht.mobile.view {

import be.devine.cp3.eindopdracht.model.AppModel;

import starling.animation.Transitions;
import starling.animation.Tween;
import starling.core.Starling;

import starling.display.Button;
import starling.display.Sprite;
import starling.events.Event;

import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;
import starling.textures.TextureAtlas;
import flash.display.BitmapData;
import starling.textures.Texture;

public class MainScreen extends Sprite {

    [Embed(source="/../assets/custom/sheet.png")]
    protected static const ATLAS_IMAGE:Class;

    [Embed(source="/../assets/custom/sheet.xml",mimeType="application/octet-stream")]
    protected static const ATLAS_XML:Class;

    [Embed(source="/../assets/fonts/Fairview_Regular.otf",fontName="Fairview_Regular",mimeType="application/x-font",embedAsCFF="false")]
    protected static const FAIRVIEW_REGULAR:Class;

    private var _appModel:AppModel;
    private var _createConversion:ConversionCreate;
    private var _conversionsList:ConversionsList;

    private var _atlas:TextureAtlas;
    private var _buttonGroup:Sprite;
    private var _existingButton:Button;
    private var _newButton:Button;
    private var _title:TextField;

    public function MainScreen() {

        trace("[MainScreen] Startup");

        _appModel = AppModel.getInstance();

        const atlasBitmapData:BitmapData = (new ATLAS_IMAGE()).bitmapData;
        _atlas = new TextureAtlas(Texture.fromBitmapData(atlasBitmapData, false), XML(new ATLAS_XML()));

        addEventListener(starling.events.Event.ADDED_TO_STAGE, drawScreen);
    }

    private function drawScreen(event:starling.events.Event):void {
        _buttonGroup = new Sprite();

        _title = new TextField(480, 70, "Konvert", "FAIRVIEW_REGULAR", 60, 0xffffff);
        _buttonGroup.addChild(_title);

        _existingButton = new Button(_atlas.getTexture("btnExistingConversion"));
        _existingButton.width = 482;
        _existingButton.height = 365;
        _existingButton.x = 0;
        _existingButton.y = _title.height;
        _existingButton.scaleWhenDown = 1;
        _buttonGroup.addChild( _existingButton );

        _newButton = new Button(_atlas.getTexture("btnNewConversion"));
        _newButton.width = 482;
        _newButton.height = 365;
        _newButton.x = 0;
        _newButton.y = _title.height + _existingButton.height;
        _newButton.scaleWhenDown = 1;
        _buttonGroup.addChild( _newButton );

        addChild(_buttonGroup);

        _existingButton.addEventListener(starling.events.Event.TRIGGERED, existingTriggeredHandler);
        _newButton.addEventListener(starling.events.Event.TRIGGERED, newTriggeredHandler);
    }

    private function existingTriggeredHandler(event:starling.events.Event):void {
        trace("Choose A Conversion");

        var t:Tween = new Tween(_buttonGroup, .3, Transitions.LINEAR);
        t.animate("x", _buttonGroup.x - 500);
        Starling.juggler.add(t);

        _conversionsList = new ConversionsList();
        addChild(_conversionsList);
    }

    private function newTriggeredHandler(event:starling.events.Event):void {
        trace("Create A New Conversion");

        var t:Tween = new Tween(_buttonGroup, .3, Transitions.LINEAR);
        t.animate("x", _buttonGroup.x - 500);
        Starling.juggler.add(t);

        _createConversion = new ConversionCreate();
        addChild(_createConversion);
    }
}
}
