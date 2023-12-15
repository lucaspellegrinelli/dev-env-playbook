@echo off
cd "C:\Users\lucas\Desktop\Dev Env"

set isRunning=false

FOR /F "tokens=*" %%i IN ('vagrant status --machine-readable') DO (
    echo %%i | findstr /C:"default,state,running" > nul
    IF NOT ERRORLEVEL 1 (
        set isRunning=true
    )
)

IF "%isRunning%"=="true" (
    start wt -d "C:\Users\lucas\Desktop\Dev Env" vagrant ssh
) ELSE (
    start wt -d "C:\Users\lucas\Desktop\Dev Env" cmd /c "vagrant up && vagrant ssh"
)
