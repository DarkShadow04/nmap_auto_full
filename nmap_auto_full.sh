#!/bin/bash

# Define text color for banner
color=("\033[1;31m" "\033[1;32m" "\033[1;33m" "\033[1;34m" "\033[1;35m" "\033[1;36m" "\033[1;37m")
random_color=${color[$RANDOM % ${#color[@]}]}
reset='\033[0m'

# Print banner
echo -e "$random_color"
echo -e "_

███╗   ██╗███╗   ███╗ █████╗ ██████╗          █████╗ ██╗   ██╗████████╗ ██████╗         ███████╗██╗   ██╗██╗     ██╗     
████╗  ██║████╗ ████║██╔══██╗██╔══██╗        ██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗        ██╔════╝██║   ██║██║     ██║     
██╔██╗ ██║██╔████╔██║███████║██████╔╝        ███████║██║   ██║   ██║   ██║   ██║        █████╗  ██║   ██║██║     ██║     
██║╚██╗██║██║╚██╔╝██║██╔══██║██╔═══╝         ██╔══██║██║   ██║   ██║   ██║   ██║        ██╔══╝  ██║   ██║██║     ██║     
██║ ╚████║██║ ╚═╝ ██║██║  ██║██║     ███████╗██║  ██║╚██████╔╝   ██║   ╚██████╔╝███████╗██║     ╚██████╔╝███████╗███████╗
╚═╝  ╚═══╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝ ╚══════╝╚═╝      ╚═════╝ ╚══════╝╚══════╝
                                                                                                                         
_"

echo -e "${random_color} nmap_auto_full script by: Dark_Shadow04 ${reset}\n"
echo -e "${random_color} https://github.com/DarkShadow04  ${reset}\n"
echo -e "${random_color} Copyright 2023 Dark_Shadow04 ${reset}\n"


# Check for dependencies
dependencies=("nmap" "enscript")

for dependency in "${dependencies[@]}"
do
    if ! [ -x "$(command -v $dependency)" ]; then
        echo -e "\e[1;31mError: $dependency is not installed.\e[0m"
        if [ "$(uname)" == "Linux" ]; then
            echo -e "\e[1;34mInstalling $dependency...\e[0m"
            sudo apt-get install -y $dependency
        elif [ "$(uname)" == "Darwin" ]; then
            echo -e "\e[1;34mInstalling $dependency...\e[0m"
            brew install $dependency
        else
            echo -e "\e[1;31mError: Unsupported operating system. Please install $dependency manually.\e[0m"
            exit 1
        fi
    fi
done

# Get target
echo -e "\e[1;34mEnter target IP or path of target file:\e[0m"
read target

# Ask if user wants to run all commands at once
echo -e "\e[1;34mRun all commands at once? (yes/no)\e[0m"
read run_all

# Ask if user wants separate reports for each command
echo -e "\e[1;34mDo you want separate report for each command output? (yes/no)\e[0m"
read separate_reports

# Create report directories
mkdir -p separate_reports full_reports

# Set an array of commands
commands=(
    "nmap -Pn -n -sS -A -T4 $target"
    "nmap -Pn -n -sCV -A $target"
    "nmap -Pn -n -p- -T4 $target"
    "nmap --script smb-os-discovery.nse --script-args=unsafe=1 -p 445 $target -Pn -n"
    "nmap -sF -p1-100 -T4 $target"
    "nmap -sS -v -v -Pn -g 88 $target"
    "nmap --script=ipidseq --script-args=ipid.zero=1 -v -v -Pn $target"
    "nmap --send-ip -v -v -Pn $target"
    "nmap -f $target"
    "nmap --source-port 88 $target"
    "nmap -b $target"
    "nmap --script=vuln -sV -O --script-args=unsafe=1 $target"
    "nmap --script=firewall-bypass --script-args=unsafe=1 $target"
)

# Iterate through commands
for command in "${commands[@]}"
do
    if [ "$run_all" = "no" ]; then
        # Ask user if they want to run command
        echo -e "\e[1;34mRun command '$command'? (yes/no)\e[0m"
        read run
    else
        run="yes"
    fi
    
    if [ "$run" = "yes" ]; then
        # Run command and output to file
        echo -e "\e[1;34mRunning command '$command'...\e[0m"
        output=$(eval $command 2>&1)
        if [ "$separate_reports" = "yes" ];
then
            # Create separate report for command
            echo -e "\e[1;34mCreating separate report for command '$command'...\e[0m"
            command_name=$(echo "$command" | tr ' ' '_')
            report_file="separate_reports/$command_name.txt"
            echo "$output" > $report_file
            enscript -q -fCourier8 -o - $report_file | ps2pdf - $report_file.pdf
        else
            # Add output to full report
            echo -e "\e[1;34mAdding output to full report...\e[0m"
            echo "$output" >> full_reports/full_report.txt
        fi
    else
        echo -e "\e[1;34mSkipping command '$command'...\e[0m"
    fi
done

# Create full report
if [ "$separate_reports" = "no" ]; then
    echo -e "\e[1;34mCreating full report...\e[0m"
    enscript -q -fCourier8 -o - full_reports/full_report.txt | ps2pdf - full_reports/full_report.pdf
fi

# Complete
echo -e "\e[1;34mScan complete. Reports saved in separate_reports/ and full_reports/ directories\e[0m"


echo "Script executed successfully with blessing of Dark_Shadow04."
