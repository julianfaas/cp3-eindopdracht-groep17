/**
 * Created with IntelliJ IDEA.
 * User: Joram
 * Date: 16/12/13
 * Time: 13:39
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.eindopdracht.mobile.view {

import be.devine.cp3.eindopdracht.model.AppModel;
import be.devine.cp3.eindopdracht.vo.ConversionVO;

import flash.display.BitmapData;
import flash.geom.Rectangle;

import starling.animation.Transitions;

import starling.animation.Tween;
import starling.core.Starling;

import starling.display.Button;
import starling.display.Sprite;
import starling.events.Event;
import starling.text.TextField;
import starling.textures.Texture;
import starling.textures.TextureAtlas;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class ConversionsList extends Sprite {

    [Embed(source="/../assets/custom/sheet.png")]
    protected static const ATLAS_IMAGE:Class;

    [Embed(source="/../assets/custom/sheet.xml",mimeType="application/octet-stream")]
    protected static const ATLAS_XML:Class;

    [Embed(source="/../assets/fonts/Fairview_Regular.otf",fontName="Fairview_Regular",mimeType="application/x-font",embedAsCFF="false")]
    protected static const FAIRVIEW_REGULAR:Class;

    [Embed(source="/../assets/fonts/Edmondsans-Regular.otf",fontName="Edmondsans-Regular",mimeType="application/x-font",embedAsCFF="false")]
    protected static const EDMONDSANS_REGULAR:Class;

    private var _createConversion:ConversionCreate;
    private var _detailConversion:ConversionDetail;

    private var _btnMenu:Button;
    private var _btnNew:Button;
    private var _mainMenu:MainScreen;
    private var _appModel:AppModel;

    private var _atlas:TextureAtlas;
    private var _title:TextField;
    private var conversionItem:Button;
    private var listContainer:Sprite;
    private var textBound:Rectangle;

    public function ConversionsList() {
        trace("[ConversionsList] Startup");
        _appModel = AppModel.getInstance();

        const atlasBitmapData:BitmapData = (new ATLAS_IMAGE()).bitmapData;
        _atlas = new TextureAtlas(Texture.fromBitmapData(atlasBitmapData, false), XML(new ATLAS_XML()));

        addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
    }

    private function addedToStageHandler(event:Event):void {
        drawScreen();
    }

    private function drawScreen():void {
        _title = new TextField(300, 70, "Conversions", "FAIRVIEW_REGULAR", 60, 0xffffff);
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

        _btnNew = new Button(_atlas.getTexture(("new-btn")));
        _btnNew.name = "newConversion";
        _btnNew.width = 77;
        _btnNew.height = 70;
        _btnNew.x = stage.width - _btnNew.width;
        _btnNew.scaleWhenDown = 1;
        addChild( _btnNew );

        _btnMenu.addEventListener(Event.TRIGGERED, menuTriggeredHandler);
        _btnNew.addEventListener(Event.TRIGGERED, menuTriggeredHandler);

         makeList();
    }

    private function makeList():void {
        listContainer = new Sprite();
        listContainer.x = 0;
        listContainer.y = _title.height;

        var items:uint = 0;
        var yPos:uint = 0;

        for each(var conversionVO:ConversionVO in _appModel.conversions) {
            trace("[ConversionsList]" + conversionVO.name, conversionVO.unit_1, conversionVO.unit_2, conversionVO.value_1, conversionVO.value_2);

            if(items % 2 == 0) {
                conversionItem = new Button(_atlas.getTexture("bgList1"));
            } else {
                conversionItem = new Button(_atlas.getTexture("bgList2"));
            }
            conversionItem.fontName = "Edmondsans-Regular";
            conversionItem.fontSize = 18;
            conversionItem.fontColor = 0x2B89B1;
            conversionItem.scaleWhenDown = 1;
            conversionItem.textHAlign = HAlign.LEFT;
            textBound = new Rectangle(30, 0, conversionItem.textBounds.width, conversionItem.textBounds.height);
            conversionItem.textBounds = textBound;
            conversionItem.name = conversionVO.name;
            conversionItem.text = conversionVO.name + "\n" + conversionVO.unit_1 + " - " + conversionVO.unit_2;
            conversionItem.y = yPos;

            yPos += conversionItem.height;
            items++;
            conversionItem.addEventListener(Event.TRIGGERED, selectedConversionHandler);
            listContainer.addChild( conversionItem );
        }
        addChild( listContainer );
    }

    private function menuTriggeredHandler(event:Event):void {
        var current = event.currentTarget;

        removeChild(_title);
        removeChild(_btnMenu);
        removeChild(_btnNew);
        removeChild(listContainer);

        if(current.name == "menuConversions") {
            _mainMenu = new MainScreen();
            addChild(_mainMenu);
        } else {
            _createConversion = new ConversionCreate();
            addChild(_createConversion);
        }
    }

    private function selectedConversionHandler(event:Event):void {
        var current = event.currentTarget;
        trace(current.name);

        removeChild(_title);
        removeChild(_btnMenu);
        removeChild(_btnNew);

        var t:Tween = new Tween(listContainer, .5, Transitions.LINEAR);
        t.animate("x", listContainer.x - 1000);
        Starling.juggler.add(t);

        _detailConversion = new ConversionDetail();
        addChild( _detailConversion );
    }
}
}
