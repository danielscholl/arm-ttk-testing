# Use the CBL-Mariner base image
FROM mcr.microsoft.com/cbl-mariner/base/core:2.0

# Install Dependencies
RUN tdnf update -y && tdnf install -y ca-certificates powershell unzip && \
    tdnf clean all

# Download and unzip the latest version
RUN pwsh -c " \
    Invoke-WebRequest -Uri https://github.com/Azure/arm-ttk/releases/download/20240328/arm-ttk.zip -OutFile /tmp/arm-ttk.zip; \
    Expand-Archive -Path /tmp/arm-ttk.zip -DestinationPath /opt/arm-ttk; \
    "

# Set up workspace
WORKDIR /workspace

# Copy the test scripts
COPY tests/*.ps1 /workspace/

# Set pwsh as the entrypoint and test.ps1 as the command to be run
ENTRYPOINT ["pwsh", "-File", "/workspace/test.ps1"]

