OnMessage(0x007E, "WM_DISPLAYCHANGE")

GetDisplayOrientation()
{
    DEVMODE_Size := 226
    VarSetCapacity(DEVMODE, DEVMODE_Size, 0)
    NumPut(DEVMODE_Size, DEVMODE, 68, "UShort")
    NumPut(64, DEVMODE, 70, "UShort")

    ret := DllCall("EnumDisplaySettings", "Ptr", 0, "UInt", 0xFFFFFFFF, "Str", DEVMODE)
    dmDisplayOrientation := 0
    ;DM_DISPLAYORIENTATION = 0x00000080
    If (ret && NumGet(DEVMODE, 72, "UInt") & 0x00000080)
            dmDisplayOrientation := NumGet(DEVMODE, 84, "UInt")
    VarSetCapacity(DEVMODE, 0)
    DllCall("ChangeDisplaySettingsA", UInt,&DEVMODE, UInt,0)
    Return dmDisplayOrientation
}

SetDpi(dpi,displayID) {
    RegWrite, REG_DWORD, HKEY_CURRENT_USER\Control Panel\Desktop\PerMonitorSettings\%displayID%, DpiValue, % dpi
    RegWrite, REG_DWORD, HKEY_LOCAL_MACHINE\System\ControlSet001\Control\GraphicsDrivers\ScaleFactors\%displayID%, DpiValue, % dpi
}

WM_DISPLAYCHANGE(wParam, lParam, msg, hwnd) {
    If (hwn == GuiHwnd) {
        DisplayOrientation := GetDisplayOrientation()
        ; 0 = normal
        ; 1 = right
        ; 2 = upside down
        ; 3 = left
        DisplayID := ACI27C3E3LMRS016508_0A_07DE_7A^E593B1DA60F70CF5B145A6CAC82E8568
        if (DisplayOrientation == 0) {
            ; normal orientation
            SetDpi(200,DisplayID)
        } else {
            ; altered orientation
            SetDpi(300,DisplayID)
        }
    }
    Return
}
