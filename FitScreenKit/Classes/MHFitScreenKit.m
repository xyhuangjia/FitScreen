//
//  MHFitScreenKit.m
//  Pods
//
//  Created by 黄佳 on 2017/9/11.
//

#import "MHFitScreenKit.h"
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

@interface MHFitScreenKit ()
@property(nonatomic,readwrite,assign)CGFloat factor;
@end

@implementation MHFitScreenKit

static MHFitScreenKit * __shareInstance;
static CGFloat viewHeight = 0;
static CGFloat viewWidth = 0;

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __shareInstance = [super allocWithZone:zone];
        viewHeight      = [UIScreen mainScreen].bounds.size.height;
        viewWidth       = [UIScreen mainScreen].bounds.size.width;
    });
    return __shareInstance;
}

+ (instancetype)shareInstance {
    if (__shareInstance) return __shareInstance;
    return [[self alloc] init];
}

- (instancetype)init {
    if (self = [super init]) {
        self.factor = [self getTranateParas];
        NSLog(@"factor%f",self.factor);
    }
    return self;
}

/**
 转换获取屏幕坐标
 @return 坐标信息
 */
- (CGFloat )getTranateParas{
    CGFloat convertPixel = 0;
    if (viewWidth ==320) {
        if (viewHeight ==480) {
            //不支持4s设备
            NSLog(@"NOT SUPPORT");
            return convertPixel  =  1/parameterOne/3/parametertwo;
        }
        else if (viewHeight ==568){
            return convertPixel  =  1/parameterOne/3/parametertwo;
        }
    }else if (viewWidth ==375){
        if(viewHeight ==812){
            //该设备为iPhone8，需要将其降到@2x标准尺寸后放大操作满足要求
           return   convertPixel  =  1/parameterOne/3;
        }
        else{
          return   convertPixel  =  1/parameterOne/3;
        }
    }else if (viewWidth ==414){
        return   convertPixel  =  parameterThree/3;
    }
    return convertPixel;
}

@end
