# Set the minimum password age for local accounts
# Requires PowerShell version 5.1 or later

# Define the desired minimum password age (in days)
$MinPasswordAgeDays = 1

# Set the minimum password age
Set-ADDefaultDomainPasswordPolicy -Identity "domain.com" -MinPasswordAge "$MinPasswordAgeDays.00:00:00"

#------------------------------------------------------------------------------------------------------------------------------------------
# Set the Account lockout duration to 15 minutes

# Define the desired lockout duration (in minutes)
$LockoutDurationMinutes = 15

# Set the lockout duration
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Services\Netlogon\Parameters' -Name 'LockoutDuration' -Value $LockoutDurationMinutes

#------------------------------------------------------------------------------------------------------------------------------------------
# Set the Account lockout counter to 15 minutes

# Define the desired lockout duration (in minutes)
$LockoutDCounterMinutes = 15

# Set the lockout duration
Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows\AccountLockout' -Name 'ResetTime' -Value $LockoutDCounterMinutes -Force

#------------------------------------------------------------------------------------------------------------------------------------------
# Enable Camera On/Off On-screen Display notifications
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam\NonPackaged" -Name "Value" -Value "Allow"
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam\NonPackaged" -Name "ShellExecute" -Value "ms-camera:"

#------------------------------------------------------------------------------------------------------------------------------------------
