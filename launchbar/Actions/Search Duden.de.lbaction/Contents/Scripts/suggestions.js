// Copyright (c) 2014 Objective Development Software GmbH
// http://www.obdev.at/

function runWithString(argument)
{
    var result = HTTP.getJSON('http://www.duden.de/search_duden/autocomplete/' + encodeURIComponent(argument), 3);

    if (result == undefined) {
        LaunchBar.log('HTTP.getJSON() returned undefined');
        return [];
    }
    if (result.error != undefined) {
        LaunchBar.log('Error in HTTP request: ' + result.error);
        return [];
    }

    try {
        var suggestions = [];
        for (var suggestion in result.data) {
            suggestions.push({
                             'title' : suggestion,
                             'icon' : 'Duden.png'
                             });
        }
        return suggestions;
    } catch (exception) {
        LaunchBar.log('Exception while parsing result: ' + exception);
        return [];
    }
}
