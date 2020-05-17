@ECHO OFF

PowerShell.exe -Command "& {Start-Process PowerShell.exe -windowstyle hidden -ArgumentList '-ExecutionPolicy Bypass -File ""C:\Your\Path\to\Error_Message.ps1""' -Verb RunAs}"

PowerShell.exe -Command "& {Start-Process PowerShell.exe -windowstyle hidden -ArgumentList '-ExecutionPolicy Bypass -File ""C:\Your\Path\to\Test_Connection.ps1""' -Verb RunAs}"



