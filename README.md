# Introduction
This is a batch file (BAT) used for printing message with Memobird (咕咕机) in windows when the system is powered on or off.

# Run with your own Memobird

1. Register your developer account at https://open.memobird.cn/ and obtain your access key (AK)

2. Obtain your Memobird ID by double-clicking the button on your device. The ID will print out automatically.

3. Bind your account using HTTP POST to http://open.memobird.cn/home/setuserbind

   The data send should contains:

   ```json
   "ak" = Your access key
   "memobirdID" = Your memobird ID
   "useridentifying" = An arbitrary nickname
   ```

   You should get the message returned containing you **userID** (a digital string)

4. Apply the POST parameters to batch file.

   ```bash
   curl -d "ak=YOURAK&printcontent=%Msg%&memobirdID=YOURMEMOBIRDID&userID=YOURUSERID" -X POST http://open.memobird.cn/home/printpaper
   ```

# Edit the directory

It should be noticed that, when directory adding bat file to `Start Up` folder or the user configurations, indirectly referencing other files might fail. So it is strongly recommended to directly reference `base64.bat`.

**Please change the directory of `base64.bat` in the scripts line 6&7 before using it.**

# Add to system configuration

## For Windows 8 Pro or newer

Use `Win+R` and open `gpedit.msc`, the **Local Group Policy Editor**.

Under `Computer Configuration / Windows Settings` you'll find **Scripts (Startup/Shutdown)**

Under `User Configuration / Windows Settings` you'll find **Scripts (Logon/Logoff)**

Then you can add the scripts.

## For Win8 or Win10

If you are not using a Pro version Windows, you may use the methods below to add the batch file to the start-up folder.

Use `Win+R` and open `shell:startup`, the **Start-up folder**.

Copy the BAT file to the folder opened.

## For Win7 or below

`Start` -> `Programs` or `All Programs`->`Start Up`->Right click and open folder.

Copy the BAT file to the folder opened.

# Reference

- For Memobird API, please check  [Memobird API document](http://api.mymemobird.com/ftp/webapi.pdf)
- For tutorials adding scripts, please check [How can I start a batch script before logging in?](https://superuser.com/questions/548192/how-can-i-start-a-batch-script-before-logging-in)

- For Base64 Encode batch file, please check [base64.bat](https://github.com/npocmaka/batch.scripts/blob/master/hybrids/jscript/base64.bat )

