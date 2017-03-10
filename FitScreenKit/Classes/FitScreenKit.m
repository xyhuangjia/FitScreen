//
//  FitScreen.m
//  MusicPlayer
//
//  Created by DeepWater on 2017/2/16.
//  Copyright © 2017年 DeepWater. All rights reserved.
//

#import "FitScreenKit.h"
#import <UIKit/UIKit.h>

/**
 *  1080*1920转6的系数
 */
static CGFloat  const parameterOne =0.96;
/**
 *  6转5的系数
 */
static CGFloat  const parametertwo =1.171875;

/**
 * 6P渲染降到1920*1080
 */
static CGFloat  const parameterThree =1.15;

@interface FitScreenKit ()
{
    float  coefficient; //缩放系数
}
@property(nonatomic,readwrite,assign)float factor;
@end

@implementation FitScreenKit

static FitScreenKit * __shareInstance;


+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __shareInstance = [super allocWithZone:zone];
    });
    return __shareInstance;
}

+ (instancetype)shareInstance {
    if (__shareInstance) return __shareInstance;
    return [[self alloc] init];
}

- (instancetype)init {
    if (self = [super init]) {
        coefficient = [self getTranateParas];
        self.factor = coefficient;
//        NSLog(@"%f",self.factor);
    }
    return self;
}

/**
 转换获取屏幕坐标

 @return 坐标信息
 */
- (float )getTranateParas{
    float convertPixel = 0;
    
    CGFloat viewHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat viewWidth = [UIScreen mainScreen].bounds.size.width;
    
    if (viewWidth ==320) {
        if (viewHeight ==480) {
            NSLog(@"NOT SUPPORT");
        }else if (viewHeight ==568){
            return convertPixel  =  1/parameterOne/3/parametertwo;
        }
    }else if (viewWidth ==375){
        return   convertPixel  =  1/parameterOne/3;
    }else if (viewWidth ==414){
        return   convertPixel  =  parameterThree/3;
    }

    return convertPixel;
}


@end
