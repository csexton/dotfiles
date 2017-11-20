// The 'run' function is called by LaunchBar when the user opens the action.
function run()
{
    // No argument passed, just open the website:
    LaunchBar.openURL('http://www.wolframalpha.com/');
}

// The 'runWithString' function is called by LaunchBar when the user opens the action with a string argument.
function runWithString(argument)
{
    LaunchBar.openURL('http://www.wolframalpha.com/input/?i=' + encodeURIComponent(argument));
}
