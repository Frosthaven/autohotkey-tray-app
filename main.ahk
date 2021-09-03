; CREDIT ***********************************************************************
;*******************************************************************************

; Autohotkey Tray App
; author: Frosthaven <shane.stanley1983@gmail.com>

; CONFIG ***********************************************************************
;*******************************************************************************

#Persistent
#UseHook
#MaxThreads 2
#SingleInstance Force
#MaxThreadsPerHotkey 2

SetKeyDelay -1
SetBatchLines -1

; LIB FILES ********************************************************************
;*******************************************************************************

#Include %A_ScriptDir%\lib\Utility.ahk
#Include %A_ScriptDir%\lib\WindowManagement.ahk
#Include %A_ScriptDir%\lib\ProcessManagement.ahk

; INIT HEADER CODE *************************************************************
;*******************************************************************************

; Priority Codes
; ----------------------
; 256	Realtime
; 128	High
; 32768	Above normal
; 32	Normal
; 16384	Below normal
; 64	Low

SetProcessPriorityAndAffinity("audiodg",128,2)

; INIT PROJECT FILES ***********************************************************
;*******************************************************************************

#Include %A_ScriptDir%\src\RenderNotificationTrayMeny.ahk
#Include %A_ScriptDir%\src\PolledEvents.ahk
#Include %A_ScriptDir%\src\Restarts.ahk

#Include %A_ScriptDir%\labels.ahk
#Include %A_ScriptDir%\hotkeys.ahk

