@echo off
echo.
echo Run build clean...
echo.

pushd ..\..\..\..\
if not defined WORKSPACE set WORKSPACE=%CD%
if not defined EDK_TOOLS_PATH set EDK_TOOLS_PATH=%WORKSPACE%\edk2\BaseTools
if not defined EDK_TOOLS_BIN set EDK_TOOLS_BIN=%WORKSPACE%\edk2\BaseTools\Bin\Win32 
if not defined PACKAGES_PATH set PACKAGES_PATH=%WORKSPACE%;%WORKSPACE%\edk2;%WORKSPACE%\testcase

echo.
echo Directories to clean... 
echo.
if exist %WORKSPACE%\Build rmdir /q /s %WORKSPACE%\Build
if exist %WORKSPACE%\Conf\ rmdir /q /s %WORKSPACE%\Conf\
popd

echo.
echo All done
echo.
@echo on
