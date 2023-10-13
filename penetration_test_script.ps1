# Import the required modules
Import-Module -Name 'CimCmdlets'
Import-Module -Name 'SmbShare'

$PasswordHash = "INSERT_PASSWORD_HASH_HERE"
$Username = "INSERT_USERNAME_HERE"

# Define the list of hosts to test
$Hosts = @(
    "192.168.1.1",
    "192.168.1.2",
    "192.168.1.3"
)

foreach ($Host in $Hosts) {
    # Construct the credential object using the password hash
    $SecurePassword = ConvertTo-SecureString -String $PasswordHash -AsPlainText -Force
    $Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $Username, $SecurePassword

    try {
        $WmiParams = @{
            ComputerName = $Host
            Credential = $Credential
            ErrorAction = 'Stop'
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
    }

    try {
        $SmbParams = @{
            CimSession = New-CimSession -ComputerName $Host -Credential $Credential -ErrorAction Stop
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
    }
}
