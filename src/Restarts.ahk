RestartWindowsFeatures() {
  closeAppWait("explorer.exe")
  closeAppWait("PowerToys.exe")
  closeAppWait("CenterTaskbar.exe")
  closeAppWait("wallpaper64.exe")
  startApp("explorer.exe", "C:\Windows\explorer.exe")
  startApp("wallpaper64.exe", "D:\SteamLibrary\steamapps\common\wallpaper_engine\wallpaper64.exe")
  Sleep 3500
  startApp("Rainmeter.exe", "C:\Program Files\Rainmeter\Rainmeter.exe")
  startApp("PowerToys.exe", "C:\Program Files\PowerToys\PowerToys.exe")
  Reload
  return
}

RestartRGBFeatures() {
  closeAppWait("iCUE.exe")
  startApp("iCUE.exe", "C:\Program Files\Corsair\CORSAIR iCUE 4 Software")
  Sleep 2000
  Reload
  return
}
