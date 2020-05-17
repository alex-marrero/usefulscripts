# Wait for connection to Domain Controller

$DCip = #IP Address or FQDN of your Domain Controller

$Welcome_Message_Location = #Path to Welcome Message

$DJsript = #path to Domain join Script

do {
    $ping = test-connection -comp $DCip -count 1 -Quiet 
  } until ($ping) 
  
  // 
  
  PowerShell.exe -Command "& {Start-Process PowerShell.exe -windowstyle hidden -ArgumentList '-ExecutionPolicy Bypass -File "$Welcome_Message_Location"' -Verb RunAs}"
  
  PowerShell.exe -Command "& {Start-Process PowerShell.exe -windowstyle hidden -ArgumentList '-ExecutionPolicy Bypass -File "$DJsript"' -Verb RunAs}"