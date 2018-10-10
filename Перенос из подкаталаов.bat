@echo off

Setlocal EnableDelayedExpansion

Set Ext=*.mp4

Set From=G:\Перенести 2

Set To=C:\Users\shapka_m\Desktop\4
 
if not exist "%To%" md "%To%"
 
chcp 1251>nul
Set LanguageFlag=true
 
for /f "delims=" %%A in ('dir /b /s /a:-d "%From%\%Ext%"') do (
  if defined LanguageFlag (chcp 866>nul& Set LanguageFlag=)
  echo Found %%~A  
  Call :GetEmptyName "%To%" "%%~nxA" NewName
  Echo --^> %To%\!NewName!
  move "%%~A" "%To%\!NewName!" >nul
)
pause