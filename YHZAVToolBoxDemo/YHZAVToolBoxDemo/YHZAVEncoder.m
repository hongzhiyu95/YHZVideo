//
//  YHZAVEncoder.m
//  YHZAVToolBoxDemo
//
//  Created by 于洪志 on 2022/8/6.
//
#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import <VideoToolbox/VideoToolbox.h>
#import "YHZAVEncoder.h"

@implementation YHZAVEncoder{
    int frameID;
    dispatch_queue_t mCaptureQueue;
    dispatch_queue_t mEncodeQueue;
    VTCompressionSessionRef EncodingSession;
    CMFormatDescriptionRef  format;
    NSFileHandle *fileHandle;
}
- (void)initVideoToolBox{
    frameID = 0;
    OSStatus status = VTCompressionSessionCreate(NULL, (int32_t)self.width, (int32_t)self.height, kCMVideoCodecType_H264, NULL, NULL, NULL, didCompressH264, (__bridge void*)self, &EncodingSession);
    if (status != 0)
    {
        NSLog(@"H264: Unable to create a H264 session");
        return ;
    }
    //设置实时输出
    VTSessionSetProperty(EncodingSession, kVTCompressionPropertyKey_RealTime, kCFBooleanTrue);
    VTSessionSetProperty(EncodingSession, kVTCompressionPropertyKey_ProfileLevel, kVTProfileLevel_H264_Baseline_AutoLevel);
    //gop
    uint32_t gop = (uint32_t)self.GOP;
    CFNumberRef kframeInterval = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &(gop));
    VTSessionSetProperty(EncodingSession, kVTCompressionPropertyKey_MaxKeyFrameInterval, kframeInterval);
    
    
    
    
}
void didCompressH264(void *outputCallbackRefCon, void *sourceFrameRefCon, OSStatus status, VTEncodeInfoFlags infoFlags, CMSampleBufferRef sampleBuffer) {
}
@end
