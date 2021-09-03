closeApp(pName) {
  Run Powershell -Command "taskkill /im %pName% /f ; exit"
  Process, Close, pName
  return
}

closeAppWait(pName) {
  RunWait Powershell -Command "taskkill /im %pName% /f ; exit"
  Process, Close, pName
  return
}

startApp(pName, pLink) {
  DetectHiddenWindows, On
  Process, Exist, %pName%
  IfWinNotExist WinTitle ahk_pid %ErrorLevel%
  Run % pLink
  Else
  DetectHiddenWindows, Off
  IfWinNotExist WinTitle ahk_pid %ErrorLevel%
  {
    WinShow, WinTitle ahk_pid %ErrorLevel%
    WinActivate, WinTitle ahk_pid %ErrorLevel%
  }
  Else
  IfWinExist WinTitle ahk_pid %ErrorLevel%
  {
    WinMinimize, WinTitle ahk_pid %ErrorLevel%
    WinHide, WinTitle ahk_pid %ErrorLevel%
  }
  return
}

SetProcessPriorityAndAffinity(name, desiredPriority, desiredAffinity) {
  Run, powershell -windowstyle hidden -Command "$Process = Get-Process %name%; $Process.ProcessorAffinity=%desiredAffinity%; Get-WmiObject Win32_process -filter 'name="""%name%.exe"""' | foreach-object { $_.SetPriority(%desiredPriority%)}"
  return
}
