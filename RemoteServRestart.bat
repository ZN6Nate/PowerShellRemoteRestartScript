@echo off
Color 0A
rem -----------------------------
rem ONE-CLICK RESTART (PsExec)
rem -----------------------------
rem Edit these if you want to add more servers (space-separated)
set TARGETS= #****ENTER SERVER NAME HERE****#

rem Local account on the remote host (use HOSTNAME\username for local account)
set USER=#****ENTER USER ACCOUNT HERE****#
set PASS=#***ENTER USER PASSWORD HERE****#

rem Path to PsExec.exe - update if installed elsewhere
set PSEXEC="C:\PSTools\PsExec.exe"

echo ===============================================
echo ===     Sending restart to target servers    ===
echo ===============================================

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

echo.
echo Done.
timeout /t 8 /nobreak >nul
exit /b
