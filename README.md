- This PowerShell script is designed for use in a legitimate penetration testing environment.It allows penetration testers to authenticate multiple hosts via WMI or SMB using a password hash to determine whether the local administrator credential is valid.


# Requirements


    PowerShell 5.1 or later

    Appropriate permissions and access to the target systems


# Use

- Open PowerShell or a PowerShell Integrated Scripting Environment (ISE).

- Modify the script to include the actual password hash and desired username. Replace ***"INSERT_PASSWORD_HASH_HERE"*** with the password hash and ***"INSERT_USERNAME_HERE"*** with the username.

- Customize the list of target hosts under the $Hosts variable to include the IP addresses or hostnames of the systems you want to test.

`Run the script by executing .\penetration_test_script.ps1 in PowerShell.`

- Review the output to determine the success or failure of authentication attempts.

# Notes

- This script should only be used for authorized penetration testing activities in a controlled environment. Ensure you have proper authorization and permission from the target organization before using the script.

- Additional actions or commands can be added within the script to further test the security of target systems.

# Disclaimer


- The author and contributors of this script are not responsible for any misuse or illegal activities conducted using this script. Use it at your own risk.

- This script is provided as-is without any warranty or guarantee of its effectiveness or suitability for any specific purpose.
    

# References

![PowerShell](https://learn.microsoft.com/en-us/powershell/).

![win32](https://learn.microsoft.com/en-us/windows/win32/cimwin32prov/win32-computersystem).

![smbShare](https://learn.microsoft.com/en-us/powershell/module/smbshare/?view=windowsserver2022-ps&viewFallbackFrom=win10-ps).


