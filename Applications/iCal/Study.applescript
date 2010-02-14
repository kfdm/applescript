tell application "GrowlHelperApp"
	register as application "iCal Notice" all notifications ["Notice", "Info"] default notifications ["Notice", "Info"] icon of application "iCal"
	notify with name "Notice" title "勉強して下さい" description ((current date) as string)  application name "iCal Notice" priority 1 icon of application "Alarm Clock" with sticky
end tell