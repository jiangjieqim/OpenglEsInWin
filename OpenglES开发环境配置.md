1.�޷�������ʧLibMaliEmulator.dll,log4cplus.dll


2.�쳣
FATAL -GLES:(GLNativeProxy::FunctionTable::GLFunction(void __cdecl(unsigned int,int,int)>::checkMissingVersions 2455
 ub 'opengl32.dll' (require for version of GL)!


3.crt0dat.c ��__crtExitProcess ExitProcess(status);  
es_t.exe �е� 0x778022e2 ��δ������쳣: 0xC0000005: д��λ�� 0x00000004 ʱ�������ʳ�ͻ  
```
void __cdecl __crtExitProcess (
        int status
        )
{
        __crtCorExitProcess(status);

        /*
         * Either mscoree.dll isn't loaded,
         * or CorExitProcess isn't exported from mscoree.dll,
         * or CorExitProcess returned (should never happen).
         * Just call ExitProcess.
         */

        ExitProcess(status);
}
```
�� ExitProcess���������쳣Crash  

4.��������  
������dll:  
openglessl\Mali-T600_r7p0-00rel0.dll  
libEGL.dll,libGLESv2.dll,libMaliEmulator.dll,log4cplus.dll  


����Mali_OpenGL_ES_Emulator-v3.0.2.g694a9-Windows-32bit.zip  
ģ�������ص�ַ:
https://developer.arm.com/tools-and-software/graphics-and-gaming/opengl-es-emulator/downloads  



ʵ���������ص�ַ:  
git clone http://www.github.com/danginsburg/opengles3-book  

***src  
...\opengles3-book-master\Common\Source  
esShader.c,esShapes.c,esTransform.c,esUtil.c  

...\opengles3-book-master\Common\Source\Win32  
esUtil_win32.c  

***include  
...\opengles3-book-master\Common\Include  
esUtil.h,esUtil_win.h  

Mali_OpenGL_ES_Emulator-v3.0.2.g694a9-Windows-32bit\include  

***lib  
...\Mali_OpenGL_ES_Emulator-v3.0.2.g694a9-Windows-32bit\
libGLESv2.lib,libEGL.lib  

>>>>>>>>>>>>>>>>>>>>>>����ű�>>>>>>>>>>>>>>>>>>>>  

����������ʼ��initroot.bat  
```
@rem ��Ŀ��vs2005����
@echo off
IF exist "c:\Program Files (x86)" (set v=0) ELSE (set v=1)
set ROOT=Program Files (x86)
IF %v%==1 (set ROOT=Program Files)
set PATH=C:\%ROOT%\Microsoft Visual Studio 8\VC\bin;C:\%ROOT%\Microsoft Visual Studio 8\Common7\IDE;
set INCLUDE=C:\%ROOT%\Microsoft Visual Studio 8\VC\include;C:\%ROOT%\Microsoft Visual Studio 8\VC\PlatformSDK\Include;
set LIB=C:\%ROOT%\Microsoft Visual Studio 8\VC\lib\;C:\%ROOT%\Microsoft Visual Studio 8\VC\PlatformSDK\Lib;
```

build.bat  
```
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
```

esUtil_win32.obj : error LNK2019: �޷��������ⲿ���� __imp__GetCursorPos@4���÷����ں��� _ESWindowProc@16 �б�����  
�������:����  #pragma comment(lib,"user32.lib")  

esUtil_win32.obj : error LNK2019: �޷��������ⲿ���� __imp__GetStockObject@4���÷����ں��� _WinCreate �б�����
 �������:����  #pragma comment(lib,"gdi32.lib")  

������ļ����������
```
#pragma comment (lib,"libEGL.lib")
#pragma comment (lib,"libGLESv2")
#pragma comment(lib,"user32.lib")
#pragma comment(lib,"gdi32.lib")
```