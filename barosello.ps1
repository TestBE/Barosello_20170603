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
    
    #Import-module InvokeTwitterAPIs
    
    $ForegroundColor = @{}
    $ForegroundColor["Baro"] = "Green"
    $ForegroundColor["Sello"] = "Red"
    $ForegroundColor["Nardo"] = "Yellow"
    $ForegroundColor["Barosello"] = "Blue"
    
    $PrintOnConsole = @{}
    $PrintOnConsole["Baro"] = $False
    $PrintOnConsole["Sello"] = $True
    $PrintOnConsole["Nardo"] = $False
    $PrintOnConsole["Barosello"] = $True
    
    $PrintOnTwitter = @{}
    $PrintOnTwitter["Baro"] = $True
    $PrintOnTwitter["Sello"] = $True
    $PrintOnTwitter["Nardo"] = $False
    $PrintOnTwitter["Barosello"] = $True

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
        $CallStub = Get-Res 3 5 7
        If ( $PrintRes )
        {
            If (!($CallStub -is [int]))
            {
                If ($PrintOnConsole[$CallStub])
                {
                    Write-Host $CallStub -foreground $ForegroundColor[$CallStub]
                }
                If ($PrintOnTwitter[$CallStub])
                {
                    #$OAuth = @{'ApiKey' = 'yourapikey'; 'ApiSecret' = 'yourapisecretkey';'AccessToken' = 'yourapiaccesstoken';'AccessTokenSecret' = 'yourapitokensecret'}
                    #Invoke-TwitterRestMethod -ResourceURL 'https://api.twitter.com/1.1/direct_messages/new.json' -RestVerb 'POST' -Parameters @{'text' = $Res; 'screen_name' = 'TestBE' } -OAuthSettings $OAuth 
                    
                    $req = [System.Net.WebRequest]::Create("https://api.twitter.com/1.1/direct_messages/new.json")
                    $req.Method ="POST"
                    $req.ContentLength = 0
                    Write-Output "Risultato postato su Twitter"
                }
            }
        }
        else
        {
            Write-Output "Risultato calcolato ma non stampato"
        }
    }
}
