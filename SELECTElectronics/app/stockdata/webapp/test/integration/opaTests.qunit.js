sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'stockdata/test/integration/FirstJourney',
		'stockdata/test/integration/pages/StockDataList',
		'stockdata/test/integration/pages/StockDataObjectPage'
    ],
    function(JourneyRunner, opaJourney, StockDataList, StockDataObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('stockdata') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheStockDataList: StockDataList,
					onTheStockDataObjectPage: StockDataObjectPage
                }
            },
            opaJourney.run
        );
    }
);