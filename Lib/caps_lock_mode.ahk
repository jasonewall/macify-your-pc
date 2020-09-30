; On my macbooks keyboards I always change my caps lock key into control
; Seems to be ingrained in my muscle memory
; But I don't do it for external keyboards so I need to be able to switch the behaviour easily
; Shift+CapsLock toggles "Control Mode" for the caps lock key
; Once enabled:
; * Double-tapping caps lock toggles caps lock
; * Other wise caps lock functions as control
CapsLockCtrlMode := "F"

CapsLock::HandleCapsLock()

HandleCapsLock() {
    global CapsLockCtrlMode

    if(CapsLockCtrlMode = "T") {
        SendInput {CtrlDown}
        ; Wait forever until Capslock is released.
        KeyWait, CapsLock
        ; ErrorLevel = 1 if CapsLock not down within 0.2 seconds.
        SendInput {CtrlUp}
        KeyWait, CapsLock, D T0.3
        ; Is a double tap on CapsLock?
        if ((ErrorLevel = 0) && (A_PriorKey = "CapsLock") )
        {
            ToggleCapsLockState()
        }
    } else {
        ToggleCapsLockState()
    }
}

ToggleCapsLockState() {
    SetCapsLockState, % GetKeyState("CapsLock","T") ? "Off" : "On"
}

+CapsLock::ToggleCapsLockCtrlMode()

ToggleCapsLockCtrlMode() {
    global CapsLockCtrlMode
    CapsLockCtrlMode := (CapsLockCtrlMode = "T") ? "F" : "T"
    mode_desc := (CapsLockCtrlMode = "T") ? "On" : "Off"
    tool_tip := Format("CapsLock Is Control: {:s}", mode_desc)
    ToolTip, %tool_tip%, 500, 500
    SetTimer, RemoveCapsLockCtrlToolTip, -1500
}

RemoveCapsLockCtrlToolTip:
    ToolTip
    return
