@echo off
rem path:VCU_2108100-RM01_SW5.04.C_221012_8252_01 零部件信息spare parts+版本号
rem pro1 熊哥part_2的部分 进哥part_3  加哥sourcepath
rem D:\Jenkins\workspace\F1_project\BUILD_TEST\Merge\in_out 文件夹保存在这个路径下

rem 中文正常显示
chcp 65001

set curpath=%~dp0
rem 这下面根据真正的 s19文件路径改写
set sourcedir_2=D:\1integation\SVNshare\CI_project\zbtest\XXX
cd /d %sourcedir_2%
set houzhui=Dvlp.s19
for %%i in (*%houzhui%) do set Dvlp=%%i & echo 成功
rem for /f "delims=" %%j in ('for %%i in (*%houzhui%) do echo %%i') do set b=%%j
echo Dvlp.s19wen文件的全名为：%Dvlp%
cd /d %curpath%

rem 获取文件夹名
set part_3=%Dvlp:~0,23%
set part_1=VCU
rem 后面要改这个零件号
set part_2=2108100-RM01
rem set month=%date:~0,4%%date:~5,2%%date:~8,2%
rem set "part_2=%ssmsg%_"
rem set part_3=SW5.04.C_20221106_8252_01
set "result=%part_1%_%part_2%_%part_3%" 
echo %result%


rem 被拷贝的两个固定文件的路径
echo CheckCurrentPath:%curpath%
set sourcepath_1=%curpath%\demo\1-VCU-Drv-D01.s19
set sourcepath_3=%curpath%\demo\pkg-cfg.json

rem 被拷贝的一个固定文件的路径
set sourcepath_2=%sourcedir_2%\%Dvlp%
set chname=2-VCU-App-A01.s19

rem 创建打包目录
set dirpath=%curpath%\%result%
mkdir %dirpath%

rem 拷贝文件
copy %sourcepath_2% %dirpath%\%chname%
rem ren %dirpath%\*.s19 %dirpath%\%chname%

copy /B %sourcepath_1% %dirpath%
copy %sourcepath_3% %dirpath%


rem python实现修改json文件 
rem 下方添加供应商代码8252
set arg_1=%part_2%-8252test
set arg_2=%part_3%test
python -3 %curpath%chjson.py %dirpath%\pkg-cfg.json %arg_1% %arg_2%




pause nul
rem set a[1] = 0
rem set houzhui=.jpg .gif .png .swf 



