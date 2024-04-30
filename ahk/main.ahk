#Requires AutoHotkey v2.0
#SingleInstance Force
Persistent(true)

; = Remap keystrokes ===> ;
#Space::
{
	Send("!{Space}")
}

^!l::
{
	Run("wt --fullscreen -p Linux",,,&PID)
	return
}

^!p::
{
	Run("wt --fullscreen wsl tmux new-session -A -s projects",,,&PID)
	return
}

^!z::
{
    Run("wt --fullscreen btop",,,&PID)
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
	return
}