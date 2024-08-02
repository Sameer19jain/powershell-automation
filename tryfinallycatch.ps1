try
{
  $testVariable = 'This is test.'
  Write-Host 'Statement before the error.'
  [System.IO.File]::ReadAllLines('C:\does\not\exist.txt')
  Write-Host 'Statement after the error'
}
catch [System.IO.IOException]
{
    Write-Host "An exception was caught."
    Write-Host "Exception type :$($_.Exception.GetType().FullName)"
}
catch 
{
    Write-Host "some other type of exception was caught"
}
finally
{
    $testVariable = 'The finally block was executed.'
}
$testVariable