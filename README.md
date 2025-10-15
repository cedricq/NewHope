# NewHope

To build :

1) Install Atollic (http://download.atollic.com/TrueSTUDIO/installers/Atollic_TrueSTUDIO_for_STM32_windows_x86_v9.0.1_20180420-1214.exe)

2) Install gcc (if not install) using cygwin installer (https://www.cygwin.com/setup-x86_64.exe)

3) Define the following two env variables to point to the GCC for ARM and GCC for Windows, for example :

ENV_GCC_ARM=C:\Program Files (x86)\Atollic\TrueSTUDIO for STM32 9.0.0\ARMTools
ENV_GCC_CYGWIN=C:\cygwin

4) To run unit tests, type : run-unittest or run-unittest ARG=NameOfTest_UnitTest

5) To build SW on windows, build-simDbg

6) To build SW on target,  build-deviceF4Rel or build-deviceF4Dbg



