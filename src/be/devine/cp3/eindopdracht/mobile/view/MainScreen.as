
package be.devine.cp3.eindopdracht.mobile.view {

import be.devine.cp3.eindopdracht.model.AppModel;

import feathers.controls.Button;
import feathers.controls.LayoutGroup;
import feathers.events.FeathersEventType;
import feathers.layout.HorizontalLayout;
import feathers.layout.VerticalLayout;

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

        var title:TextField = new TextField(480, 70, "Konvert", "FAIRVIEW_REGULAR", 60, 0xffffff);
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
        _existingButton.setSize(480, 365);
        _buttonGroup.addChild( _existingButton );

        _newButton = new Button();
        _newButton.defaultIcon = new Image(_atlas.getTexture("btn_02"));
        _newButton.label = "Nieuwe Conversie Toevoegen";
        _newButton.setSize(480, 365);
        _buttonGroup.addChild( _newButton );
    }

    private function buttonGroupCreationCompleteHandler(event:starling.events.Event):void {
        setSize(_explicitWidth, _explicitHeight);
    }

    public function setSize(w:Number, h:Number):void {
        _explicitWidth = w;
        _explicitHeight = h;
    }
}
}
