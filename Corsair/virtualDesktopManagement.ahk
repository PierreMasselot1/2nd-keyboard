#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

createVirtualDesktop(){
	Send, #^d
}

closeCurrentVirtualDesktop(){
	;; Get the virtual desktop ID of the current desktop
	GroupAdd, desktop_group, ahk_exe explorer.exe
	virtual_desktop_id := DllCall("GetCurrentDesktopId", "Ptr")

	;; Close all windows on the current desktop
	WinClose, ahk_group desktop_group
}
