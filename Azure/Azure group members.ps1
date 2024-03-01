# Import the AzureAD PowerShell module
Import-Module AzureAD

# Set the path where the output file will be saved
$outputPath = "AzureADGroupsAndMembers.xlsx"

# Get a list of all AzureAD groups
$groups = Get-AzureADGroup -All $true

# Create an empty array to store the group and member information
$groupMemberInfo = @()

# Create an empty array to store the empty groups
$emptyGroups = @()

# Loop through each group
foreach ($group in $groups) {
    # Get the members of the group
    $members = Get-AzureADGroupMember -ObjectId $group.ObjectId -All $true

    # Check if the group has no members
    if ($members.Count -eq 0) {
        $emptyGroups += $group.DisplayName
    }

    # Loop through each member and add the group and member information to the array
    foreach ($member in $members) {
        $groupMemberInfo += [PSCustomObject]@{
            GroupName = $group.DisplayName
            MemberName = $member.DisplayName
            MemberType = $member.ObjectType
            MemberEmail = $member.UserPrincipalName
        }
    }
}

# Export the group and member information to a spreadsheet
$groupMemberInfo | Export-Excel -Path $outputPath -AutoSize -AutoFilter -FreezeTopRow -WorksheetName "AzureAD Groups and Members"

# Create a new tab for the empty groups
$emptyGroups | Export-Excel -Path $outputPath -WorksheetName "Empty Groups"