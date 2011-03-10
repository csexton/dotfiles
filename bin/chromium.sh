#! /bin/bash

# Based off my WebKit nightly script (now defunct as WebKit uses Sparkle)
# Copyright 2009 Micheal Jones
# Software License: Do whatever you want.

#Find current revision
currentRevision=`/usr/libexec/PlistBuddy -c 'Print :SVNRevision' /Applications/Chromium.app/Contents/Info.plist`

#Get latest available revision
latestRevision=`curl -s http://build.chromium.org/f/chromium/snapshots/chromium-rel-mac/LATEST`

#Use http://build.chromium.org/buildbot/snapshots/chromium-rel-mac/LATEST for the latest but not always available

#Abort if there is no update
if [ $latestRevision -le $currentRevision ]
then
	echo "There is no update for Chromium available"
	exit
fi

#Append download address
address='http://build.chromium.org/f/chromium/snapshots/chromium-rel-mac/'${latestRevision}'/chrome-mac.zip'

echo "Downloading... $address"
curl -s $address -o /tmp/chrome.zip

#Abort if the build is not available
if [ "`head -n 3 /tmp/chrome.zip | tail -n 1`" = "<title>404 Not Found</title>" ];
then
	echo "Latest Version is not available yet (try again in a couple minutes)"
	rm -rf /tmp/chrome-mac.zip
	exit
fi

#Unzip
cd /tmp
unzip /tmp/chrome.zip 1>/dev/null

echo "Copying..."
#Copy to Applications
cp -RfL /tmp/chrome-mac/Chromium.app /Applications/ 2>/dev/null

echo "Cleaning up..."
#Clean up
rm -rf /tmp/[Cc]hrome*

revision=`/usr/libexec/PlistBuddy -c 'Print :SVNRevision' /Applications/Chromium.app/Contents/Info.plist`

echo "Finished. (r$revision)"

