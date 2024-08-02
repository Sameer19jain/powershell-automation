#a script
function helloworld
{
param ($firstname, $lastname)

Write-Host "hello $firstname $lastname"
Write-Host "you are logging from $env:COMPUTERNAME"
Write-Host "this thing is sytem generated"
}
