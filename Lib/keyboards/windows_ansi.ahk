; Make a bunch of MacOS style keyboard shortcuts work on windows
; Assumes a layout of a standard "Windows keyboard" where the modifier keys are:
;       Ctrl Windows/Super Alt Space Alt ????? Ctrl
; Basically if your muscle memory is used to hitting the Cmd key (which is alt on a windows keyboard)
; These will work for you

; Spotlight replacement
!Space::
    KeyWait Alt
    SendInput #s ; Opens start menu search - which is basically the Windows equivalent of spotlight
    return

!o::SendInput ^o ; Open
!s::SendInput ^s ; Save

!n::SendInput ^n ; New file/window depending on app
!+n::SendInput ^+n ; New window/new incognito window
!w::SendInput ^w ; Close tab in chrome/editor in vscode and probably sublime/atom
!h::SendInput !{Esc} ; Hide window
!m::SendInput #{Down} ; Minimize current window
!+w::SendInput !{F4} ; Close all tabs in current window in chrome/close project in vscode/atom/sublime.
                     ; Since is a Alt+F4 binding it also is an easy fall back for when the Cmd+W reflex doesn't work
                     ; in most other apps in windows.
!q::SendInput ^q ; Quit for some apps, you can define this with custom keybindings in vscode/atom/sublime for additional support

; Quick Tab switching in chrome, also workspace switching in slack

#IfWinActive ahk_exe Chrome.exe
$!g::SendInput {F3}
$+!g::SendInput +{F3}
#IfWinActive

#IfWinNotActive ahk_class StarCraft II
$!1::SendInput ^1
$!2::SendInput ^2
$!3::SendInput ^3
$!4::SendInput ^4
$!5::SendInput ^5
$!6::SendInput ^6
$!7::SendInput ^7
$!8::SendInput ^8
$!9::SendInput ^9
$!0::SendInput ^0
#IfWinNotActive

; Slack
!k::SendInput ^k ; Quick open
+!k::SendInput +^k ; start dm
!Up::SendInput ^{Up} ; edit last message

; Clipboard operations
!c::SendInput ^c
!v::SendInput ^v
!x::SendInput ^x

; Common formatting shortcuts
!b::SendInput ^b
!i::SendInput ^i
!u::SendInput ^u

; Text navigation from Mac
$!Left::SendInput {Home}
$!Right::SendInput {End}
$#Left::SendInput ^{Left}
$#Right::SendInput ^{Right}

; Text selection
$!a::SendInput ^a
$!+Left::SendInput +{Home}
$!+Right::SendInput +{End}
$#+Left::SendInput +^{Left}
$#+Right::SendInput +^{Right}

; Delete files in Finder/Explorer
$!BS::SendInput {Delete}

!z::SendInput ^z ; Cmd+Z undo
!+z::SendInput ^y ; Cmd+shift+z redo

!t::SendInput ^t ; New tab in chrome
!+t::SendInput ^+t ; re-open recently closed tabs in chrome, re-open recently closed editor in vscode/atom/sublime

!r::SendInput {F5} ; refresh
!+r::SendInput ^{F5} ; hard refresh
!l::SendInput ^l ; focuses location bar in browsers, Ctrl+L is used in some other apps too.. it's handy
!,::SendInput ^, ; ctrl+, is a common preferences short cut in windows now.. so this just maps cmd+, to do the same

!f::SendInput ^f ; cmd+f find in most apps

; cmd+shift+[ & ] for tab navigation in chrome - can customize keyboard shortcuts in vscode so it works there too
!+]::SendInput ^{Tab}
!+[::SendInput ^+{Tab}

<!`::ShiftAltTab ; cmd+backtick - this isn't an exact equivalent to the keyboard shortcut in mac (switch between windows within the same app)
                 ;                but it rewards the existing muscle wiring with similar functionality
                 ;                It also solves the problem of not being able to create triad shortcuts for shift alt tab with AHK

!LButton::SendInput ^{LButton} ; for opening links in new tabs for Chrome mostly


; cmd + middle mouse button goes to Mission Control for me in mac - so the closest thing in windows is WinKey+Tab
!MButton::SendInput {LWin down}{Tab}{LWin up}

; my personal moom hotkeys
; my activation shortcut is option+shift+m
; Space
+#m::MoomActivate()

; Not all keyboards have media controls
; These aren't really replicating anything standard from MacoS
; Just something standard I would like for convenience in my Windows machines

#+P::Send {Media_Play_Pause}
#+[::Send {Media_Prev}
#+]::Send {Media_Next}
#+=::Send {Volume_Up}
#+-::Send {Volume_Down}
#+0::Send {Volume_Mute}
