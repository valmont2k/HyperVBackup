﻿[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
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


#$cmdOutput = Get-Childitem -Path H:\backup\ -Directory 
#| Select-Object -Property 'Name' 

$serverinfo = 'Backup on srv-hv result:'






  
$cmdOutput = Get-ChildItem H:\backup\ | where {$_.psIscontainer} | Foreach {
		$r = robocopy $_.FullName c:\dummy /l /xj /e /nfl /ndl /njh /bytes /r:0
		$data = $r -match "(Files|Bytes)" -replace "\s+(Files|Bytes)\s+:\s+" | Foreach {$_.split(" ")[0]}
		New-Object PSObject -Property @{Folder=$_.FullName;Files=$data[0];"Size(mb)"=$data[1]/1mb;"Size(Gb)"=$data[1]/1gb}

}



foreach($line in $cmdOutput)
{	



if ($line -match '.Length=22}') {
Postto-Mattermost -uri "http://mattermost.foo.com/hooks/dxbxo5i19ty4zpj4swhkgcpymh" -text "$serverinfo $line :sos::x:BACKUP FAILED!:arrow_down: " -user "backup"
}

if ($line -match '.Size(Gb)=0}') {
Postto-Mattermost -uri "http://mattermost.foo.com/hooks/dxbxo5i19ty4zpj4swhkgcpymh" -text "$serverinfo $line :sos::x:BACKUP FAILED!:arrow_down: " -user "backup"
}

if ($line -match '.{Files=0.') {
Postto-Mattermost -uri "http://mattermost.foo.com/hooks/dxbxo5i19ty4zpj4swhkgcpymh" -text "$serverinfo $line :sos::x:BACKUP FAILED!:arrow_down: " -user "backup"
}


Postto-Mattermost -uri "http://mattermost.foo.com/hooks/dxbxo5i19ty4zpj4swhkgcpymh" -text "$serverinfo $line" -user "backup"
}

