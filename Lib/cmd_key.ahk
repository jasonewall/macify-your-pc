; Make a bunch of MacOS style keyboard shortcuts work on windows
; Basically if your muscle memory is used to hitting the Cmd key (which is alt on a windows keyboard)
; These will work for you

; Spotlight replacement
!Space::
    KeyWait Alt
    SendInput #s ; Opens start menu search - which is basically the Windows equivalent of spotlight
    return

!s::SendInput ^s ; Save
!w::SendInput ^w ; Close tab in chrome/editor in vscode and probably sublime/atom
!+w::SendInput !{F4} ; Close all tabs in current window in chrome/close project in vscode/atom/sublime.
                     ; Since is a Alt+F4 binding it also is an easy fall back for when the Cmd+W reflex doesn't work
                     ; in most other apps in windows.
!q::SendInput ^q ; Quit for some apps, you can define this with custom keybindings in vscode/atom/sublime for additional support

; Clipboard operations
!c::SendInput ^c
!v::SendInput ^v
!x::SendInput ^x

!z::SendInput ^z ; Cmd+Z undo
!+z::SendInput ^y ; Cmd+shift+z redo

!t::SendInput ^t ; New tab in chrome
!+t::SendInput ^+t ; re-open recently closed tabs in chrome, re-open recently closed editor in vscode/atom/sublime

!+r::SendInput ^r ; cmd+shift+r to refresh in browsers... it's cmd+shift+r because alt+r was interfering with some of my vscode bindings ymmv
!l::SendInput ^l ; focuses location bar in browsers, Ctrl+L is used in some other apps too.. it's handy
!,::SendInput ^, ; ctrl+, is a common preferences short cut in windows now.. so this just maps cmd+, to do the same

!f::SendInput ^f ; cmd+f find in most apps

; cmd+shift+[ & ] for tab navigation in chrome - can customize keyboard shortcuts in vscode so it works there too
!+]::SendInput ^{Tab}
!+[::SendInput ^+{Tab}

; Consider Cmd+n cmn+shift+n
; This might break some things in vs Code - checkout the shortcuts

<!`::AltTab ; cmd+backtick - this isn't an exact equivalent to the keyboard shortcut in mac (switch between windows within the same app)
            ;                but it rewards the existing muscle wiring with similar functionality

!LButton::SendInput ^{LButton} ; for opening links in new tabs for Chrome mostly


; cmd + middle mouse button goes to Mission Control for me in mac - so the closest thing in windows is WinKey+Tab
!MButton::SendInput {LWin down}{Tab}{LWin up}
