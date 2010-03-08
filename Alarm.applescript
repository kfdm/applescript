tell application "iTunes"
	try
		play playlist "radio"
	on error
		play playlist "iTunes DJ"
	end try
end tell
