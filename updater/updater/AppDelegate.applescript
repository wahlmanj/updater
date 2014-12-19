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
    
    property appupdateProgressBar : missing value
    
    property appupdate10ProgressBar : missing value
    
    on buttonhandlerupdate_(sender)
        set x to do shell script "cd /Applications/PlexConnect/update/OSX; ./clt.bash"
        if x is equal to "6" then
            display dialog "Snow Leopard Detected, OpenPlex Updating..." with title "OpenPlex Status"
            delay 1
            do shell script "cd /Applications/OpenPlex; git pull"
        end if
        if x is equal to "7" then
            display dialog "Lion Detected, OpenPlex Updating..." with title "OpenPlex Status"
            delay 1
            do shell script "cd /Applications/OpenPlex; git pull"
        end if
                tell application "Finder"
                    if (exists file "Applications:OpenPlex:10.7:OpenPlex.app" of the startup disk) then
                        try
                            do shell script "cd /Applications/OpenPlex/10.7; rm -R OpenPlex.app"
                            onerror
                        end try
                        else
                    end if
                end tell
                tell application "Finder"
                    if (exists file "Applications:OpenPlex:updater:updater.app" of the startup disk) then
                        try
                            do shell script "cd /Applications/OpenPlex/updater; rm -R updater.app"
                            onerror
                        end try
                        else
                    end if
                end tell
        do shell script "killall updater"
    end buttonhandlerupdate_
    
    on buttonhandlerupdate10_(sender)
        set x to do shell script "cd /Applications/PlexConnect/update/OSX; ./clt.bash"
        if x is equal to "8" then
            display notification "Mountain Lion Detected, OpenPlex Updating..." with title "OpenPlex Status"
            delay 1
            do shell script "cd /Applications/OpenPlex; git pull"
        end if
        if x is equal to "9" then
            display notification "Mavericks Detected, OpenPlex Updating..." with title "OpenPlex Status"
            delay 1
            do shell script "cd /Applications/OpenPlex; git pull"
        end if
        if x is equal to "10" then
            display dialog "Yosemite Detected, OpenPlex Updating..." with title "OpenPlex Status"
            delay 1
            do shell script "cd /Applications/OpenPlex; git pull"
        end if
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
    end buttonhandlerupdate10_
	
	-- IBOutlets
	property theWindow : missing value
    
    
	
	on applicationWillFinishLaunching_(aNotification)
        set x to do shell script "cd /Applications/PlexConnect/update/OSX; ./clt.bash"
        if x is equal to "6" then
            do shell script "cd /Applications/OpenPlex; git pull"
        end if
        if x is equal to "7" then
            do shell script "cd /Applications/OpenPlex; git pull"
        end if
        if x is equal to "8" then
            do shell script "cd /Applications/OpenPlex; git pull"
        end if
        if x is equal to "9" then
            do shell script "cd /Applications/OpenPlex; git pull"
        end if
        if x is equal to "10" then
            do shell script "cd /Applications/OpenPlex; git pull"
        end if
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
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script