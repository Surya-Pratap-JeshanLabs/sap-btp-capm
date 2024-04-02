sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'project1/test/integration/FirstJourney',
		'project1/test/integration/pages/DEBList',
		'project1/test/integration/pages/DEBObjectPage'
    ],
    function(JourneyRunner, opaJourney, DEBList, DEBObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('project1') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheDEBList: DEBList,
					onTheDEBObjectPage: DEBObjectPage
                }
            },
            opaJourney.run
        );
    }
);