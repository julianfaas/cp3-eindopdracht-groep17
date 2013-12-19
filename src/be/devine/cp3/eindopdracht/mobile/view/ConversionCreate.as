/**
 * Created with IntelliJ IDEA.
 * User: Joram
 * Date: 16/12/13
 * Time: 15:03
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.eindopdracht.mobile.view {
import be.devine.cp3.eindopdracht.model.AppModel;


import feathers.controls.LayoutGroup;
import feathers.controls.TextArea;
import feathers.controls.TextInput;
import feathers.controls.text.StageTextTextEditor;
import feathers.core.ITextEditor;
import feathers.display.Scale9Image;
import feathers.events.FeathersEventType;
import feathers.layout.VerticalLayout;

import flash.display.BitmapData;
import flash.text.TextFormatAlign;

import starling.display.Button;

import starling.display.Image;
import starling.display.Quad;

import starling.display.Sprite;
import starling.events.Event;
import starling.text.TextField;
import starling.textures.Texture;
import starling.textures.TextureAtlas;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class ConversionCreate extends Sprite {

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

    private var _screen:Sprite;
    private var _title:starling.text.TextField;

    private var _inputName:TextInput;
    private var _inputEenheid:TextInput;
    private var _inputAfkorting:TextInput;
    private var _inputAantal:TextInput;

    private var _txtName:starling.text.TextField;
    private var _txtEenheid:starling.text.TextField;
    private var _txtAfkorting:starling.text.TextField;
    private var _txtAantal:starling.text.TextField;

    private var _txtEenheid2:starling.text.TextField;
    private var _txtAfkorting2:starling.text.TextField;
    private var _txtAantal2:starling.text.TextField;

    private var _inputEenheid2:TextInput;
    private var _inputAfkorting2:TextInput;
    private var _inputAantal2:TextInput;

    private var _btnMenu:Button;
    private var _btnAddConversion:Button;

    private var _mainMenu:MainScreen;

    private var _explicitWidth:Number = 0;
    private var _explicitHeight:Number = 0;

    public function ConversionCreate() {
        trace("[CREATECONVERSIONSCREEN] Startup");

        _appModel = AppModel.getInstance();

        const atlasBitmapData:BitmapData = (new ATLAS_IMAGE()).bitmapData;
        _atlas = new TextureAtlas(Texture.fromBitmapData(atlasBitmapData, false), XML(new ATLAS_XML()));

        addEventListener(starling.events.Event.ADDED_TO_STAGE, addedToStageHandler);
    }

    private function addedToStageHandler(event:starling.events.Event):void {
        drawScreen();
    }

    private function drawScreen():void{
        _screen = new Sprite();
        addChild(_screen);

        drawBackgroundScreen();

        _title = new TextField(300, 100, "Create", "FAIRVIEW_REGULAR", 60, 0xffffff);
        _title.x = 90;
        _title.italic = true;
        _title.hAlign = HAlign.CENTER;
        _title.vAlign = VAlign.TOP;
        _screen.addChild(_title);


        _btnMenu = new Button(_atlas.getTexture(("btnMenu")));
        _btnMenu.x = _btnMenu.y = 0;
        _btnMenu.width = 75;
        _btnMenu.height = 75;
        _screen.addChild( _btnMenu );
        _btnMenu.addEventListener(starling.events.Event.TRIGGERED, menuTriggeredHandler);

        //CONVERSIE NAAM
        _inputName = new TextInput();
        _inputName.x = 200;
        _inputName.textEditorProperties.fontFamily = "EDMONDSANS_REGULAR";
        _inputName.y = 75;
        _inputName.textEditorProperties.fontSize = 25;
        _inputName.paddingTop = 7;
        _inputName.height = 50;
        _inputName.width = 240;
        _inputName.textEditorProperties.color = 0xA3A3A3;
        _inputName.backgroundSkin = new Image(_atlas.getTexture('bgInput'));
        _screen.addChild(_inputName);

        _txtName = new TextField(200, 100, "Naam conversie:", "EDMONDSANS_REGULAR", 20, 0xa3a3a3);
        _txtName.x = 0;
        _txtName.y = 45;
        _txtName.italic = true;
        _txtName.hAlign = HAlign.CENTER;
        _txtName.vAlign = VAlign.TOP;
        _screen.addChild(_txtName);

        //EENHEID
        _inputEenheid = new TextInput();
        _inputEenheid.x = 200;
        _inputEenheid.paddingTop = 7;
        _inputEenheid.y = 150;
        _inputEenheid.height = 50;
        _inputEenheid.width = 240;
        _inputEenheid.textEditorFactory = function():ITextEditor
        {
            var editor:StageTextTextEditor = new StageTextTextEditor();
            editor.fontFamily = "EDMONDSANS_REGULAR";
            editor.color = 0xA3A3A3;
            editor.fontSize = 25;
            return editor;
        }
        _inputEenheid.backgroundSkin = new Image(_atlas.getTexture('bgInput'));
        _screen.addChild(_inputEenheid);

        _txtEenheid = new TextField(200, 100, "Eenheid:", "EDMONDSANS_REGULAR", 20, 0xa3a3a3);
        _txtEenheid.x = 0;
        _txtEenheid.y = 160;
        _txtEenheid.italic = true;
        _txtEenheid.hAlign = HAlign.CENTER;
        _txtEenheid.vAlign = VAlign.TOP;
        _screen.addChild(_txtEenheid);

        //AFKORTING
        _inputAfkorting = new TextInput();
        _inputAfkorting.x = 200;
        _inputAfkorting.paddingTop = 7;
        _inputAfkorting.y = 205;
        _inputAfkorting.height = 50;
        _inputAfkorting.width = 240;
        _inputAfkorting.textEditorFactory = function():ITextEditor
        {
            var editor:StageTextTextEditor = new StageTextTextEditor();
            editor.fontFamily = "EDMONDSANS_REGULAR";
            editor.color = 0xA3A3A3;
            editor.fontSize = 25;
            return editor;
        }
        _inputAfkorting.backgroundSkin = new Image(_atlas.getTexture('bgInput'));
        _screen.addChild(_inputAfkorting);

        _txtAfkorting = new TextField(200, 100, "Afkorting:", "EDMONDSANS_REGULAR", 20, 0xa3a3a3);
        _txtAfkorting.x = 0;
        _txtAfkorting.y = 220;
        _txtAfkorting.italic = true;
        _txtAfkorting.hAlign = HAlign.CENTER;
        _txtAfkorting.vAlign = VAlign.TOP;
        _screen.addChild(_txtAfkorting);

        //AANTAL
        _inputAantal = new TextInput();
        _inputAantal.x = 175;
        _inputAantal.y = 340;
        _inputAantal.height = 50;
        _inputAantal.width = 150;
        _inputAantal.restrict = "0-9" + ".";
        _inputAantal.textEditorFactory = function():ITextEditor
        {
            var editor:StageTextTextEditor = new StageTextTextEditor();
            editor.fontFamily = "EDMONDSANS_REGULAR";
            editor.color = 0xA3A3A3;
            editor.fontSize = 25;
            return editor;
        }
        _inputAantal.backgroundSkin = new Image(_atlas.getTexture('bgInput'));
        _screen.addChild(_inputAantal);

        _txtAantal = new TextField(200, 100, "Aantal:", "EDMONDSANS_REGULAR", 20, 0xa3a3a3);
        _txtAantal.x = 20;
        _txtAantal.y = 350;
        _txtAantal.italic = true;
        _txtAantal.hAlign = HAlign.CENTER;
        _txtAantal.vAlign = VAlign.TOP;
        _screen.addChild(_txtAantal);

        //AANTAL2
        _inputAantal2 = new TextInput();
        _inputAantal2.x = 175;
        _inputAantal2.y = 460;
        _inputAantal2.height = 50;
        _inputAantal2.width = 150;
        _inputAantal2.restrict = "0-9" + ".";
        _inputAantal2.textEditorFactory = function():ITextEditor
        {
            var editor:StageTextTextEditor = new StageTextTextEditor();
            editor.fontFamily = "EDMONDSANS_REGULAR";
            editor.color = 0xA3A3A3;
            editor.fontSize = 25;
            return editor;
        }
        _inputAantal2.backgroundSkin = new Image(_atlas.getTexture('bgInput'));
        _screen.addChild(_inputAantal2);

        _txtAantal2 = new TextField(200, 100, "Aantal:", "EDMONDSANS_REGULAR", 20, 0xa3a3a3);
        _txtAantal2.x = 20;
        _txtAantal2.y = 470;
        _txtAantal2.italic = true;
        _txtAantal2.hAlign = HAlign.CENTER;
        _txtAantal2.vAlign = VAlign.TOP;
        _screen.addChild(_txtAantal2);

        //EENHEID2
        _inputEenheid2 = new TextInput();
        _inputEenheid2.x = 200;
        _inputEenheid2.y = 595;
        _inputEenheid2.height = 50;
        _inputEenheid2.width = 240;
        _inputEenheid2.paddingTop = 7;
        _inputEenheid2.backgroundSkin = new Image(_atlas.getTexture('bgInput'));
        _inputEenheid2.textEditorFactory = function():ITextEditor
        {
            var editor:StageTextTextEditor = new StageTextTextEditor();
            editor.fontFamily = "EDMONDSANS_REGULAR";
            editor.color = 0xA3A3A3;
            editor.fontSize = 25;
            return editor;
        }
        _screen.addChild(_inputEenheid2);


        _txtEenheid2 = new TextField(200, 100, "Eenheid:", "EDMONDSANS_REGULAR", 20, 0xa3a3a3);
        _txtEenheid2.x = 0;
        _txtEenheid2.y = 605;
        _txtEenheid2.italic = true;
        _txtEenheid2.hAlign = HAlign.CENTER;
        _txtEenheid2.vAlign = VAlign.TOP;
        _screen.addChild(_txtEenheid2);


        //AFKORTING2
        _inputAfkorting2 = new TextInput();
        _inputAfkorting2.y = 650;
        _inputAfkorting2.x = 200;
        _inputAfkorting2.height = 50;
        _inputAfkorting2.paddingTop = 7;
        _inputAfkorting2.textEditorFactory = function():ITextEditor
        {
            var editor:StageTextTextEditor = new StageTextTextEditor();
            editor.fontFamily = "EDMONDSANS_REGULAR";
            editor.color = 0xA3A3A3;
            editor.fontSize = 25;
            return editor;
        }
        _inputAfkorting2.backgroundSkin = new Image(_atlas.getTexture('bgInput'));
        _screen.addChild(_inputAfkorting2);

        _txtAfkorting2 = new TextField(200, 100, "Afkorting:", "EDMONDSANS_REGULAR", 20, 0xa3a3a3);
        _txtAfkorting2.x = 0;
        _txtAfkorting2.y = 660;
        _txtAfkorting2.italic = true;
        _txtAfkorting2.hAlign = HAlign.CENTER;
        _txtAfkorting2.vAlign = VAlign.TOP;
        _screen.addChild(_txtAfkorting2);

        _btnAddConversion = new Button(_atlas.getTexture(("btnAddConversion")));
        _btnAddConversion.y = 750;
        _btnAddConversion.width = 480;
        _btnAddConversion.height = 50;
        _screen.addChild( _btnAddConversion );
        _btnAddConversion.addEventListener(starling.events.Event.TRIGGERED, addTriggeredHandler);

    }

    private function drawBackgroundScreen():void{
        var bg:Quad = new Quad(480,350);
        bg.color = 0xededed;
        bg.y = 75;
        _screen.addChild(bg);

        var bg2:Quad = new Quad(480,350);
        bg2.color = 0xe8e7e7;
        bg2.y = 425;
        _screen.addChild(bg2);


        var bgInput:Quad = new Quad(480,50);
        bgInput.color = 0xffffff;
        bgInput.y = 75;
        _screen.addChild(bgInput);

        var bgInput2:Quad = new Quad(480,50);
        bgInput2.color = 0xffffff;
        bgInput2.y = 150;
        _screen.addChild(bgInput2);

        var bgInput3:Quad = new Quad(480,50);
        bgInput3.color = 0xffffff;
        bgInput3.y = 205;
        _screen.addChild(bgInput3);

        var bgInput4:Quad = new Quad(480,50);
        bgInput4.color = 0xffffff;
        bgInput4.y = 595;
        _screen.addChild(bgInput4);

        var bgInput5:Quad = new Quad(480,50);
        bgInput5.color = 0xffffff;
        bgInput5.y = 650;
        _screen.addChild(bgInput5);
    }


    private function buttonGroupCreationCompleteHandler(event:starling.events.Event):void {
        setSize(_explicitWidth, _explicitHeight);
    }

    public function setSize(w:Number, h:Number):void {
        _explicitWidth = w;
        _explicitHeight = h;
    }

    private function menuTriggeredHandler(event:starling.events.Event):void {
        removeChild(_screen);
        _mainMenu = new MainScreen();
        addChild(_mainMenu);
    }

    private function addTriggeredHandler(event:starling.events.Event):void {

        if(_inputAantal.text
           && _inputAantal2.text
           && _inputName.text
           && _inputAfkorting.text
           && _inputAfkorting2.text
           && _inputEenheid.text
           && _inputEenheid2.text != ""){

        trace("Add conversion" + _inputAantal.text + _inputAfkorting.text + " " +_inputAantal2.text + _inputAfkorting2.text);
        }
    }
}
}
