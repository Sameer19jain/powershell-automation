
Function location{
param ( [string]$place)

$api = "AIzaSyALakwmdLoDmKgmMjrGCdqew6lKuI-gE4I"


$gettingplace = [System.Net.WebUtility]:: UrlEncode($place)

$api_url = "https://maps.googleapis.com/maps/api/geocode/json?address=$gettingplace&key=$api"

$response = Invoke-RestMethod -Uri $api_url -Method Get
Write-Host "SAmeer"
Write-Host $response 
if($response.status -ne "OK")
{
   Write-Host "NO, not able to locate your place."
   
}
else{

$address = $response.results[0].formatted_address
$latitude = $response.results[0].geometry.location.lat
$longitude = $response.results[0].geometry.location.lng
}
Write-Host "Latitude : $latitude"
Write-Host "Longitude : $longitude"
Write-Host "Address : $address"
}