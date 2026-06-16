@echo off
setlocal

set "PROJECT_DIR=%~dp0"
set "JAVA_HOME=C:\Program Files\Java\jdk-26.0.1"
set "JRE_HOME=%JAVA_HOME%"
set "CATALINA_HOME=C:\Program Files\Apache Software Foundation\Tomcat 9.0"
set "CATALINA_BASE=%PROJECT_DIR%.tomcat_base"

if not exist "%JAVA_HOME%\bin\javac.exe" (
    echo [ERROR] JAVA_HOME path is not valid: %JAVA_HOME%
    echo Edit JAVA_HOME in run.bat.
    exit /b 1
)

if not exist "%CATALINA_HOME%\bin\catalina.bat" (
    echo [ERROR] CATALINA_HOME path is not valid: %CATALINA_HOME%
    echo Edit CATALINA_HOME in run.bat.
    exit /b 1
)

echo [1/2] Compiling Java classes...
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

echo [2/2] Starting Tomcat...
echo Open: http://localhost:8080/PBL_JSP/index.jsp
"%CATALINA_HOME%\bin\catalina.bat" run

endlocal
