@echo off
for /f %%a IN ('dir /b /s dest') do del %%a

echo %time%
for /l %%x in (1, 1, 10) do (
   copy 1.txt dest\%%x.txt
)
echo %time%