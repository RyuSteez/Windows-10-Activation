@echo off

REM Check if Windows is already activated
slmgr.vbs /dlv | find "Activation Status: Activated" > nul
if %errorlevel% == 0 (
    echo Windows is already activated.
    echo Exiting script.
    pause
    exit /b
)

:ACTIVATION_LOOP
echo Choose the edition and paste into CMD (run as administrator):
echo.
echo 1. Home
echo 2. Home N
echo 3. Home Single Language
echo 4. Home Country Specific
echo 5. Professional
echo 6. Professional N
echo 7. Education
echo 8. Education N
echo 9. Enterprise
echo 10. Enterprise N
echo.
echo 0. Exit
echo.

REM Wait for user to take action
choice /C 0123456789 /N /M "Enter your choice (0-10): " /T 30 /D 0

REM If user selects 0, exit the script
if errorlevel 11 (
    echo Exiting script.
    pause
    exit /b
)

REM If user selects 1-9, activate the corresponding edition
if errorlevel 1 (
    slmgr /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
) else if errorlevel 2 (
    slmgr /ipk 3KHY7-WNT83-DGQKR-F7HPR-844BM
) else if errorlevel 3 (
    slmgr /ipk 7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH
) else if errorlevel 4 (
    slmgr /ipk PVMJN-6DFY6-9CCP6-7BKTT-D3WVR
) else if errorlevel 5 (
    slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
) else if errorlevel 6 (
    slmgr /ipk MH37W-N47XK-V7XM9-C7227-GCQG9
) else if errorlevel 7 (
    slmgr /ipk NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
) else if errorlevel 8 (
    slmgr /ipk 2WH4N-8QGBV-H22JP-CT43Q-MDWWJ
) else if errorlevel 9 (
    slmgr /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43
) else if errorlevel 10 (
    slmgr /ipk DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4
)

REM Verify activation
echo Verifying activation...
slmgr.vbs /dlv | find "Activation Status: Activated" > nul
if %errorlevel% == 0 (
    echo Windows activated successfully!
    echo Exiting script.
    pause
    exit /b
) else (
    echo Activation failed. Please try another option.
    goto :ACTIVATION_LOOP
)
