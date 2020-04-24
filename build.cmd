call initroot.bat
set INCLUDE=%INCLUDE%%cd%\include\;
set LIB=%LIB%%cd%\lib\;
cd src
cl *.c /Ox
link -out:test.exe *.obj
del *.obj
copy test.exe ..\run\test.exe
del *.exe 
cd ..\run\ 
test.exe
pause