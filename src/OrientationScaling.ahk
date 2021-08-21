global displayID := "BOE08950_15_07E3_F8^BEE0D4CC2B180DF99D536244DC14B5E0"

OnMessage(0x007E, "WM_DISPLAYCHANGE")

SetScaleBasedOnOrientation() {
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
    if (dmDisplayOrientation == 0) {
        ; normal
        SetDpi(-2,displayID)
    } else if (dmDisplayOrientation == 1 || dmDisplayOrientation == 3) {
        ; tablet
        SetDpi(1,displayID)
    } else {
        ; upside down
        SetDpi(1,displayID)
    }
    Return
}

SetDpi(dpi,displayID) {
    VarSetCapacity(DM,156,0)
    NumPut(156,DM,36)

    RegWrite, REG_DWORD, HKEY_CURRENT_USER\Control Panel\Desktop\PerMonitorSettings\%displayID%, DpiValue, % dpi
    RegWrite, REG_DWORD, HKEY_LOCAL_MACHINE\System\ControlSet001\Control\GraphicsDrivers\ScaleFactors\%displayID%, DpiValue, % dpi

    DllCall("ChangeDisplaySettingsA", UInt,&DM, UInt,0)
}

WM_DISPLAYCHANGE(wParam, lParam, msg, hwnd) {
    If (hwn == GuiHwnd) {
        SetScaleBasedOnOrientation()
    }
    Return
}

SetScaleBasedOnOrientation()
