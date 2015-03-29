$url = "http://checkip.dyndns.com" 
$webclient = New-Object System.Net.WebClient
$ip = ($webclient.DownloadString($url)).Split(" ")[5].replace("</body>","").replace("</html>","")
#print it
$ip

Remove-Item $env:USERPROFILE\MyIP.txt
Remove-Variable ip, webclient, url

#write IP to file
$ip | Out-File $env:USERPROFILE\MyIP.txt

#send it via pscp
C:\pscp.exe -pw <PASSWORD> -scp $env:USERPROFILE\MyIP.txt <USER>@<HOST>: 