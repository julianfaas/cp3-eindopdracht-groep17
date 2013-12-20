/**
 * Created with IntelliJ IDEA.
 * User: Joram
 * Date: 13/12/13
 * Time: 10:26
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.eindopdracht.mobile.view {

import be.devine.cp3.eindopdracht.model.AppModel;
import be.devine.cp3.eindopdracht.vo.ConversionVO;

import feathers.controls.TextInput;

import flash.display.BitmapData;

import starling.display.Button;
import starling.display.Quad;
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
    private var _inputValue1:TextInput;
    private var _inputValue2:TextInput;

    private var currentConversion:String;
    private var _conversionName:TextField;
    private var _conversionLabel1:TextField;
    private var _conversionLabel2:TextField;
    private var usedValue:Number;

    private var container:Sprite;

    public function ConversionDetail(conv:String) {
        trace("[ConversionsDetail] Startup");
        _appModel = AppModel.getInstance();

        const atlasBitmapData:BitmapData = (new ATLAS_IMAGE()).bitmapData;
        _atlas = new TextureAtlas(Texture.fromBitmapData(atlasBitmapData, false), XML(new ATLAS_XML()));

        currentConversion = conv;

        addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
    }

    private function addedToStageHandler(event:Event):void {
        drawScreen();
    }

    private function drawScreen():void {
        container = new Sprite();
        addChild(container);

        _title = new TextField(300, 100, "Detail Conversie", "FAIRVIEW_REGULAR", 60, 0xffffff);
        _title.x = 90;
        _title.hAlign = HAlign.CENTER;
        _title.vAlign = VAlign.TOP;
        container.addChild(_title);

        _btnMenu = new Button(_atlas.getTexture(("btnMenu")));
        _btnMenu.name = "menuConversions";
        _btnMenu.x = _btnMenu.y = 0;
        _btnMenu.scaleWhenDown = 1;
        _btnMenu.width = 75;
        _btnMenu.height = 75;
        _btnMenu.scaleWhenDown = 1;
        container.addChild( _btnMenu );

        var bg:Quad = new Quad(480,150);
        bg.color = 0xededed;
        bg.y = 75;
        container.addChild(bg);

        var bg2:Quad = new Quad(480,150);
        bg2.color = 0xecebeb;
        bg2.y = 75 + bg.height;
        container.addChild(bg2);

        var bg3:Quad = new Quad(75,300);
        bg3.color = 0x2B89B1;
        bg3.y = 75;
        container.addChild(bg3);

        for each(var conversionVO:ConversionVO in _appModel.conversions) {

            if(currentConversion == conversionVO.name) {
                usedValue = conversionVO.value_2;


                _conversionName = new TextField(300, 70, currentConversion, "FAIRVIEW_REGULAR", 30, 0x5E5E5E);
                _conversionName.x = 90;
                _conversionName.y = _title.height;
                container.addChild(_conversionName);

                _conversionLabel1 = new TextField(80, 70, conversionVO.unit_1 + "\n" + conversionVO.short_1, "EDMONDSANS_REGULAR", 18, 0xededed);
                _conversionLabel1.y = _title.height + 60;
                container.addChild(_conversionLabel1);

                _conversionLabel2 = new TextField(80, 70, conversionVO.unit_2 + "\n" + conversionVO.short_2, "EDMONDSANS_REGULAR", 18, 0xededed);
                _conversionLabel2.y = _title.height + _conversionLabel2.height + 120;
                container.addChild(_conversionLabel2);

                _inputValue1 = new TextInput();
                _inputValue1.setFocus();
                _inputValue1.text = conversionVO.value_1.toString();
                _inputValue1.restrict = "0-9"
                _inputValue1.maxChars = 10;
                _inputValue1.x = 100;
                _inputValue1.y = _title.height + _conversionName.height;
                _inputValue1.textEditorProperties.fontFamily = "EDMONDSANS_REGULAR";
                _inputValue1.textEditorProperties.fontSize = 50;
                _inputValue1.textEditorProperties.color = 0x4c4c4c;
                _inputValue1.height = 200;
                _inputValue1.width = 480;
                _inputValue1.addEventListener(Event.CHANGE, inputChangedHandler );
                container.addChild( _inputValue1 );

                _inputValue2 = new TextInput();
                _inputValue2.isEditable = false;
                _inputValue2.text = conversionVO.value_2.toString();
                _inputValue2.x = 100;
                _inputValue2.y = _title.height + _inputValue1.height;
                _inputValue2.textEditorProperties.fontFamily = "EDMONDSANS_REGULAR";
                _inputValue2.textEditorProperties.fontSize = 50;
                _inputValue2.textEditorProperties.color = 0x4c4c4c;
                _inputValue2.height = 200;
                _inputValue2.width = 480;
                container.addChild( _inputValue2 );

            }
        }

        _btnMenu.addEventListener(Event.TRIGGERED, menuTriggeredHandler);
    }

    private function menuTriggeredHandler(event:Event):void {
        removeChild(container);

        _mainMenu = new MainScreen();
        addChild(_mainMenu);
    }

    private function inputChangedHandler(event:Event):void {
        var formula:Number = Number(_inputValue1.text) * usedValue;
        formula.toFixed(2);

        _inputValue2.text = formula.toString();
    }
}
}
