showTooltip(msg) {
  WinGetTitle, WinTitle, A
  WinGetPos,x,y,w,h, %WinTitle%
  ToolTip % msg,x,y
  SetTimer, RemoveTooltip, -3000
  return
}
