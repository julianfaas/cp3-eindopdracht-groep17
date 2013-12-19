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
import feathers.controls.TextInput;
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

    private var _buttonGroup:LayoutGroup;
    private var _buttonGroup2:LayoutGroup;
    private var _screen:Sprite;
    private var _title:starling.text.TextField;

    private var _inputName:TextInput = new TextInput();
    private var _inputEenheid:TextInput = new TextInput();
    private var _inputAfkorting:TextInput = new TextInput();
    private var _inputAantal:TextInput = new TextInput();

    private var _txtName:starling.text.TextField;
    private var _txtEenheid:starling.text.TextField;
    private var _txtAfkorting:starling.text.TextField;
    private var _txtAantal:starling.text.TextField;

    private var _txtEenheid2:starling.text.TextField;
    private var _txtAfkorting2:starling.text.TextField;
    private var _txtAantal2:starling.text.TextField;

    private var _inputEenheid2:TextInput = new TextInput();
    private var _inputAfkorting2:TextInput = new TextInput();
    private var _inputAantal2:TextInput = new TextInput();

    private var _btnMenu:Button;
    private var _btnAdd:Button;

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

        _title = new TextField(300, 100, "Create", "FAIRVIEW_REGULAR", 60, 0xffffff);
        _title.x = 90;
        _title.italic = true;
        _title.hAlign = HAlign.CENTER;
        _title.vAlign = VAlign.TOP;
        _screen.addChild(_title);

        _buttonGroup = new LayoutGroup();
        _buttonGroup.addEventListener(FeathersEventType.CREATION_COMPLETE, buttonGroupCreationCompleteHandler);
        _buttonGroup.y = _title.height;
        addChild(_buttonGroup);

        var layout:VerticalLayout = new VerticalLayout();
        layout.gap = 0;
        _buttonGroup.layout = layout;
        _buttonGroup.y = 0;
        _buttonGroup.x = 0;

        _btnMenu = new Button();
        _btnMenu.defaultIcon = new Image(_atlas.getTexture("btnMenu"));
        _btnMenu.label = "Menu";
        _btnMenu.setSize(65, 65);
        _buttonGroup.addChild( _btnMenu );
        _btnMenu.addEventListener(Event.TRIGGERED, menuTriggeredHandler);

        //CONVERSIE NAAM
        _screen.addChild(_inputName);
        _inputName.x = 240;
        _inputName.textEditorProperties.fontFamily = "EDMONDSANS_REGULAR";
        _inputName.y = 100;
        _inputName.height = 50;
        _inputName.width = 240;
        _inputName.textEditorProperties.color = 0xA3A3A3;

        _txtName = new TextField(200, 100, "Naam conversie", "EDMONDSANS_REGULAR", 20, 0xffffff);
        _txtName.x = 0;
        _txtName.y = 70;
        _txtName.italic = true;
        _txtName.hAlign = HAlign.CENTER;
        _txtName.vAlign = VAlign.TOP;
        _screen.addChild(_txtName);

        //EENHEID
        _screen.addChild(_inputEenheid);
        _inputEenheid.x = 240;
        _inputEenheid.textEditorProperties.fontFamily = "EDMONDSANS_REGULAR";
        _inputEenheid.y = 200;
        _inputEenheid.height = 50;
        _inputEenheid.width = 240;
        _inputEenheid.textEditorProperties.color = 0xA3A3A3;

        _txtEenheid = new TextField(200, 100, "Eenheid", "EDMONDSANS_REGULAR", 20, 0xffffff);
        _txtEenheid.x = 0;
        _txtEenheid.y = 200;
        _txtEenheid.italic = true;
        _txtEenheid.hAlign = HAlign.CENTER;
        _txtEenheid.vAlign = VAlign.TOP;
        _screen.addChild(_txtEenheid);

        //AFKORTING
        _screen.addChild(_inputAfkorting);
        _inputAfkorting.x = 240;
        _inputAfkorting.textEditorProperties.fontFamily = "EDMONDSANS_REGULAR";
        _inputAfkorting.y = 300;
        _inputAfkorting.height = 50;
        _inputAfkorting.width = 240;
        _inputAfkorting.textEditorProperties.color = 0xA3A3A3;

        _txtAfkorting = new TextField(200, 100, "Afkorting", "EDMONDSANS_REGULAR", 20, 0xffffff);
        _txtAfkorting.x = 0;
        _txtAfkorting.y = 300;
        _txtAfkorting.italic = true;
        _txtAfkorting.hAlign = HAlign.CENTER;
        _txtAfkorting.vAlign = VAlign.TOP;
        _screen.addChild(_txtAfkorting);

        //AANTAL
        _screen.addChild(_inputAantal);
        _inputAantal.x = 240;
        _inputAantal.textEditorProperties.fontFamily = "EDMONDSANS_REGULAR";
        _inputAantal.y = 400;
        _inputAantal.height = 50;
        _inputAantal.width = 240;
        _inputAantal.textEditorProperties.color = 0xA3A3A3;

        _txtAantal = new TextField(200, 100, "Aantal", "EDMONDSANS_REGULAR", 20, 0xffffff);
        _txtAantal.x = 0;
        _txtAantal.y = 400;
        _txtAantal.italic = true;
        _txtAantal.hAlign = HAlign.CENTER;
        _txtAantal.vAlign = VAlign.TOP;
        _screen.addChild(_txtAantal);

        //AANTAL2
        _screen.addChild(_inputAantal2);
        _inputAantal2.x = 240;
        _inputAantal2.textEditorProperties.fontFamily = "EDMONDSANS_REGULAR";
        _inputAantal2.y = 500;
        _inputAantal2.height = 50;
        _inputAantal2.width = 240;
        _inputAantal2.textEditorProperties.color = 0xA3A3A3;

        _txtAantal2 = new TextField(200, 100, "Aantal", "EDMONDSANS_REGULAR", 20, 0xffffff);
        _txtAantal2.x = 0;
        _txtAantal2.y = 500;
        _txtAantal2.italic = true;
        _txtAantal2.hAlign = HAlign.CENTER;
        _txtAantal2.vAlign = VAlign.TOP;
        _screen.addChild(_txtAantal2);

        //EENHEID2
        _screen.addChild(_inputEenheid2);
        _inputEenheid2.x = 240;
        _inputEenheid2.textEditorProperties.fontFamily = "EDMONDSANS_REGULAR";
        _inputEenheid2.y = 600;
        _inputEenheid2.height = 50;
        _inputEenheid2.width = 240;
        _inputEenheid2.textEditorProperties.color = 0xA3A3A3;

        _txtEenheid2 = new TextField(200, 100, "Eenheid", "EDMONDSANS_REGULAR", 20, 0xffffff);
        _txtEenheid2.x = 0;
        _txtEenheid2.y = 600;
        _txtEenheid2.italic = true;
        _txtEenheid2.hAlign = HAlign.CENTER;
        _txtEenheid2.vAlign = VAlign.TOP;
        _screen.addChild(_txtEenheid2);

        //AFKORTING2
        _screen.addChild(_inputAfkorting2);
        _inputAfkorting2.x = 240;
        _inputAfkorting2.textEditorProperties.fontFamily = "EDMONDSANS_REGULAR";
        _inputAfkorting2.y = 700;
        _inputAfkorting2.height = 50;
        _inputAfkorting2.width = 240;
        _inputAfkorting2.textEditorProperties.color = 0xA3A3A3;

        _txtAfkorting2 = new TextField(200, 100, "Afkorting", "EDMONDSANS_REGULAR", 20, 0xffffff);
        _txtAfkorting2.x = 0;
        _txtAfkorting2.y = 700;
        _txtAfkorting2.italic = true;
        _txtAfkorting2.hAlign = HAlign.CENTER;
        _txtAfkorting2.vAlign = VAlign.TOP;
        _screen.addChild(_txtAfkorting2);

        _buttonGroup2 = new LayoutGroup();
        _buttonGroup2.addEventListener(FeathersEventType.CREATION_COMPLETE, buttonGroupCreationCompleteHandler);
        _buttonGroup2.y = _title.height;
        addChild(_buttonGroup2);

        var layout:VerticalLayout = new VerticalLayout();
        layout.gap = 0;
        _buttonGroup2.layout = layout;
        _buttonGroup2.y = 750;
        _buttonGroup2.x = 0;

        _btnAdd = new Button();
        _btnAdd.label = "Voeg conversie toe";
        _btnAdd.setSize(480, 65);
        _buttonGroup2.addChild( _btnAdd );
        _btnAdd.addEventListener(Event.TRIGGERED, addTriggeredHandler);
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
        removeChild(_buttonGroup);
        _mainMenu = new MainScreen();
        addChild(_mainMenu);
    }

    private function addTriggeredHandler(event:starling.events.Event):void {
        trace("Add conversion");
    }
}
}
