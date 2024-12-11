# ========================================================================================
# NAME: exerciceDHCP1.ps1
# AUTHOR: RICHER Aymeric
# DATE: 04/12/2024
# ========================================================================================

[string]$name = Read-Host 'Entrez un nom a configurer pour l etendue'
[string]$startrange = Read-Host 'Entrez la premiere adresse a distribuer'
[string]$endrange = Read-Host 'Entrez la derniere adresse a distribuer'
[string]$subnetmask = Read-Host 'Entrez le masque de sous-reseau de l etendue'
[string]$gateway = Read-Host 'Entrez la passerelle a diffuser '

Write-Host " "
Write-Host "Le nom de l'etendue est : $name " -ForegroundColor Blue
Write-Host "La premiere adresse distribue est : $startrange" -ForegroundColor Blue
Write-Host "La derniere adresse distribue est : $endrange" -ForegroundColor Blue
Write-Host "Le masque de sous-reseau distribue est : $subnetmask" -ForegroundColor Blue
Write-Host "La passerelle à diffuser est : $gateway" -ForegroundColor Blue
Write-Host " "
$demande = Read-Host "Voulez-vous continuer le script (oui ou non) "

if ($demande -eq 'oui'){
    Add-DhcpServerv4Scope -Name $name -StartRange $startrange -EndRange $endrange -SubnetMask $subnetmask
    Set-DhcpServerv4OptionValue -Router $gateway
}
elseif ($demande -eq 'non'){
    Write-Host "Le script est annuler appuyer sur [Entree] pour continuer"
    Read-Host 
}
else {
     Write-Host 'Vous n avez pas rentrer la bonne valeur rentre soit oui soit non'
}










