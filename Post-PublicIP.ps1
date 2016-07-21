$url = "http://checkip.dyndns.com" 
$webclient = New-Object System.Net.WebClient
$ip = ($webclient.DownloadString($url)).Split(" ")[5].replace("</body>","").replace("</html>","")
#print it
$ip
If( (Test-Path $env:USERPROFILE\MyIP.txt) -eq $true ) {
    Remove-Item $env:USERPROFILE\MyIP.txt
}


#write IP to file
$ip | Out-File $env:USERPROFILE\MyIP.txt



#send it via pscp
#C:\pscp.exe -pw <PASSWORD> -scp $env:USERPROFILE\MyIP.txt <USER>@<HOST>: 

Remove-Variable ip, webclient, url