@echo off
title git helper by egg
if exist "%cd%\.git\" goto :copy
goto :setup

:setup
cls
echo it appears you have not set up a GitHub repository with this folder.
echo would you like to set one up now?
echo --------------------------------------------------------------------
echo yes                                                               no
set /P option=
if /I "%option%" EQU "Y" goto :setupinit
if /I "%option%" EQU "Yes" goto :setupinit
if /I "%option%" EQU "No" goto :setupdecl
if /I "%option%" EQU "N" goto :setupdecl
if /I "%option%" EQU "Force" goto :copyf
if /I "%option%" EQU "F" goto :copyf
cls
echo not an option...
echo ---------------------------
echo press any key to go back...
pause > nul
goto :setup

:setupdecl
cls
echo okay.
echo closing in 3s
timeout 3 /NOBREAK > nul
exit

:setupinit
cls
git init
git add .
git branch
git checkout -b main
git commit -m "Added Files."
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo paste your github repository link here.
echo DO NOT ADD ".git" TO THE END!
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set /P ghrlink=
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
git remote add origin %ghrlink%.git
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
git remote -v
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo press any key to ensure this is correct...
pause > nul
git push -f origin main
cls
echo GitHub repository linked to folder.
echo Files uploaded.
echo -----------------------------------
echo Press any key to quit...
pause > nul
exit

:copyf
cls
echo skipping...
timeout 1 /NOBREAK > nul
goto :copy

:copy
cls
echo have you copied all files to this directory? "%cd%"
echo ---------------------------------------------------
pause
cls
echo what did you do for this update?
echo ---------------------------------------------------
set /P updatereason=
cls
echo okay then, hold onto your hats!
timeout 2 /NOBREAK > nul
cls
git add .
git commit -m "%updatereason%"
git push -u origin main
echo --------------------------------------------------------------------------------------
echo finished.
echo press any key to exit...
pause > nul
exit




rem manual steps for adding a repo to a folder




rem 1. Create a new repository on GitHub:
rem    - Go to GitHub.com and log in
rem    - Click the '+' icon in the top right and select "New repository"
rem    - Name your repository (e.g., "your-project-name")
rem    - Choose public or private
rem    - Don't initialize with README, .gitignore, or license
rem    - Click "Create repository"

rem 2. Prepare your local project:
rem    - Open a terminal/command prompt
rem    - Navigate to your project folder:
rem      ```
rem      cd path/to/your/project
rem      ```

rem 3. Initialize a Git repository locally:
rem    ```
rem    git init
rem    ```
rem 
rem 4. Add your files to Git:
rem    ```
rem    git add .
rem    ```

rem 4.5. Now, you need to pee pee poo poo. Run these commands:
rem    ```
rem    git branch
rem    git checkout -b main
rem    ```

rem 5. Commit your files:
rem    ```
rem    git commit -m "Initial commit"
rem    ```

rem 6. Link your local repository to the GitHub repository:
rem    ```
rem    git remote add origin https://github.com/your-username/your-project-name.git
rem    ```

rem 6.5. Double check you're in the correct GitHub repository. Run this command:
rem    ```
rem    git remote -v
rem    ```

rem 7. Push your files to GitHub:
rem    ```
rem    git push -f origin main
rem    ```

rem 8. the end:
