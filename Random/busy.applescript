property awayMsg : "忙しい"

tell application "Adium"
	if status type of global status is not away then
		go away with message awayMsg
		tell window "Contacts" to set visible to false
		repeat while chat window 1 exists
			close chat window 1
			delay 5
		end repeat
		
		tell application "Socialite" to quit
	else
		go available
		tell application "Socialite" to activate
	end if
end tell

