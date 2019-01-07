Dim deviceList() 
i = 0 
Set objFSO = CreateObject("Scripting.FileSystemObject") 
Set objFile = objFSO.OpenTextFile("servers.txt", 1)                                                               

Do Until objFile.AtEndOfStream 
	Redim Preserve deviceList(i) 
	deviceList(i) = objFile.ReadLine 
	i = i + 1 
Loop 

objFile.Close 


For Each ipAddress in deviceList
	set oShell = CreateObject("WScript.Shell")
	oShell.run("Telnet " + ipAddress +" 23")	
	WScript.Sleep 1000
	oShell.SendKeys("id")
	WScript.Sleep 1000
	oShell.SendKeys("{Enter}")	
	WScript.Sleep 1000
	oShell.SendKeys("password")
	WScript.Sleep 1000
	oShell.SendKeys("{Enter}")
	WScript.Sleep 1000
	oShell.SendKeys("hangup all")
	WScript.Sleep 1000
	oShell.SendKeys("{Enter}")
	WScript.Sleep 1000		
	oShell.SendKeys("exit")
	WScript.Sleep 1000		
	oShell.SendKeys("{Enter}")			
Next
