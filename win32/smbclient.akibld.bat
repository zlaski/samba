@echo off
setlocal EnableExtensions EnableDelayedExpansion
set "RunMode=%~1"

if [%RunMode%] == [PostBuildEvent] (

	REM set O=%OutDir%
	REM set N=%OutDir%\%TargetFileName%

	REM rem msgbox "O=!O! N=!N!"

	REM call :run copy /y "!N!" "!O!\gcloud-login.exe"
	REM call :run copy /y "!N!" "!O!\gcloud-start-instance.exe"
	REM call :run copy /y "!N!" "!O!\gcloud-stop-instance.exe"
	REM call :run copy /y "!N!" "!O!\gcloud-run.exe"

	REM call :run del /f "!N!"

)

exit /b 0

:: msgbox ERRORLEVEL %ERRORLEVEL%

:run
    %* >nul
    if errorlevel 1 (
        echo Failed: %*
        exit 2
    )
    exit /b 0
