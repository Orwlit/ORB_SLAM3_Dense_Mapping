dataSetPath=~/dataSet/TUM
configFilePath=Examples/RGB-D
VocabularyPath=Vocabulary/ORBvoc.txt
associationsPath=Examples/RGB-D/associations

./Examples/RGB-D/rgbd_tum ${VocabularyPath} ${configFilePath}/TUM1.yaml ${dataSetPath}/rgbd_dataset_freiburg1_room/ ${associationsPath}/fr1_room.txt

# ./Examples/RGB-D/rgbd_tum Vocabulary/ORBvoc.txt Examples/RGB-D/TUM1.yaml /home/orw/dataSet/TUM/rgbd_dataset_freiburg1_room/ Examples/RGB-D/associations/fr1_room.txt
