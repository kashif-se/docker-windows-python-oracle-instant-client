FROM python:windowsservercore

# Install Chocolaty
RUN powershell Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
# Install Microsoft Visual C++ Redistributable (used by oracle client) via chocolatey

RUN ["choco", "install", "vcredist2017", "-y", "--allow-empty-checksums"] 
# Install Oracle Client
RUN wget "https://download.oracle.com/otn_software/nt/instantclient/19900/instantclient-basic-windows.x64-19.9.0.0.0dbru.zip" -outfile "instantclient.x64.zip"

RUN powershell -Command "expand-archive -Path 'instantclient.x64.zip' -DestinationPath 'c:\\oracle\'"

RUN pip install --no-cache-dir SQLAlchemy cx-Oracle

# Set path to oracle client
RUN "[Environment]::SetEnvironmentVariable(\"Path\", $env:Path + \";C:\\oracle\instantclient_19_9\\\", [EnvironmentVariableTarget]::Machine)"
SHELL ["powershell", "-command"]
