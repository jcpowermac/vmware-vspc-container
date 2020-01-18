FROM mcr.microsoft.com/powershell:latest
COPY *.ps1 /root

RUN pwsh -command "Set-PSRepository -Name PSGallery -InstallationPolicy Trusted;Install-Module VMware.PowerCLI" > /dev/null
