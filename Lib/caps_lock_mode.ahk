; On my macbooks keyboards I always change my caps lock key into control
; Seems to be ingrained in my muscle memory
; But I don't do it for external keyboards so I need to be able to switch the behaviour easily
; Shift+CapsLock toggles "Control Mode" for the caps lock key
; Once enabled:
; * Double-tapping caps lock toggles caps lock
; * Other wise caps lock functions as control
CapsLockMode := "F"

CapsLock::HandleCapsLock()

HandleCapsLock() {
    global CapsLockMode

    if(CapsLockMode = "F") {
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

+CapsLock::ToggleCapsLockMode()

ToggleCapsLockMode() {
    global CapsLockMode
    CapsLockMode := (CapsLockMode = "T") ? "F" : "T"
    mode_desc := (CapsLockMode = "T") ? "On" : "Off"
    tool_tip := Format("CapsLock Is CapsLock: {:s}", mode_desc)
    ToolTip, %tool_tip%, 500, 500
    SetTimer, RemoveCapsLockToolTip, -1500
}

RemoveCapsLockToolTip:
    ToolTip
    return
