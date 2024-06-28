sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/satinfotech/metro/hydmetro/test/integration/FirstJourney',
		'com/satinfotech/metro/hydmetro/test/integration/pages/trainList',
		'com/satinfotech/metro/hydmetro/test/integration/pages/trainObjectPage'
    ],
    function(JourneyRunner, opaJourney, trainList, trainObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/satinfotech/metro/hydmetro') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThetrainList: trainList,
					onThetrainObjectPage: trainObjectPage
                }
            },
            opaJourney.run
        );
    }
);