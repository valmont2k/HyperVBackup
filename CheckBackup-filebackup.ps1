[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
function Postto-Mattermost {
<#
.Synopsis
   Post text to a Mattermost Channel via Webhooks
.DESCRIPTION
   Long description
.EXAMPLE
   Postto-Mattermost -uri "http://mattermost.foo.com/hooks/xxxxxxxxxxxxxxxxx" -text ”New message from Powershell” -user "Powershell"
.INPUTS
   $uri,$text,$user
.NOTES
   All Inputs are Mandatory
#>
    [CmdletBinding()]Param
    (
        # Incoming Webhook
        [Parameter(Mandatory=$true
        )]
        $uri,
        # Body of message
        [Parameter(Mandatory=$true
        )]
        $text,
        # Username to post as
        [Parameter(Mandatory=$true
        )]
        $user
     )
    $Payload = @{ text=$text; username=$user;icon_url="http://mattermost.foo.com/static/files/9553d68e1373302618a3436d408aca6b.jpg"}
    Invoke-RestMethod -Uri $uri -Method Post -ContentType 'application/json' -Body (ConvertTo-Json $Payload)
}


$cmdOutput = Get-Childitem -Path C:\backups\ -File | Select-Object -Property 'Name', 'Length'

$serverinfo = 'Backup on srv-hv-kgd result:'

foreach($line in $cmdOutput)
{
   #parsing



if ($line -match '.Length=22}') {
Postto-Mattermost -uri "http://mattermost.foo.com/hooks/dxbxo5i19ty4zpj4swhkgcpymh" -text "$serverinfo $line :x:" -user "backup"
}



Postto-Mattermost -uri "http://mattermost.foo.com/hooks/dxbxo5i19ty4zpj4swhkgcpymh" -text "$serverinfo $line" -user "backup"
}

