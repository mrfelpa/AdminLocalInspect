This PowerShell script is designed for use in a legitimate penetration testing environment.It allows penetration testers to authenticate multiple hosts via WMI or SMB using a password hash to determine whether the local administrator credential is valid.


# Requirements


    PowerShell 5.1 or later

    Appropriate permissions and access to the target systems


# Installation and use

Clone or download the repository to your local machine.

Open a PowerShell session or a PowerShell Integrated Scripting Environment (ISE).

Navigate to the directory where the script is located.

Modify the script to include the actual password hash and desired username. Replace ***"INSERT_PASSWORD_HASH_HERE"*** with the password hash and ***"INSERT_USERNAME_HERE"*** with the username.

Customize the list of target hosts under the ***$Hosts*** variable to include the IP addresses or hostnames of the systems you want to test.


# Possible Problems and Solutions


***Script Execution Policy:*** If you encounter an error related to script execution policy, you may need to adjust the execution policy to allow running the script.
Open a PowerShell session as an administrator and execute the ***command Set-ExecutionPolicy -ExecutionPolicy Bypass*** to temporarily bypass the execution policy.

***Access Denied Error:*** If you receive an ***"Access Denied" error*** while attempting authentication, ensure that you have the necessary permissions and credentials to access the target systems. Check the provided username and password hash to ensure they are correct and have sufficient privileges.

  ***Firewall Restrictions:*** If the script fails to authenticate due to firewall restrictions, ensure that the required ports ***(e.g., WMI - TCP 135, SMB - TCP 445)*** are open and accessible on the target systems.

***Invalid IP Addresses or Hostnames:*** Double-check the list of target hosts under the ***$Hosts*** variable to ensure that all IP addresses or hostnames are correctly specified.

# Notes

    This script should only be used for authorized penetration testing activities in a controlled environment. Ensure you have proper authorization and permission from the target organization before using the script.

Additional actions or commands can be added within the script to further test the security of target systems.

# Disclaimer


    The author and contributors of this script are not responsible for any misuse or illegal activities conducted using this script. Use it at your own risk.

    This script is provided as-is without any warranty or guarantee of its effectiveness or suitability for any specific purpose.
