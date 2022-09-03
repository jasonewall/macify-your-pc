
MoomActivate() {
    timeout := 2.5
    ih := InputHook("B", "{Escape}")
    ih.NotifyNonText := true
    ih.Timeout := timeout
    ih.KeyOpt("{Space}0{Left}{Right}", "N")
    ih.OnKeyDown := Func("MoomKeyDown")
    ih.OnEnd := Func("MoomExit")
    ToolTip Space - Maximize`n0 - Restore Window`n← - Move One Screen to the left`n→ - Move one screen to the right, 500, 500
    ih.Start()
    return
}

MoomKeyDown(ih, VK, SC) {
    timeout := 2.5
    vksc := Format("vk{:x}sc{:x}", VK, SC)
    key := GetKeyName(vksc)
    Switch key {
        Case "Left", "h":
            SendInput #+{Left}
            ih.Timeout := timeout
        Case "Right", "l":
            SendInput #+{Right}
            ih.Timeout := timeout
        Case "Space":
            SendInput #{Up}
            ih.Timeout := timeout
        Case "0":
            SendInput #{Down}
            ih.Timeout := timeout
    }
}

MoomExit(ih) {
    ToolTip
}
