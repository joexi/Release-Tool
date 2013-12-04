#!/bin/bash  
# 开启Unity项目执行编译


project_path=$1
output_path=$2

#android 部分
/Applications/Unity/Unity.app/Contents/MacOS/Unity -projectPath ${project_path} -executeMethod ReleaseTool.BuildAndroid -quit -batchmode

cd ${project_path}

cp k2.pkg ${output_path}

# rm -rf k2.pkg

# ios 部分
/Applications/Unity/Unity.app/Contents/MacOS/Unity -projectPath ${project_path} -executeMethod ReleaseTool.BuildiOS -quit -batchmode

target_name="Unity-iPhone";

cd ${project_path}

xcodebuild -configuration Release -target ${target_name} PROVISIONING_PROFILE=""

mkdir -p ipa/Payload

cp -r ${project_path}/build/ ${project_path}/ipa/Payload/

cd ipa

zip -r k2.ipa *

rm -rf Payload

# cd $project_path

# rm -rf xcode

# rm -rf ipa

cp k2.ipa ${output_path}


