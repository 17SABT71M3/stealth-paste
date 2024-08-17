#SingleInstance
x := 0

$^v::
{
global x
if x = 0
{
ClipboardText := StrSplit(A_Clipboard, "`n")[1]
Loop Parse ClipboardText
{
    ; Check if the character is not a newline
    if !(A_LoopField = "`n" or A_LoopField = "`r")
    {
        ; Send each character one by one
        SendText A_LoopField
        Sleep 50
    }
}
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
MsgBox "Clip.ahk: Stealth paste disabled",, "T2"
}
else
{
x := 0
MsgBox "Clip.ahk: Stealth paste enabled",, "T2"
}
}
