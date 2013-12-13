
package be.devine.cp3.eindopdracht.mobile.view {

import be.devine.cp3.eindopdracht.model.AppModel;

import feathers.controls.Button;
import feathers.controls.LayoutGroup;

import starling.display.Sprite;

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

    public function MainScreen() {
        trace("[MainScreen] Startup");

        _appModel = AppModel.getInstance();

        const atlasBitmapData:BitmapData = (new ATLAS_IMAGE()).bitmapData;
        _atlas = new TextureAtlas(Texture.fromBitmapData(atlasBitmapData, false), XML(new ATLAS_XML()));

        var title:starling.text.TextField = new starling.text.TextField(300, 100, "Konvert", "FAIRVIEW_REGULAR", 60, 0xffffff);
        title.italic = true;
        title.hAlign = HAlign.CENTER;
        title.vAlign = VAlign.TOP;
        addChild(title);
    }
}
}
