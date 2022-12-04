@echo.
@echo     ※※※※※※※※※※※※※※※※※※※※※※※※※※※※
@echo     ※                                                    ※
@echo     ※    本命令用于自动设置无线网络和本地连接的IP地址    ※
@echo     ※                                                    ※
@echo     ※                                                    ※
@echo     ※ 1 - 设置无线网络地址为192.168.2.188，用于公司上网  ※
@echo     ※                                                    ※
@echo     ※ 2 - 设置无线网络地址为自动获取，用于外部上网       ※
@echo     ※                                                    ※
@echo     ※ 3 - 设置本地连接地址为192.168.2.220，用于网线连接  ※
@echo     ※                                                    ※
@echo     ※ 4 - 设置本地连接地址为自动获取，用于外部上网       ※
@echo     ※                                                    ※
@echo     ※※※※※※※※※※※※※※※※※※※※※※※※※※※※
@echo.
@echo.
@echo.
@echo     ******请选择设置方式[1,2,3,4]，并按回车确定执行******
@echo.
@echo.
@echo.
@echo.
@ SET /P ST="方式选择: "
echo.
if /I "%ST%"=="1" goto setip1
if /I "%ST%"=="2" goto setip1no
if /I "%ST%"=="3" goto setip2
if /I "%ST%"=="4" goto setip2no
:setip1
cls
@echo.
@echo         ---------------------------------------------
@echo         本命令将自动为“WLAN”填写以下内容:
@echo                  IP地址：  192.168.2.188
@echo                  子网掩码：255.255.255.0
@echo                  网关：    192.168.2.1
@echo.
@echo                  首选DNS:  223.5.5.5
@echo                  备用DNS:  114.114.114.114
@echo         ---------------------------------------------
@echo.
@echo.
@echo.
@echo.
@echo.
@ pause
@echo 设置IP地址...
@echo off
netsh interface ip set address name="WLAN" source=static addr=192.168.2.188 mask=255.255.255.0 gateway=192.168.2.1 1
@echo 设置首先DNS...
@echo off
netsh interface ip set dns name="WLAN" source=static addr=223.5.5.5
@echo 设置备用DNS...
@echo off
netsh interface ip add dns "WLAN" 114.114.114.114 index=2
@echo 设置完成。
@ pause
exit
:setip1no
cls
@echo.
@echo         ----------------------------------------
@echo         本命令将自动为“WLAN”填写以下内容:
@echo.
@echo                      自动获取IP地址
@echo                  自动获取DNS服务器地址
@echo         -----------------------------------------
@echo.
@echo.
@echo.
@echo.
@ pause
@echo.
@echo off
@echo 设置自动获取IP地址．．．
netsh interface ip set address name="WLAN" source=dhcp
@echo 设置自动获取DNS服务器地址．．．
netsh interface ip set dns name="WLAN" source=dhcp
@echo.
@echo 设置完成。
@ pause
exit
:setip2
cls
@echo.
@echo         ---------------------------------------------
@echo            本命令将自动为“本地连接”填写以下内容:
@echo                  IP地址：  192.168.2.220
@echo                  子网掩码：255.255.255.0
@echo                  网关：    192.168.2.1
@echo.
@echo                  自动获取DNS服务器地址
@echo         ---------------------------------------------
@echo.
@echo.
@echo.
@echo.
@echo.
@ pause
@echo.
@echo off
@echo 设置IP地址．．．
netsh interface ip set address name="本地连接" source=static addr=192.168.2.220 mask=255.255.255.0 gateway=192.168.2.1 1
@echo 设置自动获取DNS服务器地址．．．
netsh interface ip set dns name="本地连接" source=dhcp
@echo 设置完成
@echo.
@ pause
exit
:setip2no
cls
@echo.
@echo         ----------------------------------------
@echo         本命令将自动为“本地连接”填写以下内容:
@echo.
@echo                      自动获取IP地址
@echo                  自动获取DNS服务器地址
@echo         -----------------------------------------
@echo.
@echo.
@echo.
@echo.
@ pause
@echo.
@echo off
@echo 设置自动获取IP地址．．．
netsh interface ip set address name="本地连接" source=dhcp
@echo 设置自动获取DNS服务器地址．．．
netsh interface ip set dns name="本地连接" source=dhcp
@echo.
@echo 设置完成。
@ pause
exit