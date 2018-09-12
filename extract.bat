@echo off

if [%1]==[] goto usage

cd %~dp0
mkdir %~dpn1\
7z e -ir!META-INF\*.RSA %1 -o%~dpn1\ -aoa
for /f %%f in ('dir /b %~dpn1\') do openssl pkcs7 -inform DER -in %~dpn1\%%f -noout -print_certs -text | MORE /P > %~dpn1\%%f.txt
goto :eof

:usage
@echo Usage: %0 ^<apk path^>
exit /B 1
