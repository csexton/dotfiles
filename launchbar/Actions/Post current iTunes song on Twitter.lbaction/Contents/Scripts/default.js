// Copyright (c) 2014 Objective Development Software GmbH
// http://www.obdev.at/

// The 'run' function is called by LaunchBar when the user opens the action.
function run()
{
    try {
        // Collect the info we want to post on Twitter:
        var track = getCurrentTrack();
        var storeRequestURL = getStoreRequestURL(track);
        var trackURL = getTrackURL(storeRequestURL);
        var tweetText = 'I’m listening to'.localize() + ' ' + track.name + ' ' + 'by'.localize() + ' ' + track.artist;

        // LaunchBar.performAction() takes two arguments:
        //  - The english name of the action as it appears in LaunchBar.
        //  - Optional: A string that is passed to the LaunchBar action as if the user entered it.
        LaunchBar.performAction('Post on Twitter', tweetText + '\n\n' + trackURL);

    } catch (exception) {

        // LaunchBar.alert() takes multiple arguments, whereas only the first is non-optional:
        //  - The alert title
        //  - The alert message
        //  - Any further arguments are interpreted as button titles
        // The function blocks until the user deals with the alert. It then returns the index of the clicked button.
        LaunchBar.alert('unableToPost'.localize(), exception);
    }
}

function getCurrentTrack()
{
    // Execute some AppleScript and interpret its result.
    // LaunchBar.executeAppleScript() takes multiple string arguments, whereas each corresponds
    // to a line in an AppleScript.
    var output = LaunchBar.executeAppleScript('tell application "iTunes"',
                                              '    return artist of current track & "\n" & name of current track',
                                              'end tell');

    var outputComponents = output.split('\n');
    var track = {};
    track.artist = outputComponents[0];
    track.name = outputComponents[1];

    if (track.artist.length == 0 || track.name.length == 0) {
        throw new Error('unableToGetArtistOrName'.localize());
    }

    return track;
}

function getStoreRequestURL(track)
{
    // The Action.preferences object is persistent across runs of the action. It is serialized to
    // ~/Library/Application Support/LaunchBar/Action Support/<actionBundleID>/Preferences.plist

    if (Action.preferences.storeCountry == undefined) {
        // The country wasn't set in the action's preferences, fall back to to the US store.
        // Note: Setting Action.preferences.storeCountry (and not a local variable) also causes
        // the value to be written to the Preferences.plist file mentioned above.
        Action.preferences.storeCountry = 'US';
    }

    return 'http://itunes.apple.com/search?country=' + Action.preferences.storeCountry + '&entity=song&limit=1&term=' + encodeURIComponent(track.name + ' ' + track.artist);
}

function getTrackURL(storeRequestURL)
{
    // HTTP.get(), HTTP.getJSON(), and HTTP.getPlist() all take the same arguments: an URL and a timeout.
    // They all return an object with the following properties ('result' is the object returned):
    //  - result.error: a localized, human readable error description, or undefined if no error occured.
    //  - result.response: an object describing the HTTP response.
    //  - result.data: the resulting data. This is a string for HTTP.get() or an object for HTTP.getJSON() and HTTP.getPlist().

    var result = HTTP.getJSON(storeRequestURL, 5.0);
    if (result.error != undefined) {
        throw new Error('trackNotFound'.localize() + ': ' + result.error);
    }

    // The iTunes API returns an object with two fields: 'resultCount' (number) and 'results' (array of objects).
    if (result.data.resultCount == undefined || result.data.resultCount == 0 || result.data.results[0].trackViewUrl == undefined) {
        throw new Error('trackNotFound'.localize());
    }

    return result.data.results[0].trackViewUrl;
}
