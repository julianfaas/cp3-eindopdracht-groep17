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

    private var _createConversion:ConversionCreate;

    private var _btnMenu:Button;
    private var _btnNewConversion:Button;
    private var _mainMenu:MainScreen;
    private var _appModel:AppModel;

    private var _atlas:TextureAtlas;
    private var _title:TextField;
    private var conversionItem:Button;
    private var listContainer:Sprite;

    public function ConversionsList() {
        trace("[ConversionsList] Startup");
        _appModel = AppModel.getInstance();

        const atlasBitmapData:BitmapData = (new ATLAS_IMAGE()).bitmapData;
        _atlas = new TextureAtlas(Texture.fromBitmapData(atlasBitmapData, false), XML(new ATLAS_XML()));

        addEventListener(starling.events.Event.ADDED_TO_STAGE, addedToStageHandler);
    }

    private function addedToStageHandler(event:starling.events.Event):void {
        drawScreen();
    }

    private function drawScreen():void{
        _title = new TextField(300, 70, "Conversions", "FAIRVIEW_REGULAR", 60, 0xffffff);
        _title.x = 90;
        _title.hAlign = HAlign.CENTER;
        _title.vAlign = VAlign.TOP;
        addChild(_title);

        _btnMenu = new Button(_atlas.getTexture(("btnMenu")));
        _btnMenu.x = _btnMenu.y = 0;
        _btnMenu.width = 75;
        _btnMenu.height = 75;
        addChild( _btnMenu );
        _btnMenu.addEventListener(starling.events.Event.TRIGGERED, menuTriggeredHandler);

        _btnNewConversion = new Button(_atlas.getTexture(("btnNewConversion")));
        _btnNewConversion.x = stage.width - _btnNewConversion.width;
        addChild( _btnNewConversion );
        _btnNewConversion.addEventListener(starling.events.Event.TRIGGERED, newTriggeredHandler);

         makeList();
    }

    private function makeList():void {
        listContainer = new Sprite();
        listContainer.x = 0;
        listContainer.y = _title.height;

        var yPos:uint = 0;
        for each(var conversionVO:ConversionVO in _appModel.conversions) {
            trace("[ConversionsListScreen] Naam = " + conversionVO.name, conversionVO.unit_1, conversionVO.unit_2);

            conversionItem = new Button(_atlas.getTexture("bgList1"));
            conversionItem.text = conversionVO.name;
            conversionItem.y = yPos;
            yPos += conversionItem.height;
            listContainer.addChild( conversionItem );
        }
        addChild( listContainer );
    }

    private function menuTriggeredHandler(event:starling.events.Event):void {
        removeChild(_title);
        removeChild(_btnMenu);
        removeChild(_btnNewConversion);
        removeChild(listContainer);
        _mainMenu = new MainScreen();
        addChild(_mainMenu);
    }


    private function newTriggeredHandler(event:starling.events.Event):void {
        removeChild(_title);
        removeChild(_btnMenu);
        removeChild(_btnNewConversion);
        removeChild(listContainer);
        _createConversion = new ConversionCreate();
        addChild(_createConversion);
    }
}
}
