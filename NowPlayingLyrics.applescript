tell application "iTunes"
	set trackLyrics to lyrics of current track
end tell
if trackLyrics is "" then
	display dialog "No Lyrics" buttons {"OK"} default button 1
else
	display dialog "Lyrics" default answer trackLyrics buttons {"OK"} default button 1
end if