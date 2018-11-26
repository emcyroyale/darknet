#!/bin/bash

export PATH=$PATH:/usr/local/cuda/bin 
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64 

cfg="test.txt"
stat="stat"
yolo_dir="../darknet-V2/"
yoloV3_dir="./"
log_dir="./logs/"

#Create stat file if does not exist if [ ! -f $stat ]
if [ ! -f $stat ]
then
    echo "Creating Status"
    touch "$stat"
    echo "0" > "$stat"
fi



status=$(head -n 1 $stat)
echo "Status: $status"
echo ${log_dir}log_${status_}$(date +%Y-%m-%d.%H:%M:%S)

if [[ $status -lt 1 ]]
then
    echo "Inside 1"
    #time ${yoloV3_dir}darknet detector train ${yolo_dir}cfg/DL_Dataset.data ${yoloV3_dir}cfg/yolov3-tiny.cfg ${yoloV3_dir}weights/darknet-pretrained-Imagenet.weights -gpus 0,1,2,3 >> ${log_dir}log_${status_}$(date +%Y-%m-%d.%H:%M:%S)
    time ${yoloV3_dir}darknet detector train ${yolo_dir}cfg/DL_Dataset.data ${yoloV3_dir}cfg/yolov2.cfg ${yoloV3_dir}weights/darknet-pretrained-Imagenet.weights -gpus 0,1,2,3 >> ${log_dir}log_${status_}$(date +%Y-%m-%d.%H:%M:%S)
    echo "1" > "$stat"
fi

