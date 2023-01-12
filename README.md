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

<h2>Steps to run the script</h2>
<ol>
  <li>Clone or download the script on your local machine.</li>
  <li>Give execution permission to the script using the command: <strong style="color: green">chmod +x nmap_auto_full.sh</strong>.</li>
  <li>Run the script using the command: <strong style="color: green">sudo ./nmap_auto_full.sh or ./nmap_auto_full.sh</strong>.</li>
  <li>Follow the prompts and provide the required information, such as the target IP or file path, whether to run all commands at once, and whether to generate separate reports.</li>
</ol>
  
<h2>Usage</h2>
<h3>Step 1</h3>
<p>To use the script, simply navigate to the directory where the script is located in the command line and type: 
</p>
<pre><code>sudo ./nmap_auto_full.sh or ./nmap_auto_full.sh</code></pre>
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

<h2>Commands</h2>
<ul>
  <li><strong style="color: green">nmap -Pn -n -sS -A -T4 &lt;target&gt;</strong> - Performs a stealth SYN scan with OS and version detection and aggressive timing.</li>
  <li><strong style="color: green">nmap -Pn -n -sCV -A &lt;target&gt;</strong> - Performs a version detection scan with OS detection.</li>
  <li><strong style="color: green">nmap -Pn -n -p- -T4 &lt;target&gt;</strong> - Performs a full port scan with aggressive timing.</li>
  <li><strong style="color: green">nmap --script smb-os-discovery.nse --script-args=unsafe=1 -p 445 &lt;target> -Pn -n</strong> - Perform smb os discovery scan.</li>
  <li><strong style="color: green">nmap -sF -p1-100 -T4 &lt;target&gt;</strong> - Perform Exotic scan flags.</li>
  <li><strong style="color: green">nmap -sS -v -v -Pn -g 88 &lt;target&gt;</strong> - Perform source port manipulation scan.</li>
   <li><strong style="color: green">nmap --script=ipidseq --script-args=ipid.zero=1 -v -v -Pn &lt;target&gt;</strong> - Perform IP ID idle scanning.</li>
  <li><strong style="color: green">nmap --send-ip -v -v -Pn &lt;target&gt;</strong> - Perform multiple ping probes.</li>
   <li><strong style="color: green">nmap -f &lt;target&gt;</strong> - Perform fragmentation scan.</li>
  <li><strong style="color: green">nmap --source-port 88 &lt;target&gt;</strong> - Perform source routing scan.</li>
  <li><strong style="color: green">nmap -b &lt;target&gt;</strong> - Perform FTP bounce scan.</li>
  <li><strong style="color: green">nmap --script=vuln -sV -O --script-args=unsafe=1 &lt;target&gt;</strong> - Perform vuln - os smb and aggressive all these scripts.</li>
  <li><strong style="color: green">nmap --script=firewall-bypass --script-args=unsafe=1 &lt;target&gt;</strong> - Perform firewall bypass scan.</li>
</ul>

<h2>Notes</h2>
<p>This script makes use of the <a href="https://nmap.org/">Nmap</a> tool and <a href="http://www.gnu.org/software/enscript/">Enscript</a> for creating reports in text format. The script will check for the dependencies and will install them if they are not found.</p>
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

<h2>Error Remediation</h2>
<p>If you get an error message saying that the command 'ps2pdf' is not found, it likely means that Ghostscript is not installed on your computer or is not in your system's PATH. You can check if Ghostscript is installed by running the command 'gs' in your command prompt or terminal.<p>

<p>You can install Ghostscript on Windows, Mac, and Linux. On Windows you can download it from the official website, on Ubuntu/Debian you can use apt-get<p>
<pre><code>sudo apt-get install ghostscript</pre></code>

<p>On MacOS use brew</p>
<pre><code>brew install ghostscript</pre></code>

<p>Once you have Ghostscript installed, you should be able to use the 'ps2pdf' command.</p>
