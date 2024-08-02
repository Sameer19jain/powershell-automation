# Define email details
$smtpServer = "10.12.100.11"  # Replace with your SMTP server IP address or domain
$from = "Sameer.Jain@avl.com"
$to = "Anshul.Sharma@avl.com"
$subject = "Your Subject Here"
$body = "Your email body here."

# Send the email
Send-MailMessage -SmtpServer $smtpServer -From $from -To $to -Subject $subject -Body $body
