# Docker Windows Python Oracle Instant Client
[![Build Status](https://travis-ci.com/kashif-se/docker-windows-python-oracle-instant-client.svg?branch=main)](https://travis-ci.com/kashif-se/docker-windows-python-oracle-instant-client)

Windows Container to Run python applications with Oracle Instant client
![cx_Oracle Architecture](https://cx-oracle.readthedocs.io/en/latest/_images/cx_Oracle_arch.png)

# What this Image contains
This image is extended from Windows Server Core Python image (`python:windowsservercore`)
We have installed Chocolaty which is used install Microsoft Visual C++ Redistributable (used by oracle client).

Currently Instant Client for Microsoft Windows (x64) 64-bit Version 19.9.0.0.0 Basic Package is installed and configured. 
> Build is tested with **Windows Server 2019**.
You can use the Docker file to extend it for other versions of windows too
### Preinstalled Python Libraries
1. cx_Oracle 
1. SQLAlchemy

You may install additional libraries. (Refer to [example](example))
### Sample Dockerfile
```dockerfile
FROM kshfse/windows-python-oracle-instant-client
WORKDIR C:\\app
COPY ./src/ .
RUN pip install --no-cache-dir -r requirements.txt
CMD [ "python", "./app.py" ]
```



Reference: 
1. [cx_Oracle: Python](https://cx-oracle.readthedocs.io/en/latest/user_guide/introduction.html)
2. [Oracle Instant Client Documentation](https://www.oracle.com/sg/database/technologies/instant-client/winx64-64-downloads.html#ic_winx64_inst)