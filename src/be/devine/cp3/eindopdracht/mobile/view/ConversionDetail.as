/**
 * Created with IntelliJ IDEA.
 * User: Joram
 * Date: 13/12/13
 * Time: 10:26
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.eindopdracht.mobile.view {

import be.devine.cp3.eindopdracht.model.AppModel;

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
        addChild( _btnMenu );

        _btnMenu.addEventListener(Event.TRIGGERED, menuTriggeredHandler);
    }

    private function menuTriggeredHandler(event:Event):void {
        removeChild(_title);
        removeChild(_btnMenu);

        _mainMenu = new MainScreen();
        addChild(_mainMenu);
    }
}
}
