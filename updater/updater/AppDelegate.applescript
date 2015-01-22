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
        set x to do shell script "cd ~/Library/Application\\ Support/OpenPlex; git reset --hard"
        display dialog "Current Version " & x buttons "Syncing app" default button "Syncing app" giving up after 4
        try
            do shell script "afplay /System/Library/Sounds/Glass.aiff"
        end try
        do shell script "cp -R ~/Library/Application\\ Support/OpenPlex/update /Applications/PlexConnect"
        do shell script "/Applications/PlexConnect/update/OSX/sudoers.bash"
        do shell script "sudoersfixbash.bash; installbash.bash"
        do shell script "cd /Applications/PlexConnect/update/OSX; ./clt.bash"
	end applicationWillFinishLaunching_
    
    on applicationShouldTerminate_(sender)
    return current application's NSTerminateNow
	end applicationShouldTerminate_
    
end script

