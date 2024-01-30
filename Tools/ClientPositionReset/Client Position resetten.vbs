Dim AppdataPath, LocalAppdataPath
Set wshShell = CreateObject( "WScript.Shell" )
AppdataPath = wshShell.ExpandEnvironmentStrings( "%APPDATA%" )
LocalAppdataPath = wshShell.ExpandEnvironmentStrings( "%LOCALAPPDATA%" )

//Xphone uns Outlook Schließen

Dim oShell : Set oShell = CreateObject("WScript.Shell")
oShell.Run "taskkill /f /im C4B.XPhone.Commander.exe"
Wscript.Sleep 2000
oShell.Run "taskkill /f /im UCSingleSignOn.exe"

Wscript.Sleep 2000
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
& "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colProcessList = objWMIService.ExecQuery _
("Select * from Win32_Process Where Name = 'Outlook.exe'")
For Each objProcess in colProcessList
   objProcess.Terminate()
Next

Wscript.Sleep 6000
//Appdata local und Roaming Ordner löschen
Set WshNetwork = WScript.CreateObject("WScript.Network")
Dim FSO, Folder
set FSO=CreateObject("Scripting.FileSystemObject")

Folder = AppdataPath + "\C4B_Com_For_Business_AG"
FSO.DeleteFolder(Folder)

Folder1= LocalAppdataPath + "\C4B_Com_For_Business_AG"
FSO.DeleteFolder(Folder1)

Folder2 = AppdataPath + "\C4B"
FSO.DeleteFolder(Folder2)

Folder3= LocalAppdataPath + "\C4B"
FSO.DeleteFolder(Folder3)


