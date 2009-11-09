property GrowlApp : "The Hit List Reminder"
property GrowlNotice : "Overdue Task"
property GrowlIconApp : "The Hit List"

tell application "GrowlHelperApp"
	register as application GrowlApp all notifications [GrowlNotice] default notifications [GrowlNotice] icon of application GrowlIconApp
end tell

tell application "The Hit List"
	set currentDate to current date
	set {currentDate's hours, currentDate's minutes, currentDate's seconds} to {0, 0, 0}
	repeat with this_task in (every task of today list)
		set taskDate to due date of this_task
		if not (completed of this_task) then
			if taskDate is not "missing value" then
				if taskDate < currentDate then
					set taskID to "thl" & (id of this_task)
					set taskTitle to title of this_task
					set taskDate to date string of taskDate
					tell application "GrowlHelperApp"
						notify with name GrowlNotice title taskDate description taskTitle application name GrowlApp identifier taskID priority 1 with sticky
					end tell
				end if
			end if
		end if
	end repeat
end tell


