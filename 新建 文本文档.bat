@echo.
@echo     ��������������������������������������������������������
@echo     ��                                                    ��
@echo     ��    �����������Զ�������������ͱ������ӵ�IP��ַ    ��
@echo     ��                                                    ��
@echo     ��                                                    ��
@echo     �� 1 - �������������ַΪ192.168.2.188�����ڹ�˾����  ��
@echo     ��                                                    ��
@echo     �� 2 - �������������ַΪ�Զ���ȡ�������ⲿ����       ��
@echo     ��                                                    ��
@echo     �� 3 - ���ñ������ӵ�ַΪ192.168.2.220��������������  ��
@echo     ��                                                    ��
@echo     �� 4 - ���ñ������ӵ�ַΪ�Զ���ȡ�������ⲿ����       ��
@echo     ��                                                    ��
@echo     ��������������������������������������������������������
@echo.
@echo.
@echo.
@echo     ******��ѡ�����÷�ʽ[1,2,3,4]�������س�ȷ��ִ��******
@echo.
@echo.
@echo.
@echo.
@ SET /P ST="��ʽѡ��: "
echo.
if /I "%ST%"=="1" goto setip1
if /I "%ST%"=="2" goto setip1no
if /I "%ST%"=="3" goto setip2
if /I "%ST%"=="4" goto setip2no
:setip1
cls
@echo.
@echo         ---------------------------------------------
@echo         ������Զ�Ϊ��WLAN����д��������:
@echo                  IP��ַ��  192.168.2.188
@echo                  �������룺255.255.255.0
@echo                  ���أ�    192.168.2.1
@echo.
@echo                  ��ѡDNS:  223.5.5.5
@echo                  ����DNS:  114.114.114.114
@echo         ---------------------------------------------
@echo.
@echo.
@echo.
@echo.
@echo.
@ pause
@echo ����IP��ַ...
@echo off
netsh interface ip set address name="WLAN" source=static addr=192.168.2.188 mask=255.255.255.0 gateway=192.168.2.1 1
@echo ��������DNS...
@echo off
netsh interface ip set dns name="WLAN" source=static addr=223.5.5.5
@echo ���ñ���DNS...
@echo off
netsh interface ip add dns "WLAN" 114.114.114.114 index=2
@echo ������ɡ�
@ pause
exit
:setip1no
cls
@echo.
@echo         ----------------------------------------
@echo         ������Զ�Ϊ��WLAN����д��������:
@echo.
@echo                      �Զ���ȡIP��ַ
@echo                  �Զ���ȡDNS��������ַ
@echo         -----------------------------------------
@echo.
@echo.
@echo.
@echo.
@ pause
@echo.
@echo off
@echo �����Զ���ȡIP��ַ������
netsh interface ip set address name="WLAN" source=dhcp
@echo �����Զ���ȡDNS��������ַ������
netsh interface ip set dns name="WLAN" source=dhcp
@echo.
@echo ������ɡ�
@ pause
exit
:setip2
cls
@echo.
@echo         ---------------------------------------------
@echo            ������Զ�Ϊ���������ӡ���д��������:
@echo                  IP��ַ��  192.168.2.220
@echo                  �������룺255.255.255.0
@echo                  ���أ�    192.168.2.1
@echo.
@echo                  �Զ���ȡDNS��������ַ
@echo         ---------------------------------------------
@echo.
@echo.
@echo.
@echo.
@echo.
@ pause
@echo.
@echo off
@echo ����IP��ַ������
netsh interface ip set address name="��������" source=static addr=192.168.2.220 mask=255.255.255.0 gateway=192.168.2.1 1
@echo �����Զ���ȡDNS��������ַ������
netsh interface ip set dns name="��������" source=dhcp
@echo �������
@echo.
@ pause
exit
:setip2no
cls
@echo.
@echo         ----------------------------------------
@echo         ������Զ�Ϊ���������ӡ���д��������:
@echo.
@echo                      �Զ���ȡIP��ַ
@echo                  �Զ���ȡDNS��������ַ
@echo         -----------------------------------------
@echo.
@echo.
@echo.
@echo.
@ pause
@echo.
@echo off
@echo �����Զ���ȡIP��ַ������
netsh interface ip set address name="��������" source=dhcp
@echo �����Զ���ȡDNS��������ַ������
netsh interface ip set dns name="��������" source=dhcp
@echo.
@echo ������ɡ�
@ pause
exit