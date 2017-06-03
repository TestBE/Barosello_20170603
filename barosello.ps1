Function Barosello
{
	[CmdletBinding( DefaultParameterSetName='RunLocal', SupportsShouldProcess=$True , ConfirmImpact='Low')] Param (				
		[ValidateNotNullOrEmpty()]
        [UInt16]
        $Range,

        [Switch]
		$PrintRes = $False
    )
    Set-StrictMode -Version 2.0
    $ForegroundColor = @{}
    $ForegroundColor["Baro"] = "Green"
    $ForegroundColor["Sello"] = "Red"
    $ForegroundColor["Nardo"] = "Yellow"
    $ForegroundColor["Barosello"] = "Blue"

    function Local:Get-Res
    {
        Param
        (
            [OutputType([IntPtr])]
        
            [Parameter( Position = 0, Mandatory = $True )]
            [UInt16]
            $PrimoNum,
            [Parameter( Position = 1, Mandatory = $True )]
            [UInt16]
            $SecondoNum,
            [Parameter( Position = 2, Mandatory = $True )]
            [UInt16]
            $TerzoNum
        )
        If ($i -eq 0) {$i}
        ElseIf ($i % $PrimoNum -eq 0){
            If ($i % $SecondoNum -eq 0) {Return "BaroSello"}
            Else {Return "Baro"}
        }
        ElseIf ($i % $TerzoNum -eq 0) {Return "Nardo"}
        Else {
            If ($i % $SecondoNum -eq 0){
                Return "Sello"
            }
            Else { Return $i }
        }
    }
    For ($i=0; $i -le $Range; $i++)
    {
        $Res = Get-Res 3 5 7
        if ( $PrintRes )
        {
            if ($Res -is [int]) {Write-Host $Res}
            else {Write-Host $Res -foreground $ForegroundColor[$Res]}
        }
        else
        {
            Write-Output "Risultato calcolato ma non stampato"
        }
    }
}
