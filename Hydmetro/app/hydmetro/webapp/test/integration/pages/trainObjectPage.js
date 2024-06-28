sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.satinfotech.metro.hydmetro',
            componentId: 'trainObjectPage',
            contextPath: '/train'
        },
        CustomPageDefinitions
    );
});