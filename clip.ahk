#SingleInstance
x := 0

$^v::
{
global x
if x = 0
{
SendText A_Clipboard
}
else
{
Send "^v"
}
}

~^q::
{
global x
if x = 0
{
x := 1
msgbox "stealth paste disabled"
}
else
{
x := 0
msgbox "stealth paste enabled"
}
}


