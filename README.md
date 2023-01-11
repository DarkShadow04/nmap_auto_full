<!DOCTYPE html>
<html>
<head>
</head>
<body>
  <h1>Nmap Automation Script</h1>
  <p>This script automates the process of running multiple nmap commands and generates a report in PDF format.</p>
  <h2>Features:</h2>
  <ul>
    <li>Checks for and installs dependencies (nmap and enscript)</li>
    <li>Prompts user for target IP or path of target file</li>
    <li>Prompts user to run all commands at once or individually</li>
    <li>Prompts user for separate report for each command output or a single report for all commands</li>
    <li>Includes exotic scan flags and techniques</li>
  </ul>
  <h2>Usage:</h2>
  <ol>
    <li>
        <p>Make sure you have permission to run the script, if not use the command <code> chmod +x nmap-script.sh </code> in the terminal to grant the execute permission to the script. </p>
    </li>
    <li>
        <p>Run the script <code>./nmap-script.sh</code>  in the terminal and the script will prompt you to enter the target IP or path of target file.</p>
    </li>
    <li>
        <p>The script will prompt you if you want to run all commands at once or individually. If you choose to run them individually, you will be prompted for each command before it runs.</p>
    </li>
    <li>
        <p>The script will also prompt you if you want a separate report for each command output or a single report for all commands.</p>
    </li>
    <li>
        <p>The script will then run all the specified commands and output the results to text files.</p>
    </li>
    <li>
        <p>Finally, the script will generate a PDF report of the nmap scan outputs and save it as "nmap-report.pdf" in the current directory.</p>
    </li>
  </ol>
  <h2>Note:</h2>
  <p>The script uses enscript command, so please make sure that you have latest version of enscript installed in your system and also have enough disk space and memory to generate the pdf report. Also, please ensure that you have the necessary permissions to run the script and access the target IP or file path.</p>
</body>
</html>
