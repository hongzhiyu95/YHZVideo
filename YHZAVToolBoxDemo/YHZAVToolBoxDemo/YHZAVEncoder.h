//
//  YHZAVEncoder.h
//  YHZAVToolBoxDemo
//
//  Created by 于洪志 on 2022/8/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHZAVEncoder : NSObject
@property(assign , nonatomic)NSUInteger GOP;
@property(assign , nonatomic)NSUInteger bitrate;
@property(assign , nonatomic)NSUInteger height;
@property(assign , nonatomic)NSUInteger width;
@end

NS_ASSUME_NONNULL_END
