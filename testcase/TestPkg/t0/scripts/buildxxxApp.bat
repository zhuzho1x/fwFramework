set CHECKOUT_DIR=%CD%

cd ..\..\..\..\
set WORKSPACE=%CD%
set ROOT_DIR=%CD%
set EDKREPO=%ROOT_DIR%\edk2
set EDK_TOOLS_PATH=%EDKREPO%\BaseTools
set EDK_TOOLS_BIN=%EDKREPO%\BaseTools\Bin\Win32
set PACKAGES_PATH=%WORKSPACE%;%EDKREPO%;%WORKSPACE%\testcase
call %EDKREPO%\edksetup.bat Rebuild VS2019

cd %CHECKOUT_DIR%

call build -a X64 -b DEBUG -t VS2019 -p testcase/TestPkg/t0/TestApp.dsc
@REM call build -p OvmfPkg/OvmfPkgX64.dsc -a X64 -D DEBUG_ON_SERIAL_PORT