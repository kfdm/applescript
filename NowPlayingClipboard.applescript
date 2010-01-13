tell application "iTunes"
	
	if current track's class is URL track then
		set trackString to current stream title
	else
		set trackName to name of current track
		set trackArtist to artist of current track
		set trackAlbum to album of current track
		set trackString to trackArtist & " - " & trackName & " (" & trackAlbum & ")"
	end if
	
	tell application "System Events"
		set the clipboard to trackString
		display dialog "Clipboard set to\n"&trackString buttons {"OK"} default button 1
	end tell
end tell

