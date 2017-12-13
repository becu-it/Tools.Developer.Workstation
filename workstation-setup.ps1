function ChocolateyInstall{
	New-Item c:\helloVMExt.txt -type file
	& @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
}

function InstallSoftware{
    $softwares = "visualstudiocode"
    
    foreach($software in $softwares){
        choco install $software -y
    }
}

function RegisterNuGetSource{
    nuget sources Add -Name BECU -Source http://nuget.inside.becu.org
}

function CopyHostsFile{
    COPY hosts C:\Windows\System32\drivers\etc\ /y
}

function RegisterTFSWorkspace{
    Set-Alias tf "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\IDE\CommonExtensions\Microsoft\TeamFoundation\Team Explorer\tf.exe"
    tf workspace /new BECUPP /server:http://projectspp/tfs/BECU /comment:"BECUPreProd" /noprompt 
}

ChocolateyInstall
#InstallSoftware
#RegisterNuGetSource
#CopyHostsFile
#RegisterTFSWorkspace
