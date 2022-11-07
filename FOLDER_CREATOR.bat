@echo off

:start
mode con: cols=150 lines=50

cls
color 02
echo ******************************************************************************************************************************************************
echo.
echo *******************************************************       Welcome to Folder Creator       ********************************************************
echo.
echo ******************************************************************************************************************************************************
echo.
echo.
echo                            		   This script was created by greasy and is my first script i created.
echo                  		This script was created to help me make folders without the hassle of doing it one by one. 
echo                         		 If you have any suggestions to improve on this script please let me know
echo 							     @ https://github.com/xgreasyx
echo.
echo.
echo.
echo                            	               ---- Press Ctrl + C to Terminate Program at any time ----
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p continue="Press Y to continue or any other key and Enter to Terminate Program! :$
if /I "%continue%" NEQ "Y" goto end

:drive
cls
echo.
wmic logicaldisk get deviceid, volumename, description

color 02
set /p letter="Enter What Drive you wish to Use,[C,D,E,F]:$ "
echo.
echo.
echo You selected %LETTER%:

set /p isthiscorrect="Is this correct, Yes or No? (Y/N):$ "
if /I "%isthiscorrect%" EQU "Y" goto begin
if /I "%isthiscorrect%" EQU "N" goto drive
if /I "%isthiscorrect%" NEQ "Y" goto start
if /I "%isthiscorrect%" NEQ "N" goto start
 
:begin
cd\
cls
echo.
echo.
dir %letter%: /A

IF %ERRORLEVEL% NEQ 0 goto drive

echo.
echo.
echo  ---------------------------------------------------  Press Ctrl + C to Terminate Program at any time  ---------------------------------------------
echo.
set /p folder="Enter Main Directory Name:$ "
echo You Selected %LETTER%:\%folder%
echo.
echo.
set /p name="Enter name of Folder to create:$ "
echo You Selected %LETTER%:\%folder%\%name%
echo.
echo.
set /p subfolder="Enter name of SubFolder to create:$ "
echo You Selected %LETTER%:\%folder%\%name%\%subfolder%
echo.
echo.
set /p number="How many folders do you wish to create:$ "

cls
color 02
echo.
echo.
echo Your Folders are going to be created in %letter%:\%folder%\%name% with %number% subfolders called %subfolder%:
set /p correct="Is this correct? (Y/N):$ "
if /I "%correct%" NEQ "Y" goto begin

mkdir %letter%:\%folder%\%name%

for /L %%a in (1,1,%number%) do mkdir %letter%:\%folder%\%name%\%SubFolder%_%%a

cls
color 02
echo.
echo.
echo        ---------------------------------------- All FOLDERS HAVE BEEN CREATED IN %letter%:\%folder%\%name%  ----------------------------------------------
echo.
echo.
echo.
set /p again="Would you like to use Folder Creator again? Y/N:$ "
if /I "%again%" EQU "Y" goto start
if /I "%again%" NEQ "Y" goto end

:end
cls
echo.
echo.
echo ----------------------------------------------------  Thanks for using Folder Creator  ------------------------------------------------------------
echo -----------------------------------------------------------       Goodbye     ---------------------------------------------------------------------
echo.
pause
exit