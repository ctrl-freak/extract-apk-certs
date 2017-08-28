@echo off

if [%1]==[] goto usage

cd %~dp0
mkdir %~n1\
7z e -ir!META-INF\*.RSA %1 -o%~n1\ -aoa
for /f %%f in ('dir /b %~n1\') do openssl pkcs7 -inform DER -in %~n1\%%f -noout -print_certs -text | MORE /P > %~n1\%%f.txt
goto :eof

:usage
@echo Usage: %0 ^<apk path^>
exit /B 1
