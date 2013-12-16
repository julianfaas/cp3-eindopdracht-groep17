/**
 * Created with IntelliJ IDEA.
 * User: Joram
 * Date: 16/12/13
 * Time: 15:03
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.eindopdracht.mobile.view {
import be.devine.cp3.eindopdracht.model.AppModel;

import feathers.controls.Button;

import feathers.controls.LayoutGroup;
import feathers.events.FeathersEventType;
import feathers.layout.VerticalLayout;

import flash.display.BitmapData;

import starling.display.Image;

import starling.display.Sprite;
import starling.events.Event;
import starling.text.TextField;
import starling.textures.Texture;
import starling.textures.TextureAtlas;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class CreateConversionScreen extends Sprite {

    [Embed(source="/../assets/custom/sheet.png")]
    protected static const ATLAS_IMAGE:Class;

    [Embed(source="/../assets/custom/sheet.xml",mimeType="application/octet-stream")]
    protected static const ATLAS_XML:Class;

    [Embed(source="/../assets/fonts/Fairview_Regular.otf",fontName="Fairview_Regular",mimeType="application/x-font",embedAsCFF="false")]
    protected static const FAIRVIEW_REGULAR:Class;

    private var _appModel:AppModel;
    private var _atlas:TextureAtlas;

    private var _buttonGroup:LayoutGroup;
    private var _title:TextField;
    private var _btnMenu:Button;

    private var _mainMenu:MainScreen;

    private var _explicitWidth:Number = 0;
    private var _explicitHeight:Number = 0;

    public function CreateConversionScreen() {

        trace("[CREATECONVERSIONSCREEN] + initialized");
        _appModel = AppModel.getInstance();

        const atlasBitmapData:BitmapData = (new ATLAS_IMAGE()).bitmapData;
        _atlas = new TextureAtlas(Texture.fromBitmapData(atlasBitmapData, false), XML(new ATLAS_XML()));

        addEventListener(starling.events.Event.ADDED_TO_STAGE, addedToStageHandler);
    }

    private function addedToStageHandler(event:starling.events.Event):void {
        drawScreen();

    }

    private function drawScreen():void{
        _title = new TextField(300, 100, "Create", "FAIRVIEW_REGULAR", 60, 0xffffff);
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
        _buttonGroup.layout = layout;
        _buttonGroup.y = 0;
        _buttonGroup.x = 0;

        _btnMenu = new feathers.controls.Button();
        _btnMenu.defaultIcon = new Image(_atlas.getTexture("btnMenu"));
        _btnMenu.label = "Menu";
        _btnMenu.setSize(65, 65);
        _buttonGroup.addChild( _btnMenu );
        _btnMenu.addEventListener(starling.events.Event.TRIGGERED, menuTriggeredHandler);
    }

    private function buttonGroupCreationCompleteHandler(event:starling.events.Event):void {
        setSize(_explicitWidth, _explicitHeight);
    }

    public function setSize(w:Number, h:Number):void {
        _explicitWidth = w;
        _explicitHeight = h;
    }

    private function menuTriggeredHandler(event:starling.events.Event):void {
        removeChild(_title);
        removeChild(_buttonGroup);
        _mainMenu = new MainScreen();
        addChild(_mainMenu);
    }
}
}
