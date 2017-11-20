function runWithString(argument)
{
    var result = HTTP.getJSON('http://www.wolframalpha.com/input/autocomplete.jsp?qr=0&i=' + encodeURIComponent(argument), 3);

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
		
		
		if (result.data["instantMath"]) {
			suggestions.push({
				'title' : result.data["instantMath"]["exactResult"],
				'subtitle': result.data["instantMath"]["parsedInput"],
				'icon' : 'result.png'
			})
		}
		
		var i = 0
        for (i = 0; i < result.data.results.length; i++) {
			var suggestion = result.data.results[i];
			suggestions.push({
                             'title' : suggestion["input"],
                             'icon' : 'WolframAlpha.png'
                             });
        }
        return suggestions;
    } catch (exception) {
        LaunchBar.log('Exception while parsing result: ' + exception);
        return [];
    }
}
