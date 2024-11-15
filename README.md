# Recon Automation Scripts

This repository contains Bash scripts to automate reconnaissance tasks for cybersecurity, using tools such as subdomain finders, service discovery, web spidering, and more. The scripts are designed to install, configure, and execute tools for performing reconnaissance on a specified domain.

## Table of Contents
- [Tools Used](#tools-used)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Details of Tools](#details-of-tools)

## Tools Used
The scripts use the following tools:
1. **Figlet** - For creating banner-like ASCII art text.
2. **Toilet** - Similar to Figlet for styled text output.
3. **Go Language** - Required for installing some Go-based security tools.
4. **Subfinder** - A tool for passive subdomain enumeration.
5. **Httpx** - A tool for probing web services and discovering live domains.
6. **Gospider** - A web spidering tool for crawling domains and extracting URLs.
7. **Aquatone** - A tool for capturing screenshots of web services.

## Prerequisites
- Ensure you are using a Linux-based system.
- Have `sudo` privileges to install tools.

## Installation

### Step-by-Step Installation

## 1. Clone this repository:

git clone https://github.com/your-username/recon-automation-scripts.git

cd recon-automation-scripts
   
## 2.Make the scripts executable:

chmod +x script1.sh script2.sh

Run the first script to install necessary tools:

./script1.sh

## This script will:

Update your system and install figlet and toilet.
Install the Go language.
Set up Go environment variables.

## Run the second script to install and configure reconnaissance tools:

./script2.sh

## This script will:

- Install subfinder for subdomain enumeration.

- Install httpx for service probing.

- Install gospider for web crawling.

- Install aquatone for screenshotting services.

## Run the main script to perform reconnaissance:

./recon-automation.sh

Enter the domain you want to perform reconnaissance on when prompted.

## Detailed Description of Tools

## 1. Figlet and Toilet

**Purpose**: Display banner text in ASCII art style, useful for headers and readability in terminal scripts.

**Usage**: Automatically used within scripts for styling output.

## 2. Go Language

**Purpose**: A modern programming language required for many security tools.

**Installation**: Managed within the first script.

## 3. Subfinder

**Purpose: Enumerates subdomains of a given domain using passive online sources.

**Source**: Subfinder GitHub

## 4. Httpx

**Purpose: Probes and interacts with web services for identifying alive domains.

**Source**: Httpx GitHub

## 5. Gospider

**Purpose**: Crawls domains to extract URLs, endpoints, and other useful data.

**Source**: Gospider GitHub

## 6. Aquatone

**Purpose**: Takes screenshots of web services and domains.

**Source**: Aquatone GitHub

## Contributions

Feel free to fork this repository and submit pull requests for improvements or additional features.
