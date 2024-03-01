# Define the path to the registry key
$Path = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"

# Define the name of the registry value to check
$Name = "DisableDomainCreds"

# Define the expected value of the registry value
$Value = "1"

# Retrieve the value of the registry value
$Registry = Get-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $Name

# If the registry value matches the expected value, output "Compliant"
If ($Registry -eq $Value){
    Write-Output "Compliant"
    #Exit 0
} 
# If the registry value does not match the expected value, remediate and output "Fixed"
Else {
    Write-Warning "Not Compliant. Attempting remediation..."
    # Set the registry value to the expected value
    Set-ItemProperty -Path $Path -Name $Name -Value $Value -Force
    # Verify remediation
    $RemediatedRegistry = Get-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $Name
    if ($RemediatedRegistry -eq $Value) {
        Write-Output "Fixed"
        Exit 0
    } else {
        Write-Warning "Remediation failed"
        Exit 1
    }
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
    Write-Warning "Not Compliant: RunAsPPL is not enabled. Attempting remediation..."
    # Set the registry value to the expected value
    Set-ItemProperty -Path $Path -Name $Name -Value $ExpectedValue -Force
    # Verify remediation
    $RemediatedValue = Get-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $Name
    if ($RemediatedValue -eq $ExpectedValue) {
        Write-Output "Fixed: RunAsPPL has been enabled"
        Exit 0
    } else {
        Write-Warning "Remediation failed"
        Exit 1
    }
}

#**************************************************************************************************************************
# Define the path to the registry key
$Path2 = "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters\"

# Define the name of the registry value to check
$Name2 = "RequireSecuritySignature"

# Define the expected value of the registry value
$Value2 = "1"

# Retrieve the value of the registry value
$Registry2 = Get-ItemProperty -Path $Path2 -Name $Name2 -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $Name2

# If the registry value matches the expected value, output "Compliant"
If ($Registry2 -eq $Value2){
    Write-Output "Compliant"
    #Exit 0
} 
# If the registry value does not match the expected value, remediate and output "Fixed"
Else {
    Write-Warning "Not Compliant. Attempting remediation..."
    # Set the registry value to the expected value
    Set-ItemProperty -Path $Path2 -Name $Name2 -Value $Value2 -Force
    # Verify remediation
    $RemediatedRegistry2 = Get-ItemProperty -Path $Path2 -Name $Name2 -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $Name2
    if ($RemediatedRegistry2 -eq $Value2) {
        Write-Output "Fixed"
        Exit 0
    } else {
        Write-Warning "Remediation failed"
        Exit 1
    }
}
