#Requires AutoHotkey v2.0
#SingleInstance Force
Persistent(true)

; = Remap keystrokes ===> ;
#Space::
{
	Send("!{Space}")
}

^!w::
{
	Run("wt --maximized -p Linux")
	;WinWait("ahk_exe" . "WindowsTerminal.exe")
	;WinActivate("ahk_exe" . "WindowsTerminal.exe")
	return
}

^!z::
{
	Run("wt --fullscreen btop")
	;btopPID := 0
	;test := Run("wt --fullscreen btop",,,&btopPID)
	;MsgBox(test)
	;WinWait("ahk_pid " . btopPID)
	;WinActivate("ahk_pid " . btopPID)
	return
}

#b::
{
	Run("chrome")
	return
}

#f::
{
	Run("explorer")
	return
}

#q::
{
	WinClose("A")
}