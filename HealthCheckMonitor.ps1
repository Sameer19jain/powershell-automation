# Parameters
$senderEmail = "<sameerjainexpress7@gmail.com>"
$senderPassword = ConvertTo-SecureString "<bznf vxjj nyhx vhoj>" -AsPlainText -Force  # Replace with your Gmail password (consider using app password for security)
$receiverEmail = "eccosportyo@gmail.com"
$mailSubject = "Test Email"
$mailBody = @"
Dear User,

This is a test email sent from PowerShell script.

Regards,
Your PowerShell Script
"@

# Function to send email
function Send-Email {
    param (
        [string]$to,
        [string]$from,
        [string]$subject,
        [string]$body,
        [string]$smtpServer,
        [System.Security.SecureString]$password
    )
    
    $credential = New-Object System.Management.Automation.PSCredential ($from, $password)
    
    $mailParams = @{
        To = $to
        From = $from
        Subject = $subject
        Body = $body
        SmtpServer = $smtpServer
        Credential = $credential
        Port = 587  # Gmail SMTP port for TLS
        UseSsl = $true
    }
    
    Send-MailMessage @mailParams
}

# Send the email
Send-Email -to $receiverEmail -from $senderEmail -subject $mailSubject -body $mailBody -smtpServer "smtp.gmail.com" -password $senderPassword
