#SingleInstance
#Warn All, Off
x := 1
CheckTimeout()
{
    global x
    if x = 0
    {
        x := 1
        TrayTip "Clip.ahk", "Stealth paste disabled", 1
        Sleep 1000   ; Let it display for 1 second.
        TrayTip
        SetTimer CheckTimeout, 0
    }
}

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
                Send A_LoopField
                Sleep 100
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
        TrayTip "Clip.ahk", "Stealth paste disabled", 1
        Sleep 1000   ; Let it display for 1 second.
        TrayTip
        SetTimer CheckTimeout, 0
    }
    else
    {
       
        x := 0
        MsgBox "Clip.ahk: Stealth paste enabled", , "T1"
        SetTimer CheckTimeout, 120000  ; 2 minutes
    }
}

;Congrats my Creator; Christian Abba
;Congrats my Brother, Chat GPT

