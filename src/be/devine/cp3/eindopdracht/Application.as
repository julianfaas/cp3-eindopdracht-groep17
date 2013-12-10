
package be.devine.cp3.eindopdracht {

import be.devine.cp3.eindopdracht.model.AppModel;
import feathers.themes.MetalWorksMobileTheme;
import starling.display.Sprite;

public class Application extends Sprite {

    private var _appModel:AppModel;

    public function Application() {
        trace("[Application] Startup");

        new MetalWorksMobileTheme();

        _appModel = AppModel.getInstance();
        _appModel.load;
    }
}
}
