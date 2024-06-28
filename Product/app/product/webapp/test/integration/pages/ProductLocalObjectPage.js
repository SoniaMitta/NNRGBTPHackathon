sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.satinfotech.product.product',
            componentId: 'ProductLocalObjectPage',
            contextPath: '/ProductLocal'
        },
        CustomPageDefinitions
    );
});