@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "PROJECT_DIR=%~dp0"
call :find_jdk20
call :find_tomcat

if not exist "%JAVA_HOME%\bin\javac.exe" (
    echo [ERROR] JAVA_HOME path is not valid: %JAVA_HOME%
    echo Install JDK 20 or set JAVA_HOME to a JDK 20 folder.
    exit /b 1
)

for /f "tokens=2 delims= " %%V in ('"%JAVA_HOME%\bin\javac.exe" -version 2^>^&1') do set "JAVAC_VERSION=%%V"
if not "%JAVAC_VERSION:~0,3%"=="20." (
    echo [ERROR] JDK 20 is required. Current javac version: %JAVAC_VERSION%
    echo Set JAVA_HOME to a JDK 20 folder.
    exit /b 1
)
set "JRE_HOME=%JAVA_HOME%"

if not exist "%CATALINA_HOME%\bin\catalina.bat" (
    echo [ERROR] CATALINA_HOME path is not valid: %CATALINA_HOME%
    echo Install Apache Tomcat 9 or set CATALINA_HOME before running run.bat.
    exit /b 1
)
call :prepare_tomcat_base

echo [1/3] Compiling Java classes...
if not exist "%PROJECT_DIR%src\main\webapp\WEB-INF\classes" mkdir "%PROJECT_DIR%src\main\webapp\WEB-INF\classes"
"%JAVA_HOME%\bin\javac.exe" -encoding UTF-8 -cp "%PROJECT_DIR%src\main\webapp\WEB-INF\lib\*" -d "%PROJECT_DIR%src\main\webapp\WEB-INF\classes" ^
    "%PROJECT_DIR%src\main\java\util\ConnectionPool.java" ^
    "%PROJECT_DIR%src\main\java\util\FileUtil.java" ^
    "%PROJECT_DIR%src\main\java\util\ProfileUtil.java" ^
    "%PROJECT_DIR%src\main\java\dao\FeedObj.java" ^
    "%PROJECT_DIR%src\main\java\dao\FeedDAO.java" ^
    "%PROJECT_DIR%src\main\java\dao\FollowDAO.java" ^
    "%PROJECT_DIR%src\main\java\dao\LikeDAO.java" ^
    "%PROJECT_DIR%src\main\java\dao\ReplyObj.java" ^
    "%PROJECT_DIR%src\main\java\dao\ReplyDAO.java" ^
    "%PROJECT_DIR%src\main\java\dao\UserObj.java" ^
    "%PROJECT_DIR%src\main\java\dao\UserDAO.java"

if errorlevel 1 (
    echo [ERROR] Java compile failed.
    exit /b 1
)

echo [2/3] Deploying webapp...
xcopy "%PROJECT_DIR%src\main\webapp\*" "%CATALINA_BASE%\webapps\PBL_JSP\" /E /I /Y >nul
if errorlevel 1 (
    echo [ERROR] Webapp deploy failed.
    exit /b 1
)
if exist "%PROJECT_DIR%src\main\image\profile" (
    xcopy "%PROJECT_DIR%src\main\image\profile\*" "%CATALINA_BASE%\webapps\PBL_JSP\images\" /E /I /Y >nul
)

echo [3/3] Starting Tomcat...
echo Open: http://localhost:[Tomcat HTTP port]/PBL_JSP/index.jsp
"%CATALINA_HOME%\bin\catalina.bat" run

endlocal
exit /b %errorlevel%

:prepare_tomcat_base
set "CATALINA_BASE=%PROJECT_DIR%.tomcat_base"
if not exist "%CATALINA_BASE%" mkdir "%CATALINA_BASE%"
if not exist "%CATALINA_BASE%\conf" xcopy "%CATALINA_HOME%\conf" "%CATALINA_BASE%\conf\" /E /I /Y >nul
if not exist "%CATALINA_BASE%\logs" mkdir "%CATALINA_BASE%\logs"
if not exist "%CATALINA_BASE%\temp" mkdir "%CATALINA_BASE%\temp"
if not exist "%CATALINA_BASE%\work" mkdir "%CATALINA_BASE%\work"
if not exist "%CATALINA_BASE%\webapps" mkdir "%CATALINA_BASE%\webapps"
exit /b 0

:find_jdk20
if defined JAVA_HOME if exist "%JAVA_HOME%\bin\javac.exe" (
    for /f "tokens=2 delims= " %%V in ('"%JAVA_HOME%\bin\javac.exe" -version 2^>^&1') do (
        set "FOUND_JAVAC_VERSION=%%V"
    )
    if "!FOUND_JAVAC_VERSION:~0,3!"=="20." exit /b 0
)

for /d %%J in ("C:\Program Files\Java\jdk-20*" "C:\Program Files\Eclipse Adoptium\jdk-20*" "C:\Program Files\Microsoft\jdk-20*" "C:\Program Files\Zulu\zulu-20*") do (
    if exist "%%~fJ\bin\javac.exe" (
        set "JAVA_HOME=%%~fJ"
        exit /b 0
    )
)

for /d %%J in ("%USERPROFILE%\jdk-20*" "%USERPROFILE%\Downloads\jdk-20*") do (
    if exist "%%~fJ\bin\javac.exe" (
        set "JAVA_HOME=%%~fJ"
        exit /b 0
    )
)
exit /b 1

:find_tomcat
if defined CATALINA_HOME if exist "%CATALINA_HOME%\bin\catalina.bat" exit /b 0

for /d %%T in ("C:\Program Files\Apache Software Foundation\Tomcat 9*" "C:\apache-tomcat-9*" "%PROJECT_DIR%apache-tomcat-9*" "%PROJECT_DIR%tomcat-9*" "%USERPROFILE%\apache-tomcat-9*" "%USERPROFILE%\Downloads\apache-tomcat-9*") do (
    if exist "%%~fT\bin\catalina.bat" (
        set "CATALINA_HOME=%%~fT"
        exit /b 0
    )
)

for /d %%P in ("%USERPROFILE%\Downloads\apache-tomcat-9*" "%PROJECT_DIR%apache-tomcat-9*") do (
    for /d %%T in ("%%~fP\apache-tomcat-9*") do (
        if exist "%%~fT\bin\catalina.bat" (
            set "CATALINA_HOME=%%~fT"
            exit /b 0
        )
    )
)
exit /b 1
