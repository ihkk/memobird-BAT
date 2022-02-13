@echo off

set timestamp=%time:~0,-3%
set datestamp=%date:~0,-2%

for /f "delims=" %%i in ('call D:\Memobird_BAT\base64.bat -encode %timestamp% -eval yes') do set bas64Time=%%i
for /f "delims=" %%i in ('call D:\Memobird_BAT\base64.bat -encode %datestamp% -eval yes') do set bas64Date=%%i


set Msg=T:PT0gUEMgUG93ZXJlZCBPbiA9PQo=^|T:%bas64Date%^|T:IA==^|T:%bas64Time%


curl -d "ak=AAA&printcontent=%Msg%&memobirdID=BBB&userID=CCC" -X POST http://open.memobird.cn/home/printpaper