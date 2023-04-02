@echo off
for %%a IN (100 100000 100000000) do (
    echo %%a
    fsutil file createnew %%a %%a
    echo %time%
    move %%a dest\%%a
    echo %time%
)