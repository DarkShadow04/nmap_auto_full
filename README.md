<h1>Nmap Automation Script</h1>

<h2>Introduction</h2>

<p>This script automates various Nmap commands and generates a report of the scan results.</p>

<h2>Dependencies</h2>
<p>This script requires the following dependencies to be installed on the system:</p>
<ul>
  <li>nmap</li>
  <li>enscript</li>
</ul>
<p>The script will automatically check for and install these dependencies if they are missing. However, it assumes that it is running on the correct OS environment and has access to the internet.

<h2>Usage</h2>
<h3>Step 1</h3>
<p>To use the script, simply navigate to the directory where the script is located in the command line and type: 
</p>
<pre><code>sudo ./script_name.sh or ./script_name.sh</code></pre>
<h3>Step 2</h3>
<p>The script will prompt you for the following information:</p>
<ul>
  <li>Target IP or path of target file: This is the IP address or file containing a list of IP addresses that you want to scan.</li>
  <li>Run all commands at once? (yes/no): If you select "yes", the script will run all commands without prompting you for confirmation. If you select "no", the script will prompt you for confirmation before running each command.</li>
  <li>Do you want separate report for each command output? (yes/no): If you select "yes", the script will create a separate report for each command in the "separate_reports" folder. If you select "no", the script will create a single report containing the output of all commands in the "full_reports" folder.</li>
</ul>
<h3>Step 3</h3>
<p> Once you've provided all the information and script completes the scan, it will generate a text file report of the scan results.</p>
<h3>Step 4</h3>
<p> You can access the report files in the "separate_reports" and "full_reports" folder </p>

<h2>Notes</h2>

<p>Here are some things to keep in mind when using this script:</p>

<ul>
  <li>This script is not intended to be used for illegal or malicious purposes.</li>
  <li>The script will run all the commands in an unprivileged mode, which means it will not have the ability to scan privileged ports like port number 1-1024. If you would like to scan those ports, you will need to run the script as a superuser.</li>
  <li>The script is designed to be used on a Linux or macOS system. It may not work as expected on other operating systems.</li>
  <li>Make sure to check the licenses of the Nmap Scripting Engine scripts that you use with this script and comply with them.</li>
  <li>The script is not a substitute for manual analysis of scan results. It is always a good idea to review the scan results manually to ensure that they are accurate and to look for any false positives.</li>
</ul>

<h2>Disclaimer</h2>
<p>It's your responsibility to use this script legally and ethically. I will not be held responsible for any illegal or malicious use of this script.</p>

