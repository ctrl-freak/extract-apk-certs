@echo off

if [%1]==[] goto usage

cd %~dp0
mkdir %~nx1
7z e -ir!META-INF\*.RSA %1 -o%~nx1\ -aoa
for /f %%f in ('dir /b %~nx1\') do openssl pkcs7 -inform DER -in %~nx1\%%f -noout -print_certs -text | MORE /P > %~nx1\%%f.txt
goto :eof

:usage
@echo Usage: %0 ^<apk path^>
exit /B 1
