<h1>🧑‍💻 One-Click Remote Server Restart Script Using Batch Scripting</h1>

<img width="600" height="400" alt="Image" src="https://github.com/user-attachments/assets/cfd224e8-be20-4cd6-827c-fdc8655eabdd" />

<h2>🏌️Description</h2>
<b>Simple Batch Script to aid Non-technical production staff to remotely restart a server when IT is not available to remotely restart a server to keep production flowing when a server/service needs to be reset.</b>
<h2>Languages & Tools needed</h2>
☝️ <b>Windows System</b><br>
☝️ <b>PSToolsSuite</b>
☝️ <b>Create a Desktop Shortcut for the User to run</b>
☝️ <b>Administrative Account for Station the script is hosted on/and server</b>

<h2>👨‍🔬 Program Walk-Through</h2>

```powershell
rem -----------------------------
rem ONE-CLICK RESTART (PsExec)
rem -----------------------------
set TARGETS= #****ENTER SERVER NAME HERE****#
```
• <b>☝️ Edit the Script File and Enter the Server Name of the Server/Station you would like to Restart</b><br>

```batch
rem Local account on the remote host (use HOSTNAME\username for local account)
set USER=#****ENTER USER ACCOUNT HERE****#
set PASS=#***ENTER USER PASSWORD HERE****#
```
• <b>☝️ Edit/Enter the Credentials to the Admin Account on that system that has Administrative Capabilities</b><br>

```batch
rem Path to PsExec.exe - update if installed elsewhere
set PSEXEC="C:\PSTools\PsExec.exe"
```

• <b>☝️ This tells the script where to find the program (PsExec)</b><br>

```batch
echo ===============================================
echo ===     Sending restart to target servers    ===
echo ===============================================
```

• <b>☝️ Prints a big message on the screen so you know the script is starting to send restart commands, just for clarification</b><br>

```batch
for %%S in (%TARGETS%) do (
    echo.
    echo ---> Restarting %%S ...
    %PSEXEC% \\%%S -accepteula -u "%USER%" -p "%PASS%" -i -d cmd /c "shutdown /r /f /t 10"
    if errorlevel 1 (
        echo [ERROR] PsExec returned a non-zero code for %%S
    ) else (
        echo [OK] Restart command sent to %%S
    )
)
```

<b> ☝️ For each computer name you put in the list, do these steps:

• Show a small blank line and say “Restarting [computer name]…” on the screen.

• Use PsExec to connect to that computer and tell it to restart in 10 seconds.

• If PsExec has a problem, print an error message. If it worked, say “OK — command sent.” </b><br>

```batch
echo.
echo Done.
timeout /t 8 /nobreak >nul
exit /b
```
• <b>☝️ After trying all computers, print “Done.” and wait 8 seconds so you can read the messages, then close the script</b><br>


