#!/bin/bash  
# 开启Unity项目执行编译

project_path=$1
output_path=$2
/Applications/Unity/Unity.app/Contents/MacOS/Unity -projectPath ${project_path} -executeMethod Tool.BuildAndroid -quit


cd $project_path

cp k2.pkg $output_path
