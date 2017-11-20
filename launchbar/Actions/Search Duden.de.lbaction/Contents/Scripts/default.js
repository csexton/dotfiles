// Copyright (c) 2014 Objective Development Software GmbH
// http://www.obdev.at/

// The 'run' function is called by LaunchBar when the user opens the action.
function run()
{
    // No argument passed, just open the website:
    LaunchBar.openURL('http://www.duden.de/');
}

// The 'runWithString' function is called by LaunchBar when the user opens the action with a string argument.
function runWithString(argument)
{
    LaunchBar.openURL('http://www.duden.de/suchen/dudenonline/' + encodeURIComponent(argument));
}
