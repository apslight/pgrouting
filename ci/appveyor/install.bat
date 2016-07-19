@echo off

set LOCAL_DEBUG=1

Setlocal EnableDelayedExpansion EnableExtensions

if defined LOCAL_DEBUG echo APPVEYOR_BUILD_FOLDER %APPVEYOR_BUILD_FOLDER%
echo platform %platform%

:: =========================================================
:: Set some defaults. Infer some variables.
::

if not defined MSVC_VER set MSVC_VER=12.0
if not defined RUNTIME set RUNTIME=msvc%MSVC_VER:.=%
if not defined MSVC_YEAR set MSVC_YEAR=2013
if not defined BUILD_ROOT_DIR set BUILD_ROOT_DIR=c:\build
if not defined DOWNLOADS_DIR set DOWNLOADS_DIR=%APPVEYOR_BUILD_FOLDER%\downloads
if not defined COMMON_INSTALL_DIR set COMMON_INSTALL_DIR=%BUILD_ROOT_DIR%\local\%RUNTIME%\%PLATFORM%

if not defined CMAKE_VERSION set CMAKE_VERSION=3.5.2
if not defined PG_VERSION set PG_VERSION=2.2.2
if not defined BOOST_VERSION set BOOST_VERSION=1.58.0
if not defined CGAL_VERSION set CGAL_VERSION=4.8.1


set CMAKE_GENERATOR=Visual Studio %MSVC_VER:.0=% %MSVC_YEAR%
if "%platform%"=="x64" (
    set CMAKE_GENERATOR=%CMAKE_GENERATOR% Win64
)

:: Determine if arch is 32/64 bits
if /I "%platform%"=="x86" ( set arch=32) else ( set arch=64)

::
:: =========================================================

:: create a download directory:
pushd %APPVEYOR_BUILD_FOLDER%
mkdir downloads 2>NUL
popd
mkdir %COMMON_INSTALL_DIR% 2>NUL
if defined LOCAL_DEBUG dir %DOWNLOADS_DIR%
if defined LOCAL_DEBUG dir %COMMON_INSTALL_DIR%


:: =========================================================
:: Download and install cmake
::

echo ==================================== CMAKE
for /f "tokens=*  delims=" %%a in ('cmake --version') do (
    set CURR_CMAKE=%%a& goto _ExitForLoop1
)
:_ExitForLoop1
set CURR_CMAKE=%CURR_CMAKE:~14%

if "%CURR_CMAKE%" == "%CMAKE_VERSION%" (
    echo cmake %CMAKE_VERSION% already installed
) else (
    echo Downoading cmake %CMAKE_VERSION%
    pushd %DOWNLOADS_DIR%
    curl -L -O -S -s https://cmake.org/files/v3.5/cmake-%CMAKE_VERSION%-win32-%platform%.msi
    popd

    echo Installing cmake %CMAKE_VERSION%
    pushd %DOWNLOADS_DIR%
    start /wait msiexec /i cmake-%CMAKE_VERSION%-win32-%platform%.msi /qn
    popd

    for /f "tokens=*  delims=" %%a in ('cmake --version') do (
        set CURR_CMAKE=%%a& goto _ExitForLoop2
    )
    :_ExitForLoop2
    set CURR_CMAKE=%CURR_CMAKE:~14%
    if "%CURR_CMAKE%" == "%CMAKE_VERSION%" (
        echo cmake %CMAKE_VERSION% installed
    ) else (
        echo something went wrong on cmake installation!!!!!!!!!
        Exit \B 1
    )
)
echo ====================================

::
:: =========================================================



:: =========================================================
:: Download and install Postgis
::

echo ==================================== POSTGIS
if not exist "C:\Progra~1\PostgreSQL\9.4\makepostgisdb_using_extensions.bat" (
    cd %APPVEYOR_BUILD_FOLDER%
    if not exist %DOWNLOADS_DIR%\postgis-pg94-binaries-%PG_VERSION%w%arch%gcc48.zip (
        echo Downoading postGIS %PG_VERSION%
        pushd %DOWNLOADS_DIR%
        curl -L -O -S -s http://winnie.postgis.net/download/windows/pg94/buildbot/postgis-pg94-binaries-%PG_VERSION%w%arch%gcc48.zip
        popd
        if not exist %DOWNLOADS_DIR%\postgis-pg94-binaries-%PG_VERSION%w%arch%gcc48.zip (
            echo something went wrong on postgis %PG_VERSION% download !!!!!!!!!
            if defined LOCAL_DEBUG dir %DOWNLOADS_DIR%
            Exit \B 1
        )
    )

    echo Extracting postGIS %PG_VERSION%
    pushd %DOWNLOADS_DIR%
    7z x -o%BUILD_ROOT_DIR%\ postgis-pg94-binaries-%PG_VERSION%w%arch%gcc48.zip
    popd

    echo **** Installing postGIS %PG_VERSION%
    xcopy /e /y /q %BUILD_ROOT_DIR%\postgis-pg94-binaries-%PG_VERSION%w%arch%gcc48 C:\Progra~1\PostgreSQL\9.4

    if not exist "C:\Progra~1\PostgreSQL\9.4\makepostgisdb_using_extensions.bat" (
        echo something went wrong on postGIS %PG_VERSION% installation !!!!!!!!!
        if defined LOCAL_DEBUG dir %DOWNLOADS_DIR%
        if defined LOCAL_DEBUG dir C:\Progra~1\PostgreSQL\9.4\
        Exit \B 1
    ) else (
        echo **** postGIS %PG_VERSION% %arch% installed
    )
) else (
    echo postGIS %PG_VERSION% %arch% already installed
)
echo ====================================

::
:: =========================================================



:: =========================================================
:: Download and install Boost
::

set "BOOST_LOCAL_DEBUG=1"
call ci/appveyor/install-boost.bat

if defined LOCAL_DEBUG (
    echo BOOST_VERSION %BOOST_VERSION%
    echo BOOST_VER_USC %BOOST_VER_USC%
    echo BOOST_SHORT_VER %BOOST_SHORT_VER%
    echo BOOST_INSTALL_DIR %BOOST_INSTALL_DIR%
    echo BOOST_INCLUDE_DIR %BOOST_INCLUDE_DIR%
    echo BOOST_LIBRARY_DIR %BOOST_LIBRARY_DIR%
    echo BOOST_THREAD_LIB %BOOST_THREAD_LIB%
    echo BOOST_SYSTEM_LIB %BOOST_SYSTEM_LIB%
    echo BOOST_ADDRESS_MODEL %BOOST_ADDRESS_MODEL%
    echo BOOST_TOOLSET %BOOST_TOOLSET%
    echo CMAKE_GENERATOR %CMAKE_GENERATOR%
)

::
:: CGAL & GMP & MPFR
::
::
call ci/appveyor/install-CGAL.bat


echo ======================================================
echo Installation of Prerequisites done.
echo Platform - %platform%
echo    cmake - %CMAKE_VERSION% 
echo    Boost - %BOOST_VERSION%
echo  postGIS - %PG_VERSION% %arch% 
echo     CGAL - %CGAL_VERSION% %arch% 
echo ======================================================
echo.

endlocal & set PATH=%PATH%& set BOOST_VER=%BOOST_VERSION%&

goto :eof
