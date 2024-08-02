$From = "Sameer.Jain@avl.com"
$To = "Anshul.Sharma@avl.com"
$Subject = "Test email from PowerShell"
$Body = "This is a test email sent from PowerShell using Gmail SMTP."

$SMTPServer = "10.12.100.11"
#$Cred = (Get-Credential -Credential $From)

#$Port = 0
#-Credential $Cred

Send-MailMessage -To $To -From $From -Subject $Subject -Body $Body -SmtpServer $SMTPServer  

