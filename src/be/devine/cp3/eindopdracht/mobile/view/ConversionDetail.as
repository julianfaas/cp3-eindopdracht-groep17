/**
 * Created with IntelliJ IDEA.
 * User: Joram
 * Date: 13/12/13
 * Time: 10:26
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.eindopdracht.mobile.view {

import be.devine.cp3.eindopdracht.model.AppModel;

import feathers.controls.TextInput;

import flash.display.BitmapData;

import starling.display.Button;
import starling.display.Sprite;
import starling.events.Event;
import starling.text.TextField;
import starling.textures.Texture;
import starling.textures.TextureAtlas;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class ConversionDetail extends Sprite {

    [Embed(source="/../assets/custom/sheet.png")]
    protected static const ATLAS_IMAGE:Class;

    [Embed(source="/../assets/custom/sheet.xml",mimeType="application/octet-stream")]
    protected static const ATLAS_XML:Class;

    [Embed(source="/../assets/fonts/Fairview_Regular.otf",fontName="Fairview_Regular",mimeType="application/x-font",embedAsCFF="false")]
    protected static const FAIRVIEW_REGULAR:Class;

    [Embed(source="/../assets/fonts/Edmondsans-Regular.otf",fontName="Edmondsans-Regular",mimeType="application/x-font",embedAsCFF="false")]
    protected static const EDMONDSANS_REGULAR:Class;

    private var _appModel:AppModel;
    private var _atlas:TextureAtlas;
    private var _title:TextField;
    private var _btnMenu:Button;
    private var _mainMenu:MainScreen;
    private var valueContainer1:Sprite;
    private var valueContainer2:Sprite;
    private var _inputValue1:TextInput;
    private var _inputValue2:TextInput;

    public function ConversionDetail() {
        trace("[ConversionsDetail] Startup");
        _appModel = AppModel.getInstance();

        const atlasBitmapData:BitmapData = (new ATLAS_IMAGE()).bitmapData;
        _atlas = new TextureAtlas(Texture.fromBitmapData(atlasBitmapData, false), XML(new ATLAS_XML()));

        addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
    }

    private function addedToStageHandler(event:Event):void {
        drawScreen();
    }

    private function drawScreen():void {
        _title = new TextField(300, 70, "Detail Conversie", "FAIRVIEW_REGULAR", 60, 0xffffff);
        _title.x = 90;
        _title.hAlign = HAlign.CENTER;
        _title.vAlign = VAlign.TOP;
        addChild(_title);

        _btnMenu = new Button(_atlas.getTexture(("btnMenu")));
        _btnMenu.name = "menuConversions";
        _btnMenu.x = _btnMenu.y = 0;
        _btnMenu.width = 75;
        _btnMenu.height = 70;
        _btnMenu.scaleWhenDown = 1;
        addChild( _btnMenu );

        valueContainer1 = new Sprite();
        valueContainer2 = new Sprite();

        _inputValue1 = new TextInput();
        _inputValue1.setFocus();
        _inputValue1.text = "0000";
        _inputValue1.restrict = "0-9"
        _inputValue1.maxChars = 10;
        _inputValue1.x = 0;
        _inputValue1.y = _title.height;
        _inputValue1.textEditorProperties.fontFamily = "EDMONDSANS_REGULAR";
        _inputValue1.textEditorProperties.fontSize = 50;
        _inputValue1.textEditorProperties.color = 0xffffff;
        _inputValue1.height = 200;
        _inputValue1.width = 480;
        addChild( _inputValue1 );

        _inputValue2 = new TextInput();
        _inputValue2.isEditable = false;
        _inputValue2.text = "0000";
        _inputValue2.x = 0;
        _inputValue2.y = _title.height + _inputValue1.height;
        _inputValue2.textEditorProperties.fontFamily = "EDMONDSANS_REGULAR";
        _inputValue2.textEditorProperties.fontSize = 50;
        _inputValue2.textEditorProperties.color = 0xffffff;
        _inputValue2.height = 200;
        _inputValue2.width = 480;
        addChild( _inputValue2 );

        _btnMenu.addEventListener(Event.TRIGGERED, menuTriggeredHandler);
    }

    private function menuTriggeredHandler(event:Event):void {
        removeChild(_title);
        removeChild(_btnMenu);
        removeChild(_inputValue1);
        removeChild(_inputValue2);

        _mainMenu = new MainScreen();
        addChild(_mainMenu);
    }
}
}
