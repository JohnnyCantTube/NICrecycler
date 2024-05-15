cls

# Define the network adapter name
$adapterName = "LAN Ethernet"
$sec = 5
$totalDuration = 60
$startTime = Get-Date
$ConfirmPreference = "None"

Write-Host "This Windows Utility toggles the enable/disable"
Write-Host "of one user selected Network Adapter, with USER"
Write-Host "Selected duration and delay times."
Write-Host "-----------------------------------------------"
Write-Host " "
# Retrieve all network adapter names
$adapterNames = Get-NetAdapter | Select-Object -ExpandProperty Name

# Display available adapter names with corresponding numbers
Write-Host "Select from these available network adapters:"
for ($i = 0; $i -lt $adapterNames.Count; $i++) {
    Write-Host "$($i + 1). $($adapterNames[$i])"
}

Write-Host "-----------------------------------------------"

# Prompt the user to select an adapter
$adapterIndex = [int](Read-Host "Enter the number corresponding to the network adapter")
if ($adapterIndex -ge 1 -and $adapterIndex -le $adapterNames.Count) {
    $adapterName = $adapterNames[$adapterIndex - 1]
} else {
    Write-Host "Invalid selection. Exiting script..."
    exit
}

Write-Host "Enter CTRL-C at any time to abort this script..."

# Use the selected adapter name

Write-Host "Selected network adapter: $adapterName"
Write-Host " "

# Prompt the user for the total duration
$totalDuration = Read-Host "Enter the total duration in seconds (default: 60)"

# Use the default value if no input provided or if input is not a valid number
if (-not [string]::IsNullOrWhiteSpace($totalDuration) -and [int]::TryParse($totalDuration, [ref]$null)) {
    $totalDuration = [int]$totalDuration
} else {
    Write-Host "Defaulting to 60 seconds."
    $totalDuration = 60
}

# Check if the total duration is less than or equal to 0
if ($totalDuration -le 0) {
    Write-Host "Defaulting to 60 seconds."
    $totalDuration = 60
}

# Prompt the user for the disable delay time
$disableDelay = Read-Host "Enter the delay time in seconds for disabling the adapter (default: 1.5)"

# Use the default value if no input provided or if input is not a valid number
if (-not [string]::IsNullOrWhiteSpace($disableDelay) -and [double]::TryParse($disableDelay, [ref]$null)) {
    $disableDelay = [double]$disableDelay
} else {
    Write-Host "Defaulting to 1.5 seconds for disable delay."
    $disableDelay = 1.5
}

# Check if the disable delay time is less than or equal to 0
if ($disableDelay -le 0) {
    Write-Host "Defaulting to 1.5 seconds."
    $disableDelay = 1.5
}

# Prompt the user for the enable delay time
$enableDelay = Read-Host "Enter the delay time in seconds for enabling the adapter (default: 3.5)"

# Use the default value if no input provided or if input is not a valid number
if (-not [string]::IsNullOrWhiteSpace($enableDelay) -and [double]::TryParse($enableDelay, [ref]$null)) {
    $enableDelay = [double]$enableDelay
} else {
    Write-Host "Defaulting to 3.5 seconds for enable delay."
    $enableDelay = 3.5
}

# Check if the enable delay time is less than or equal to 0
if ($enableDelay -le 0) {
    Write-Host "Defaulting to 3.5 seconds."
    $enableDelay = 3.5
}

Write-Host " "
Write-Host "------------------START------------------------"

# Loop indefinitely until 'N' or 'NO' is pressed
while ((Get-Date) -lt ($startTime.AddSeconds($totalDuration))) {
    # Delay for 1 second (optional, adjust as needed)
    $confirmPreference = "None"
    
    Write-Host "Disabling network adapter '$adapterName'..."

    # Disable the network adapter
    Disable-NetAdapter -Name $adapterName -Confirm:$false
    Start-Sleep -Seconds $disableDelay
    
    Write-Host "Enabling network adapter '$adapterName'..."

    # Enable the network adapter
    Enable-NetAdapter -Name $adapterName -Confirm:$false
    Start-Sleep -Seconds $enableDelay
    
    Write-Host "PRESS n or N to STOP..."

    # Check if 'N' or 'NO' is pressed
    if ([System.Console]::KeyAvailable) {
        $key = [System.Console]::ReadKey($true)
        if ($key.KeyChar -eq 'N' -or $key.KeyChar -eq 'n') {
            break
        }
    }
}

Write-Host "NIC Reset Cycler complete... exiting."
Write-Host " "
