; # WINKEY  ! ALT
; ^ CONTROL   + SHIFT

;Windows Terminal (ADMIN) (Control+WinKey+T)
^#t::
Runwait powershell.exe -Command "Start-Process shell:appsFolder\Microsoft.WindowsTerminal_8wekyb3d8bbwe!App -Verb RunAs",,Hide
Return

;Windows Terminal (WinKey+T)
#t::
Runwait powershell.exe -Command "Start-Process shell:appsFolder\Microsoft.WindowsTerminal_8wekyb3d8bbwe!App",,Hide
Return

;Center & Resize Active Window (WinKey+C)
#c::
Constrain_Width  = 1280
Constrain_Height = 720

WinGetTitle, WinTitle, A
WinGetPos,,, Width, Height, %WinTitle%

WinGet MMX, MinMax, A
IfEqual MMX, 1, WinRestore, A

;Do this twice because multimonitor on Windows is derpy
WinMove, %WinTitle%,,((A_ScreenWidth/2)-(Constrain_Width/2)),((A_ScreenHeight/2)-(Constrain_Height/2)),%Constrain_Width%,%Constrain_Height%
WinMove, %WinTitle%,,((A_ScreenWidth/2)-(Constrain_Width/2)),((A_ScreenHeight/2)-(Constrain_Height/2)),%Constrain_Width%,%Constrain_Height%
Return

;Toggle Window Border (Control + F11)
^F11::
toggleWindowBorders()
Return

;Resize current 16:9 window or game to accomodate multitasking (F14)
F14::
centerAspectRatio()
Return

; Toggle Taskbar Visibility (F15)
F15::
toggleAlwaysOnTop()
;hideShowTaskbar(hide := !hideTaskbar)
Return

;Align Window Vertically (Winkey + Shift + up)
+#Up::
alignVertically(1,false)
Return

;Align Window Vertically (Winkey + Shift + down)
+#Down::
alignVertically(-1,false)
Return

;Align Window Horizontally (Winkey + Shift + left)
+#Left::
alignHorizontally(-1,false)
Return

;Align Window Horizontally (Winkey + Shift + right)
+#Right::
alignHorizontally(1,false)
Return

;Reset Software Hooks (Winkey + delete)
#DEL::
RestartWindowsFeatures()
Return

;Autoscrapper
;F3::
;autoscrapper := !autoscrapper
;loop
;{
; If not autoscrapper
;        break
;
;    Send {z down}
;    Sleep 10
;    Send {z up}
;    Sleep 10
;}
;return

;Autocrafter
;F4::
;autocrafter := !autocrafter
;loop
;{
;    If not autocrafter
;        break

;    Click, Down
;    Sleep 10
;    Click, Up
;    Sleep 10
;}
;return

;Corne Loopback for F13-F15

#F14::
SendLevel, 2
MsgBox, test
Send, {Control}+{Shift}+1
Return
