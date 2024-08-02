function Multiply {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory=$true)]
        [double]$Number1,

        [Parameter(Mandatory=$true)]
        [double]$Number2
    )

    Begin {
        Write-Verbose "Starting the multiplication process."
    }

    Process {
        $result = $Number1 * $Number2
        Write-Output $result
    }

    End {
        Write-Verbose "Multiplication process completed."
    }
}
