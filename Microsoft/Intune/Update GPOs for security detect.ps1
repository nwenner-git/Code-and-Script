# Define the path to the registry key
$Path = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"

# Define the name of the registry value to check = VALUENAME
$Name = "DisableDomainCreds"

# Define the expected value of the registry value = VALUE DATA
$Value = "1"

# Retrieve the value of the registry value
$Registry = Get-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $Name

# If the registry value matches the expected value, output "Compliant"
If ($Registry -eq $Value){
    Write-Output "Compliant"
    Exit 0
} 
# If the registry value does not match the expected value, output "Not Compliant"
Else {
    Write-Warning "Not Compliant"
    Exit 1
}

#**************************************************************************************************************************
# Define the path to the registry key
$Path = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"

# Define the name of the registry value to check
$Name = "RunAsPPL"

# Define the expected value of the registry value
$ExpectedValue = 1

# Retrieve the actual value of the registry
$ActualValue = Get-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $Name

# Check if the actual value matches the expected value
if ($ActualValue -eq $ExpectedValue) {
    Write-Output "Compliant: RunAsPPL is enabled"
    Exit 0
} else {
    Write-Warning "Not Compliant: RunAsPPL is not enabled"
    Exit 1
}

#**************************************************************************************************************************
# Define the path to the registry key
$Path2 = "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters\"

# Define the name of the registry value to check = VALUENAME
$Name2 = "RequireSecuritySignature"

# Define the expected value of the registry value = VALUE DATA
$Value2 = "1"

# Retrieve the value of the registry value
$Registry2 = Get-ItemProperty -Path $Path2 -Name $Name2 -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $Name2

# If the registry value matches the expected value, output "Compliant"
If ($Registry2 -eq $Value2){
    Write-Output "Compliant"
    Exit 0
} 
# If the registry value does not match the expected value, output "Not Compliant"
Else {
    Write-Warning "Not Compliant"
    Exit 1
}