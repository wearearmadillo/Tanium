' This script sets a registry key to mimic a software install
' Written by Daniel Oxley
' Shared under the BSD 3-Clause License
' https://github.com/wearearmadillo/Tanium

Option Explicit

Dim WshShell, myKey, strArg1, strArg2

If WScript.Arguments.Count <> 2 Then

    WScript.Echo
    WScript.Echo "ERROR: You must specify two command line arguments as follows: [Full path to registry key AND value] [value to set]"
    WScript.Echo
    WScript.Echo "EXAMPLE: cscript.exe DummyInstall.vbs HKLM\Software\DummyCorporation\Key\Value MyValue"
    WScript.Echo
    WScript.Quit(1)

Else

    strArg1 = WScript.Arguments.Item(0)
    strArg2 = WScript.Arguments.Item(1)

    WScript.Echo "Path to write to: " & strArg1
    WScript.Echo "Value to write: " & strArg2
    
    Set WshShell = CreateObject("WScript.Shell")
    myKey = strArg1
    WshShell.RegWrite myKey, strArg2,"REG_SZ"
    
    WScript.Echo "Write complete.  Exiting."
    WScript.Quit(0)

End If
