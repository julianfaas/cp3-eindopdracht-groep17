
package be.devine.cp3.eindopdracht.mobile.view {

import starling.display.Sprite;
import starling.textures.Texture;

public class MainScreen extends Sprite {

    [Embed(source="/../assets/fonts/Fairview_Regular.otf",fontName="Fairview_Regular",mimeType="application/x-font",embedAsCFF="false")]
    protected static const FAIRVIEW_REGULAR:Class;

    public function MainScreen() {
        trace("[MainScreen] Startup");

    }
}
}
