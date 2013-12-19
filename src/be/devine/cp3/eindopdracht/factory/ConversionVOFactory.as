
package be.devine.cp3.eindopdracht.factory {

import be.devine.cp3.eindopdracht.vo.ConversionVO;

public class ConversionVOFactory {

    public static function createConversionVOFromObject(conversion:Object):ConversionVO {
        var conversionVO:ConversionVO = new ConversionVO();

        conversionVO.name = conversion.name;
        conversionVO.unit_1 = conversion.unit_1;
        conversionVO.short_1 = conversion.short_1;
        conversionVO.value_1 = conversion.value_1;

        conversionVO.unit_2 = conversion.unit_2;
        conversionVO.short_2 = conversion.short_2;
        conversionVO.value_2 = conversion.value_2;

        return conversionVO;
    }
}
}
