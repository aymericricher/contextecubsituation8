# ========================================================================================
# NAME: exerciceDHCP3.ps1
# AUTHOR: RICHER Aymeric
# DATE: 04/12/2024
# ========================================================================================

[int]$nombre = Read-Host 'combien voulez vous faire d etendue'


for ($i=0; $i -lt $nombre; $i++) {

    [void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')
    [string]$name = [Microsoft.VisualBasic.Interaction]::InputBox("entrez le nom de l etendu")
    [string]$startrange = [Microsoft.VisualBasic.Interaction]::InputBox('Entrez la premiere adresse a distribuer')
    [string]$endrange = [Microsoft.VisualBasic.Interaction]::InputBox('Entrez la derniere adresse a distribuer')
    [string]$subnetmask = [Microsoft.VisualBasic.Interaction]::InputBox('Entrez le masque de sous-reseau de l etendue')
    [string]$gateway = [Microsoft.VisualBasic.Interaction]::InputBox('Entrez la passerelle a diffuser ')
    [string]$domainname = [Microsoft.VisualBasic.Interaction]::InputBox('Entrez le nom de domaine que vous voulez definir ')
    [string]$dns = [Microsoft.VisualBasic.Interaction]::InputBox('Entrez l adresse du DNS a distribuer ')

    Write-Host " "
    Write-Host "Le nom de l'etendue est : $name " -ForegroundColor Blue
    Write-Host "La premiere adresse distribue est : $startrange" -ForegroundColor Blue
    Write-Host "La derniere adresse distribue est : $endrange" -ForegroundColor Blue
    Write-Host "Le masque de sous-reseau distribue est : $subnetmask" -ForegroundColor Blue
    Write-Host "La passerelle à diffuser est : $gateway" -ForegroundColor Blue
    Write-Host "Le nom de doamine a diffuser est $domainname" -ForegroundColor Blue
    Write-Host "L'adresse du dns a distribuer est $dns" -ForegroundColor Blue
    Write-Host " "
    $demande = Read-Host "Voulez-vous continuer le script (oui ou non) "

    if ($demande -eq 'oui'){
        Add-DhcpServerv4Scope -Name $name -StartRange $startrange -EndRange $endrange -SubnetMask $subnetmask 
        Set-DhcpServerv4OptionValue -Router $gateway -DnsServer $dns -DnsDomain $domainname
    }
    elseif ($demande -eq 'non'){
        Write-Host "Le script est annuler appuyer sur [Entree] pour continuer"
        Read-Host 
    }
    else {
         Write-Host 'Vous n avez pas rentrer la bonne valeur rentre soit oui soit non'
    }

}


