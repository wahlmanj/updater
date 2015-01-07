--
--  AppDelegate.applescript
--  updater
--
--  Originally designed by iCyberGhost on 5/02/14.
--  Originally coded by Wahlman.j on 5/02/14.
--  Copyright (c) 2014 CyberGhost & Wahlman.j. All rights reserved.
--  myProgressBar's incrementBy_(20)

script AppDelegate
	property parent : class "NSObject"
	-- IBOutlets
	property theWindow : missing value
	on applicationWillFinishLaunching_(aNotification)
        do shell script "cd /Applications/PlexConnect/update/OSX; ./clt.bash; cd /Applications/OpenPlex; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git pull"
        tell application "Finder"
            if (exists file "Applications:OpenPlex:10.6:OpenPlex.app" of the startup disk) then
                try
                    do shell script "cd /Applications/OpenPlex/10.6; rm -R OpenPlex.app"
                    onerror
                end try
            end if
        end tell
        tell application "Finder"
            if (exists file "Applications:OpenPlex:updater:updater.app" of the startup disk) then
                try
                    do shell script "cd /Applications/OpenPlex/updater; rm -R updater.app"
                    onerror
                end try
            end if
        end tell
        do shell script "killall updater"
	end applicationWillFinishLaunching_
	on applicationShouldTerminate_(sender)
		return current application's NSTerminateNow
	end applicationShouldTerminate_
end script