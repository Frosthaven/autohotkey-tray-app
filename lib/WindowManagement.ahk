global resolutionIndex    := 0
global verticalAlignIndex := 0
global horizontalAlignIndex := 0
global scaleResolutions := 1

centerAspectRatio() {
  ; cycle to the next resolution example
  ;                16:9        16:9        16:9        26:9        32:9
  resolutions := ["1920x1080","2560x1440","3840x2160","3440x1440","5120x1440"]
  resolutionIndex += 1
  if (resolutionIndex > objLength(resolutions)) {
    resolutionIndex = 1
  }

  dimensions := StrSplit(resolutions[resolutionIndex], "x")

  ; read current window data
  SysGet, Mon, Monitor
  WinGetTitle, WinTitle, A
  WinGetPos,,, Width, Height, %WinTitle%

  ; default dimensions
  dimx := dimensions[1]
  dimy := dimensions[2]

  ; scale resolutions to the monitor boundaries
  if (scaleResolutions == 1) {
    ; adapt window to monitor width
    if (dimx > MonRight) {
      decrease := dimx-MonRight
      percent := (decrease/dimx*100)*.01
      dimx := dimx - (dimx*percent)
      dimy := dimy - (dimy*percent)
    }
    ; adapt window to monitor height
    if (dimy > MonBottom) {
      decrease := dimy-MonBottom
      percent := (decrease/dimy*100)*.01
      dimx := dimx - (dimx*percent)
      dimy := dimy - (dimy*percent)
    }
  }

  ; if we we are already on the resolution of the current window, lets skip to the next one
  if (dimx == Width && dimy == Height) {
    centerAspectRatio()
    Return
  }

  ; center the window if possible, otherwise topleft
  newx := ((MonRight/2)-(dimx/2))
  newy := ((MonBottom/2)-(dimy/2))
  if (dimx >= MonRight) {
    newx := 0
  }
  if (dimy >= MonBottom) {
    newy := 0
  }


  ; nice even numbers
  dimx := Round(dimx)
  dimy := Round(dimy)

  ; move and resize the window (requires duplicate call in windows 10)
  WinMove, %WinTitle%,,newx,newy,dimx,dimy
  WinMove, %WinTitle%,,newx,newy,dimx,dimy
  WinMove, %WinTitle%,,newx,newy,dimx,dimy
  showTooltip(dimx . "  x " . dimy)
  Return
}

alignVertically(movement,override) {
  aligns := [1,2,3] ;center top bottom

  ; decide direction
  if (movement > 0) {
    verticalAlignIndex += 1
  } else {
    verticalAlignIndex -= 1
  }

  ; cycle start-over
  if (verticalAlignIndex > objLength(aligns)) {
    verticalAlignIndex := 1
  } else if (verticalAlignIndex < 1) {
    verticalAlignIndex := objLength(aligns)
  }

  ; read current window data
  SysGet, Mon, Monitor
  WinGetTitle, WinTitle, A
  WinGetPos,x,y,w,h, %WinTitle%

  ; decide new location
  if (aligns[verticalAlignIndex] == 1) { ; center
    newy := ((MonBottom/2)-(h/2))
  } else if (aligns[verticalAlignIndex] == 2) { ; top
    newy := 0
  } else if (aligns[verticalAlignIndex] ==3) { ; bottom
    newy := (MonBottom-h)
  }

  ; skip to next if location hasn't changed
  if (y == newy && override == false) {
    if (movement > 0) {
      alignVertically(1,true)
      Return
    } else {
      alignVertically(-1,true)
    }
  }

  ; move the window
  WinMove, %WinTitle%,,%x%,%newy%,%w%,%h%
  WinMove, %WinTitle%,,%x%,%newy%,%w%,%h%
  showTooltip(x . ":" . newy)
  Return
}

alignHorizontally(movement,override) {
  aligns := [1,2,3] ;center top bottom

  ;decide direction
  if (movement > 0) {
    horizontalAlignIndex -= 1
  } else {
    horizontalAlignIndex += 1
  }

  ; cycle start-over
  if (horizontalAlignIndex > objLength(aligns)) {
    horizontalAlignIndex := 1
  } else if (horizontalAlignIndex < 1) {
    horizontalAlignIndex := objLength(aligns)
  }

  ; read current window data
  SysGet, Mon, Monitor
  WinGetTitle, WinTitle, A
  WinGetPos,x,y,w,h, %WinTitle%

  ; decide new location
  if (aligns[horizontalAlignIndex] == 1) { ; center
    newx := ((MonRight/2)-(w/2))
  } else if (aligns[horizontalAlignIndex] == 2) { ; left
    newx := 0
  } else if (aligns[horizontalAlignIndex] ==3) { ; right
    newx := (MonRight-w)
  }

  ; skip to next if location hasn't changed
  if (x == newx && override == false) {
    if (movement > 0) {
      alignHorizontally(1,true)
      Return
    } else {
      alignHorizontally(-1,true)
    }
  }

  ; move the window
  WinMove, %WinTitle%,,%newx%,%y%,%w%,%h%
  WinMove, %WinTitle%,,%newx%,%y%,%w%,%h%
  showTooltip(newx . ":" . y)
  Return
}

toggleWindowBorders() {
  WinGetTitle, currentWindow, A

  IfWinExist %currentWindow%
  {
    Winget, Style, Style, %currentWindow%
    if (Style & 0xC00000) { ; titlebar is enabled
      ; disable border features
      WinSet, Style, -0xC00000, %title% ; title bar
      WinSet, Style, -0x800000, %title% ; thin border
      WinSet, Style, -0x400000, %title% ; dialog frame
      WinSet, Style, -0x40000,  %title% ; thick frame / size box
      showTooltip("Borders Off")
    } else {
      ; enable border features
      WinSet, Style, +0xC00000, %title% ; title bar
      WinSet, Style, +0x800000, %title% ; thin border
      WinSet, Style, +0x400000, %title% ; dialog frame
      WinSet, Style, +0x40000,  %title% ; thick frame / size box
      showTooltip("Borders On")
    }
  }
  return
}

global hideTaskbar := false
hideShowTaskbar(action) {
   static ABM_SETSTATE := 0xA, ABS_AUTOHIDE := 0x1, ABS_ALWAYSONTOP := 0x2
   VarSetCapacity(APPBARDATA, size := 2*A_PtrSize + 2*4 + 16 + A_PtrSize, 0)
   NumPut(size, APPBARDATA), NumPut(WinExist("ahk_class Shell_TrayWnd"), APPBARDATA, A_PtrSize)
   NumPut(action ? ABS_AUTOHIDE : ABS_ALWAYSONTOP, APPBARDATA, size - A_PtrSize)
   DllCall("Shell32\SHAppBarMessage", UInt, ABM_SETSTATE, Ptr, &APPBARDATA)
   hideTaskbar := !hideTaskbar
}

HideTrayTip() {
  TrayTip  ; Attempt to hide it the normal way.
  if SubStr(A_OSVersion,1,3) = "10." {
    Menu Tray, NoIcon
    Sleep 200  ; It may be necessary to adjust this sleep.
    Menu Tray, Icon
  }
  return
}

IsWindowAlwaysOnTop(windowTitle) {
  WinGet, windowStyle, ExStyle, %windowTitle%
  isWindowAlwaysOnTop := if (windowStyle & 0x8) ? false : true ; 0x8 is WS_EX_TOPMOST.
  return isWindowAlwaysOnTop
}

toggleAlwaysOnTop() {
  WinGetTitle, activeWindow, A
  if IsWindowAlwaysOnTop(activeWindow) {
    ;notificationMessage := "The window """ . activeWindow . """ is now always on top."
    notificationMessage := "Always on Top: ON"
    notificationIcon := 16 + 1 ; No notification sound (16) + Info icon (1)
  }
  else {
    ;notificationMessage := "The window """ . activeWindow . """ is no longer always on top."
    notificationMessage := "Always on Top: OFF"
    notificationIcon := 16 + 2 ; No notification sound (16) + Warning icon (2)
  }
  Winset, Alwaysontop, , A
  ;TrayTip, Always-on-top, %notificationMessage%, , %notificationIcon%
  showTooltip(notificationMessage)
  ;Sleep 3000 ; Let it display for 3 seconds.
  ;HideTrayTip()
  return
}
