# modify total num of thread when building the project
ORB_SLAM3_BUILD_MODE=Debug
Num_Thread_Build=16

echo "Configuring and building Thirdparty/DBoW2 ..."

cd Thirdparty/DBoW2
rm -rf build
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j${Num_Thread_Build}



cd ../../g2o

echo "Configuring and building Thirdparty/g2o ..."

rm -rf build
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j${Num_Thread_Build}



cd ../../Sophus

echo "Configuring and building Thirdparty/Sophus ..."

rm -rf build
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j${Num_Thread_Build}



cd ../../../

echo "Uncompress vocabulary ..."

cd Vocabulary
tar -xf ORBvoc.txt.tar.gz




cd ..

echo "Configuring and building ORB_SLAM3 ..."

rm -rf build
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=${ORB_SLAM3_BUILD_MODE}
make -j${Num_Thread_Build}
