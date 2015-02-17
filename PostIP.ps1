Get-WmiObject `
   -Class Win32_NetworkAdapterConfiguration `
   -Filter IPEnabled=TRUE `
   -ComputerName . | 
Format-Table -Property IPAddress |
Out-File h:\LatestIP.txt

C:\"Program Files (x86)"\PuTTY\pscp.exe -scp H:\LatestIP.txt USER@HOST:
