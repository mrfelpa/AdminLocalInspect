
Import-Module -Name 'CimCmdlets'
Import-Module -Name 'SmbShare'

$PasswordHash = "INSERT_PASSWORD_HASH_HERE"
$Username = "INSERT_USERNAME_HERE"

if ([string]::IsNullOrEmpty($PasswordHash) -or [string]::IsNullOrEmpty($Username)) {
    Write-Host "Error: Password hash and username must be provided."
    return
}


$Hosts = @(
    "192.168.1.1",
    "192.168.1.2",
    "192.168.1.3"
)

if ($Hosts.Count -eq 0) {
    Write-Host "Error: At least one host must be provided."
    return
}

function Test-WmiAuthentication {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Host,
        [Parameter(Mandatory=$true)]
        [System.Management.Automation.PSCredential]$Credential
    )

    try {
        $WmiParams = @{
            ComputerName = $Host
            Credential = $Credential
            ErrorAction = 'Stop'
            ErrorVariable = 'WmiError'
        }
        $result = Get-CimInstance -Class Win32_ComputerSystem -Namespace 'root\CIMv2' @WmiParams -ErrorAction Stop
        
        if ($result) {
            Write-Host "Authentication successful via WMI on host: $Host"
            # Additional actions or commands can be added here for further testing
        } else {
            Write-Host "Authentication failed via WMI on host: $Host"
        }
    } catch {
        Write-Host "Authentication failed via WMI on host: $Host"
        Write-Host "Error: $($_.Exception.Message)"
        Write-Host "WMI Error: $($WmiError)"
    }
}

# Function to test authentication via SMB
function Test-SmbAuthentication {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Host,
        [Parameter(Mandatory=$true)]
        [System.Management.Automation.PSCredential]$Credential
    )

    try {
        $SmbParams = @{
            CimSession = New-CimSession -ComputerName $Host -Credential $Credential -ErrorAction Stop
            ErrorVariable = 'SmbError'
        }
        $result = Get-SmbShare @SmbParams -ErrorAction Stop

        if ($result) {
            Write-Host "Authentication successful via SMB on host: $Host"
            # Additional actions or commands can be added here for further testing
        } else {
            Write-Host "Authentication failed via SMB on host: $Host"
        }
    } catch {
        Write-Host "Authentication failed via SMB on host: $Host"
        Write-Host "Error: $($_.Exception.Message)"
        Write-Host "SMB Error: $($SmbError)"
    }
}

try {
    $SecurePassword = ConvertTo-SecureString -String $PasswordHash -AsPlainText -Force
    $Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $Username, $SecurePassword -ErrorAction Stop
} catch {
    Write-Host "Error: $($_.Exception.Message)"
    return
}

foreach ($Host in $Hosts) {
    Test-WmiAuthentication -Host $Host -Credential $Credential
    Test-SmbAuthentication -Host $Host -Credential $Credential
}
