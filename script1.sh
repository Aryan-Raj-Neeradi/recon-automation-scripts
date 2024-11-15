#!/bin/bash

# Update and install necessary design tools
apt-get update && apt-get install -y figlet toilet

# Install Go language
wget -q https://go.dev/dl/go1.18.3.linux-amd64.tar.gz -P ~/Downloads
tar -C /usr/local -xzf ~/Downloads/go1.18.3.linux-amd64.tar.gz

# Set Go environment variables
cat <<EOL >> ~/.zshrc
export GOPATH=/usr/local
export GOROOT=/usr/local/go
export PATH=\$PATH:\$GOROOT/bin:\$GOPATH/bin
EOL

figlet "Go installation completed"
echo "Run: source ~/.zshrc"
