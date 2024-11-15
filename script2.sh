#!/bin/bash

# Install subdomain finder tool
figlet "Installing subdomain finder"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# Install service finder tool
figlet "Installing service finder tool"
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

# Install spidering tool
figlet "Installing spidering tool"
GO111MODULE=on go install github.com/jaeles-project/gospider@latest

# Install screenshotting tool
figlet "Installing screenshotting tool"
wget -q https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip -O /tmp/aquatone.zip
unzip -q /tmp/aquatone.zip -d /usr/local/bin

figlet "Installation completed"
