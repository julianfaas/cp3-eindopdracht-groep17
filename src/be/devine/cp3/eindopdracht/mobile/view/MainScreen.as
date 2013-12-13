
package be.devine.cp3.eindopdracht.mobile.view {

import be.devine.cp3.eindopdracht.model.AppModel;

import feathers.controls.Button;
import feathers.controls.ImageLoader;
import feathers.controls.LayoutGroup;
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
        var title:TextField = new TextField(300, 100, "Konvert", "FAIRVIEW_REGULAR", 60, 0xffffff);
        title.x = stage.width/2 - title.width/2;
        title.italic = true;
        title.hAlign = HAlign.CENTER;
        title.vAlign = VAlign.TOP;
        addChild(title);

        _buttonGroup = new LayoutGroup();
        _buttonGroup.addEventListener(FeathersEventType.CREATION_COMPLETE, buttonGroupCreationCompleteHandler);
        _buttonGroup.y = title.height;
        addChild(_buttonGroup);

        var layout:VerticalLayout = new VerticalLayout();
        layout.gap = 0;
        layout.padding = 10;
        _buttonGroup.layout = layout;

        _existingButton = new Button();
        _existingButton.defaultIcon = new Image(_atlas.getTexture("btn_01"));
        _existingButton.label = "Bestaande Conversie Kiezen";
        _existingButton.setSize(482, 365);
        _existingButton.x = 0;
        _buttonGroup.addChild( _existingButton );
        _existingButton.addEventListener(starling.events.Event.TRIGGERED, existingTriggeredHandler);

        _newButton = new Button();
        _newButton.defaultIcon = new Image(_atlas.getTexture("btn_02"));
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
        trace("Existingbutton clicked");
    }

    private function newTriggeredHandler(event:starling.events.Event):void {
        trace("Newbutton clicked");

    }
}
}
