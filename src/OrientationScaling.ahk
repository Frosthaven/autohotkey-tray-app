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
	Return dmDisplayOrientation
}

WM_DISPLAYCHANGE(wParam, lParam, msg, hwnd) {
    If (hwn == GuiHwnd) {
        DisplayOrientation := GetDisplayOrientation()
        ; 0 = normal
        ; 1 = right
        ; 2 = upside down
        ; 3 = left

        if (DisplayOrientation == 0) {
            ; scale to 200
        } else {
            ; scale to 300
        }
    }
    Return
}
