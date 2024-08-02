# Parameters
$apiUrl = "http://localhost:5500/health"
$toEmail = "Inderpreet.Singh@avl.com"
$fromEmail = "Sameer.Jain@avl.com"
$smtpServer = "smtp.gmail.com"
$smtpPort = 587 
#$smtpUser = ""
#$smtpPass = "Miet@123"

# Function to send email
function Send-Email {
    param (
        [string]$to,
        [string]$subject,
        [string]$body
    )
    $message = New-Object system.net.mail.mailmessage
    $message.From = $fromEmail
    $message.To.Add($to)
    $message.Subject = $subject
    $message.Body = $body
    $smtp = New-Object Net.Mail.SmtpClient($smtpServer, $smtpPort)
    #$smtp.EnableSsl = $true
    #$smtp.Credentials = New-Object System.Net.NetworkCredential($smtpUser, $smtpPass)
    $smtp.Send($message)
}

# Infinite loop to check API status
while ($true) {
    try {
        $response = Invoke-RestMethod -Uri $apiUrl -Method Get
        if ($response -eq "Nok") {
            $subject = "API Health Check Alert"
            $body = "The application returned 'Nok' status."
            Send-Email -to $toEmail -subject $subject -body $body
            Send-Email -to $fromEmail -subject $subject -body $body
        }
    } catch {
        Write-Host "Failed to call API: $_.Message"
    }
    Start-Sleep -Seconds 1
}
