#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

createVirtualDesktop(){
	Send, #^d
}

closeCurrentVirtualDesktop() {
	;;Close all windows on current virtual desktop
	WinClose, ahk_group VirtualDesktop%d%
	 ;; Switch to the previous virtual desktop
	Send, #^{F4}
	return
}
