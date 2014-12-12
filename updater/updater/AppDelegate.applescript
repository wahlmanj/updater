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
        display dialog "OpenPlex Updated" with title "OpenPlex Status"
                delay 2
                do shell script "killall OpenPlex; purgeappbash.bash; cd /Applications/OpenPlex/10.7; ditto -xk OpenPlex.zip /Applications/OpenPlex/10.7; cp -R OpenPlex.app /Applications; cd /Applications; open OpenPlex.app"
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
        display notification "OpenPlex Updated" with title "OpenPlex Status"
        delay 2
        do shell script "killall OpenPlex; purgeappbash.bash; cd /Applications/OpenPlex/10.6; ditto -xk OpenPlex.zip /Applications/OpenPlex/10.6; cp -R OpenPlex.app /Applications; cd /Applications; open OpenPlex.app"
        tell application "Finder"
            if (exists file "Applications:OpenPlex:10.6:OpenPlex.app" of the startup disk) then
                try
                do shell script "cd /Applications/OpenPlex/10.6; rm -R OpenPlex.app"
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
    end buttonhandlerupdate10_
	
	-- IBOutlets
	property theWindow : missing value
    
    
	
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened 
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script