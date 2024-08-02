function locationtest {
    param (
        [string]$landmark
        
    )
    $apiKey ="AIzaSyALakwmdLoDmKgmMjrGCdqew6lKuI-gE4I"

    # Encode the landmark for use in the URL
    $encodedLandmark = [System.Net.WebUtility]::UrlEncode($landmark)

    # Define the URL for the Google Maps Geocoding API request
    $url = "https://maps.googleapis.com/maps/api/geocode/json?address=$encodedLandmark&key=$apiKey"

    # Make the HTTP request and store the response
    $response = Invoke-RestMethod -Uri $url -Method Get

    # Check if the response contains results
    if ($response.status -eq "OK" -and $response.results.Count -gt 0) {
        # Get the first location from the results
        $location = $response.results[0].geometry.location

        # Return the longitude and latitude
        return @{
            Latitude  = $location.lat
            Longitude = $location.lng
        }
    } else {
        Write-Output "No results found for the landmark: $landmark"
        return $null
    }
}