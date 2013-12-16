
package be.devine.cp3.eindopdracht.mobile.view {

import be.devine.cp3.eindopdracht.model.AppModel;

import feathers.controls.Button;
import feathers.controls.ImageLoader;
import feathers.controls.LayoutGroup;
import feathers.controls.Screen;
import feathers.controls.ScreenNavigator;
import feathers.controls.ScreenNavigatorItem;
import feathers.events.FeathersEventType;
import feathers.layout.HorizontalLayout;
import feathers.layout.VerticalLayout;

import flash.events.Event;

import starling.display.Image;

import flash.events.Event;

import starling.display.Image;

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
    private var _atlas:TextureAtlas;
    private var _buttonGroup:LayoutGroup;
    private var _existingButton:Button;
    private var _newButton:Button;
    private var _title:TextField;

    private var _explicitWidth:Number = 0;
    private var _explicitHeight:Number = 0;

    public function MainScreen() {


        trace("[MainScreen] Startup");

        _appModel = AppModel.getInstance();

        const atlasBitmapData:BitmapData = (new ATLAS_IMAGE()).bitmapData;
        _atlas = new TextureAtlas(Texture.fromBitmapData(atlasBitmapData, false), XML(new ATLAS_XML()));

        addEventListener(starling.events.Event.ADDED_TO_STAGE, addedToStageHandler);

    }


    private function addedToStageHandler(event:starling.events.Event):void {
        _title = new TextField(300, 100, "Konvert", "FAIRVIEW_REGULAR", 60, 0xffffff);
        _title.x = 90;
        _title.italic = true;
        _title.hAlign = HAlign.CENTER;
        _title.vAlign = VAlign.TOP;
        addChild(_title);

        _buttonGroup = new LayoutGroup();
        _buttonGroup.addEventListener(FeathersEventType.CREATION_COMPLETE, buttonGroupCreationCompleteHandler);
        _buttonGroup.y = _title.height;
        addChild(_buttonGroup);

        var layout:VerticalLayout = new VerticalLayout();
        layout.gap = 0;
        layout.padding = 10;
        _buttonGroup.layout = layout;

        _existingButton = new Button();
        _existingButton.defaultIcon = new Image(_atlas.getTexture("btnExistingConversion"));
        _existingButton.label = "Bestaande Conversie Kiezen";
        _existingButton.setSize(482, 365);
        _existingButton.x = 0;
        _buttonGroup.addChild( _existingButton );
        _existingButton.addEventListener(starling.events.Event.TRIGGERED, existingTriggeredHandler);

        _newButton = new Button();
        _newButton.defaultIcon = new Image(_atlas.getTexture("btnNewConversion"));
        _newButton.label = "Nieuwe Conversie Toevoegen";
        _newButton.setSize(482, 365);
        _buttonGroup.addChild( _newButton );
        _newButton.addEventListener(starling.events.Event.TRIGGERED, newTriggeredHandler);

    }

    private function buttonGroupCreationCompleteHandler(event:starling.events.Event):void {
        setSize(_explicitWidth, _explicitHeight);
    }

    public function setSize(w:Number, h:Number):void {
        _explicitWidth = w;
        _explicitHeight = h;
    }

    private function existingTriggeredHandler(event:starling.events.Event):void {
        trace("Existing list");

        removeChild(_title);
        removeChild(_buttonGroup);
        var _conversionsList = new ConversionsList();
        addChild(_conversionsList);

    }

    private function newTriggeredHandler(event:starling.events.Event):void {
        trace("Create Conversion");

    }
}
}
