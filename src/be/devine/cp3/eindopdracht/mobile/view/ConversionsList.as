/**
 * Created with IntelliJ IDEA.
 * User: Joram
 * Date: 16/12/13
 * Time: 13:39
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.eindopdracht.mobile.view {
import be.devine.cp3.eindopdracht.model.AppModel;

import flash.display.BitmapData;
import flash.events.Event;

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

    private var _appModel:AppModel;
    private var _atlas:TextureAtlas;

    private var _title:TextField;

    public function ConversionsList() {

        _appModel = AppModel.getInstance();

        const atlasBitmapData:BitmapData = (new ATLAS_IMAGE()).bitmapData;
        _atlas = new TextureAtlas(Texture.fromBitmapData(atlasBitmapData, false), XML(new ATLAS_XML()));

        addEventListener(starling.events.Event.ADDED_TO_STAGE, addedToStageHandler);

    }

    private function addedToStageHandler(event:starling.events.Event):void {

        _title = new TextField(300, 100, "Conversions", "FAIRVIEW_REGULAR", 60, 0xffffff);
        _title.x = 90;
        _title.italic = true;
        _title.hAlign = HAlign.CENTER;
        _title.vAlign = VAlign.TOP;
        addChild(_title);

    }
}
}
