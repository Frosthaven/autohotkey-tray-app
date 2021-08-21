; SetMonitorsNative:
;   RunWait, %comspec% /c "c:\Standalone\monitor-profile-switcher\MonitorSwitcher.exe -load:c:\Standalone\monitor-profile-switcher\native.xml"
;   ;Sleep, 5000
;   RestartWindowsFeatures()
;   Return

; SetMonitorsParsec:
;   RunWait, %comspec% /c "c:\Standalone\monitor-profile-switcher\MonitorSwitcher.exe -load:c:\Standalone\monitor-profile-switcher\parsec.xml"
;   ;Sleep, 5000
;   ;RestartWindowsFeatures()
;   Return

RestartExplorer:
  Process, Close, explorer.exe
  Return

Reload:
  Reload
  Return

; OpenMultilauncherFolder:
;    Run "C:/_github/multilauncher/configs/"
;   Return

; OpenDeckEngineFolder:
;   Run "c:/_github/deck-engine/"
;   Return

OpenFolder:
  Run %A_ScriptDir%
  Return

OpenRepo:
  Run, "https://github.com/Frosthaven/autohotkey-tray-app/tree/main"
  Return

EditWithCode:
  Run, %comspec% /c "code %A_ScriptDir%",,Hide
  WinWait, ahk_class ConsoleWindowClass
  Process, Close, cmd.exe
  DetectHiddenWindows, On
  Return

EditHotkeys:
  Run, edit "%A_ScriptDir%/hotkeys.ahk"
  Return

RemoveTooltip:
  ToolTip
  Return

DoNothing:
  Return

Exit:
  ExitApp
  Return
