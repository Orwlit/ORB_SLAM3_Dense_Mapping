//
// Created by hyang on 17/07/2018.
//

#ifndef POINTCLOUDMAPPING_H
#define POINTCLOUDMAPPING_H

#include "System.h"

#include <pcl/common/transforms.h>
#include <pcl/point_types.h>
#include <pcl/filters/voxel_grid.h>
#include <condition_variable>

using namespace ORB_SLAM3;

class PointCloudMapping
{
public:
    typedef pcl::PointXYZRGBA PointT;
    typedef pcl::PointCloud<PointT> PointCloud;

    PointCloudMapping( double resolution_ );

    // 插入一个keyframe，会更新一次地图
    void insertKeyFrame( KeyFrame* kf, cv::Mat& color, cv::Mat& depth );
    void shutdown();
    void viewer();

protected:
    PointCloud::Ptr generatePointCloud(KeyFrame* kf, cv::Mat& color, cv::Mat& depth);

    PointCloud::Ptr globalMap;
    shared_ptr<thread>  viewerThread;

    bool    shutDownFlag    =false;
    mutex   shutDownMutex;

    condition_variable      keyFrameUpdated;
    std::mutex              keyFrameUpdateMutex;

    // data to generate point clouds
    std::vector<KeyFrame*>       keyframes;
    std::vector<cv::Mat>         colorImgs;
    std::vector<cv::Mat>         depthImgs;
    std::mutex                   keyframeMutex;
    uint16_t                lastKeyframeSize = 0;

    double resolution = 0.04;
    pcl::VoxelGrid<PointT>  voxel;
};

#endif // POINTCLOUDMAPPING_H
