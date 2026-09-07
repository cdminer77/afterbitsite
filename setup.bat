@echo off
:: Setup e Avvio Automatico del Progetto React + Vite
:: Questo script controlla la presenza di Node.js, installa le dipendenze e avvia il sito.

chcp 65001 > nul
title Configurazione Sito Web React + Vite

echo =================================================================
echo        STRUMENTO DI CONFIGURAZIONE E AVVIO AUTOMATICO
echo =================================================================
echo.

:: Controlla se Node.js è già installato nel PATH
where node >nul 2>nul
if %errorlevel% equ 0 (
    echo [OK] Node.js è già installato nel sistema.
    goto check_npm
)

:: Se Node.js non è nel PATH, prova a cercarlo nella cartella standard
if exist "C:\Program Files\nodejs\node.exe" (
    echo [INFO] Node.js trovato in C:\Program Files\nodejs. Aggiungo al PATH temporaneo.
    set "PATH=C:\Program Files\nodejs;%PATH%"
    goto check_npm
)

echo [ATTENZIONE] Node.js non è installato o non è stato trovato nel PATH.
echo Provo a installare Node.js (LTS) automaticamente tramite winget...
echo.

:: Verifica se winget è disponibile
where winget >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERRORE] Windows Package Manager (winget) non è disponibile su questo PC.
    echo Per favore, installa Node.js manualmente da: https://nodejs.org/
    pause
    exit /b
)

:: Installazione di Node.js LTS tramite winget
echo Installazione di Node.js (LTS) in corso, attendere...
winget install --id OpenJS.NodeJS.LTS --silent --accept-package-agreements --accept-source-agreements
if %errorlevel% neq 0 (
    echo.
    echo [ERRORE] L'installazione automatica è fallita.
    echo Esegui questo script come Amministratore o installa Node.js da: https://nodejs.org/
    pause
    exit /b
)

echo.
echo [OK] Node.js installato correttamente!
echo [IMPORTANTE] È necessario riavviare questo script (o il terminale) per applicare le modifiche del PATH.
echo Premi un tasto per chiudere e poi riapri questo file setup.bat.
pause
exit

:check_npm
echo.
echo [INFO] Installazione delle dipendenze di progetto (npm install)...
echo Questo potrebbe richiedere alcuni secondi al primo avvio.
echo.
call npm install

if %errorlevel% neq 0 (
    echo [ERRORE] C'è stato un problema durante l'installazione delle dipendenze.
    pause
    exit /b
)

echo.
echo [OK] Dipendenze installate con successo!
echo.
echo Scegli cosa vuoi fare ora:
echo [1] Avviare il Server di Sviluppo (Live reload per modifiche)
echo [2] Compilare e visualizzare l'anteprima di Produzione
echo [3] Esci
echo.

set /p scelta="Inserisci il numero corrispondente (1, 2 o 3): "

if "%scelta%"=="1" (
    echo.
    echo Avvio del server di sviluppo in corso...
    echo Apri l'indirizzo mostrato a schermo (solitamente http://localhost:5173) nel tuo browser.
    echo.
    call npm run dev
) else if "%scelta%"=="2" (
    echo.
    echo Compilazione in corso...
    call npm run build
    echo.
    echo Avvio anteprima di produzione...
    call npm run preview
) else (
    echo Chiusura dello script. Puoi riavviarlo in qualsiasi momento per far ripartire il sito.
    exit /b
)

pause
