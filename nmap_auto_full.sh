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

echo -e "${random_color} system_info script by: Dark_Shadow04 ${reset}\n"
echo -e "${random_color} https://github.com/DarkShadow04  ${reset}\n"
echo -e "${random_color} Copyright 2022 Dark_Shadow04 ${reset}\n"


# Check for and install dependencies

dependencies=( "nmap" "enscript" )

for dependency in "${dependencies[@]}"

do

    if ! command -v "$dependency" > /dev/null 2>&1; then

        echo -e "\e[1;34mInstalling $dependency...\e[0m"

        # Here you can use the package manager of your system.

        # Example: for Ubuntu, use "apt-get install -y $dependency"

        sudo apt-get install -y $dependency

    fi

done



# Get target IP or path of target file

echo -e "\e[1;34mEnter target IP or path of target file:\e[0m"

read target

# Ask if user wants to run all commands at once

echo -e "\e[1;34mRun all commands at once? (yes/no)\e[0m"

read run_all

# Ask if user wants separate report for each command output

echo -e "\e[1;34mDo you want separate report for each command output? (yes/no)\e[0m"

read separate_reports

# Loop through all nmap commands

commands=(

    "sudo nmap -Pn -n -sS -A -T4 $target"

    "nmap -Pn -n -sCV -A $target"

    "nmap -Pn -n -p- -T4 $target"

    "nmap --script smb-os-discovery.nse --script-args=unsafe=1 -p 445 $target -Pn -n"

    "nmap --script firewall-bypass.nse -p- -T4 $target"

    "nmap --script vuln -sV -O $target"

    "nmap --script smb-vuln-ms17-010.nse -p 445 -Pn -n $target"

    "nmap --script=vuln -A $target"

    "nmap --script=auth -A $target"

    "nmap --script=vuln, auth -A $target"

    "nmap -sF -p1-100 -T4 $target"

    "nmap -sS -v -v -Pn $target"

    "nmap -sS -v -v -Pn -g 88 $target"

    "nmap -6 $target"

    "nmap --script=ipidseq --script-args=ipid.zero=1 -v -v -Pn $target"

    "nmap --send-ip -v -v -Pn $target"

    "nmap --spoof-mac 00-00-5E-F0-00-01 $target"

    "nmap -f $target"

    "nmap --source-port 88 $target"

    "nmap -b $target"

)

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

        output=$(eval $command)

        if [ "$separate_reports" = "yes" ]; then

            echo "$output" > "$command.txt"

        fi

    fi

done

if [ "$separate_reports" = "no" ]; then

    echo "$output" > "nmap-report.txt"

fi



# Create PDF report

echo -e "\e[1;34mCreating PDF report...\e[0m"

enscript --output="nmap-report.pdf" --color -E"$separate_reports"

