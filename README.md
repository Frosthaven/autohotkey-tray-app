# autohotkey-tray-app

Windows tray application that provides autohotkey features

# Requirements

* [Autohotkey](https://www.autohotkey.com/)

# How to automatically launch at startup

* Open `./scheduled tasks/autohotkey-tray-app.xml`
* Edit the following lines to point to your files: ```xml    <Exec>
      <Command>"C:\Program Files\AutoHotkey\AutoHotkey.exe"</Command>
      <Arguments>"C:\_github\autohotkey-tray-app\main.ahk"</Arguments>
    </Exec>```
* Open windows task scheduler and import `./scheduled tasks/autohotkey-tray-app.xml`
