@echo off

set timestamp=%time:~0,-3%
set datestamp=%date:~0,-2%

for /f "delims=" %%i in ('call D:\Memobird_BAT\base64.bat -encode %timestamp% -eval yes') do set bas64Time=%%i
for /f "delims=" %%i in ('call D:\Memobird_BAT\base64.bat -encode %datestamp% -eval yes') do set bas64Date=%%i


set Msg=T:PT0gUEMgUG93ZXJlZCBPbiA9PQo=^|T:%bas64Date%^|T:IA==^|T:%bas64Time%


curl -d "ak=2253f116b56640afa29ad2860422f96e&printcontent=%Msg%&memobirdID=ff13d604822593e5&userID=1234821" -X POST http://open.memobird.cn/home/printpaper