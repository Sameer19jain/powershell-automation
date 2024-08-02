<#
.Synopsis
   Short description
.DESCRIPTION
   Long description
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
.INPUTS
   Inputs to this cmdlet (if any)
.OUTPUTS
   Output from this cmdlet (if any)
.NOTES
   General notes
.COMPONENT
   The component this cmdlet belongs to
.ROLE
   The role this cmdlet belongs to
.FUNCTIONALITY
   The functionality that best describes this cmdlet
#>
function update-windowservice
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([String])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true,  
                   Position=0)]
        $ServiceName,

        # Param2 help description
        [Parameter(ParameterSetName='StopSet')]
        [switch]$Stop,

        # Param3 help description
        [Parameter(ParameterSetName='RestartSet')]
        [Switch]$Restart
    )

    Begin
    {
    Write-Verbose "Updating $ServiceName...."
    }
    Process
    {
       if ($Stop)
       {
       Set-Service -Name $ServiceName -Status Stopped

       }
       elseif($Restart)
       {
       Set-service -Name $ServiceName -Status Running

       }
    }
    End
    {
    Write-Verbose "Done Updating $ServiceName."
    }
}