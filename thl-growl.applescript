property GrowlApp : "The Hit List Reminder"
property GrowlNotice : "Overdue Task"

tell application "GrowlHelperApp"
	register as application GrowlApp all notifications [GrowlNotice] default notifications [GrowlNotice] icon of application "The Hit List"
end tell

tell application "The Hit List"
	set currentDate to current date
	set {currentDate's hours, currentDate's minutes, currentDate's seconds} to {0, 0, 0}
	repeat with this_task in (every task of today list)
		set taskTitle to title of this_task
		set taskDate to due date of this_task
		set taskID to id of this_task
		if taskDate is not "missing value" then
			if taskDate < currentDate then
				set taskDate to date string of taskDate
				tell application "GrowlHelperApp"
					notify with name GrowlNotice title taskDate description taskTitle application name GrowlApp identifier taskID priority 1 with sticky
				end tell
			end if
		end if
	end repeat
	current date
end tell


