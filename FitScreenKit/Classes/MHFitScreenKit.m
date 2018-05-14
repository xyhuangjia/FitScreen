//
//  MHFitScreenKit.m
//  Pods
//
//  Created by 黄佳 on 2017/9/11.
//





#import "MHFitScreenKit.h"
#import <UIKit/UIKit.h>
#include <sys/sysctl.h>

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


typedef NS_ENUM(NSInteger,axisType) {
    axisX,
    axisY,
};

@interface MHFitScreenKit ()
@property(nonatomic,readwrite,assign)CGFloat factor;
@property(nonatomic,readwrite,copy)NSString * platformStr;
@property(nonatomic,assign,readwrite)CalloutSize calloutSize;

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
        self.platformStr = [self platformString];
    }
    return self;
}
- (void)setViewCalloutSize:(CalloutSize) calloutSize{
//    NSLog(@"%ld",(long)calloutSize);
//    NSLog(@"%ld",_calloutSize);
    _calloutSize = calloutSize;
}
//MARK:  runtime

/**
 IPhone的X轴缩放系数

 @return <#return value description#>
 */
- (float)ft_IPhoneXFactorToX{
    if ([self.platformStr isEqualToString:@"iPhone X"]) {
//        return  1/parameterOne/3.0;
        if (_calloutSize != Callout750X1334 ) {
            return   1/parameterOne/3.0;
        }else{
            return 1/2.0;
        }
    }else if ([self.platformStr isEqualToString:@"iPhone Simulator"]){
//        NSLog(@"%f",[self getTranateParas:axisX]);
        return [self getTranateParas:axisX];
    }else{
        return  [self normalPlatformFactor];
    }
}

/**
 IPhone的Y轴缩放系数

 @return <#return value description#>
 */
- (float)ft_IPhoneXFactorToY{
    if ([self.platformStr isEqualToString:@"iPhone X"]) {
//        return  parameterThree/3.0;
        if (_calloutSize != Callout750X1334) {
            return  parameterThree/3.0;
        }else{
            return  1/2.0*3*parameterOne*parameterThree/3.0;
        }
    }else if ([self.platformStr isEqualToString:@"iPhone Simulator"]){
        return [self getTranateParas:axisY];
    }else{
        return  [self normalPlatformFactor];
    }
}


/**
 正常平台系数

 @return <#return value description#>
 */
-  (float)normalPlatformFactor{
    NSString * platform = [self platformString];
    if ([platform isEqualToString:@"iPhone5,1"]||[platform isEqualToString:@"iPhone5,2"]||[platform isEqualToString:@"iPhone5,3"]||[platform isEqualToString:@"iPhone5,4"]||[platform isEqualToString:@"iPhone6,1"]||[platform isEqualToString:@"iPhone6,2"]||[platform isEqualToString:@"iPhone8,4"]) {
        //5
        if (_calloutSize != Callout750X1334) {
             return  1/parameterOne/3.0/parametertwo;
        }else{
            return 1/parametertwo/2.0;
        }
       
    }else if ([platform isEqualToString:@"iPhone7,2"]||[platform isEqualToString:@"iPhone8,1"]||[platform isEqualToString:@"iPhone9,1"]||[platform isEqualToString:@"iPhone9,3"]||[platform isEqualToString:@"iPhone10,1"]||[platform isEqualToString:@"iPhone10,4"]){
        //6,6S.7,7S,8
        if (_calloutSize != Callout750X1334 ) {
            return   1/parameterOne/3.0;
        }else{
            return 1/2.0;
        }
        
    }else if ([platform isEqualToString:@"iPhone7,1"]||[platform isEqualToString:@"iPhone8,2"]||[platform isEqualToString:@"iPhone9,2"]||[platform isEqualToString:@"iPhone9,4"]||[platform isEqualToString:@"iPhone10,2"]||[platform isEqualToString:@"iPhone10,5"]){
        //6 Plus,6S Plus,7 Plus,7S Plus,8 Plus
 
        if (_calloutSize != Callout750X1334) {
            return  parameterThree/3.0;
        }else{
            return  1/2.0*3*parameterOne*parameterThree/3.0;
        }
        
    }
    return 0;
}

//MARK:  固件号
/**
 判断设备的型号

 @return 设备型号
 */
- (NSString *)platformString {
    //https://www.theiphonewiki.com/wiki/Models
    // Gets a string with the device model
    size_t size;
    int nR = sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = (char *)malloc(size);
    nR = sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);
    if ([platform isEqualToString:@"iPhone10,3"]||[platform isEqualToString:@"iPhone10,6"]){
        //X
        return @"iPhone X";
    }else if ([platform isEqualToString:@"iPhone Simulator"] || [platform isEqualToString:@"x86_64"]){
       return @"iPhone Simulator";
    }
    return platform;

}

//MARK:  针对模拟器等设备
/**
 转换获取屏幕坐标
 @return 坐标信息
 */
- (CGFloat )getTranateParas:(axisType)axistype{
//    NSLog(@"platformString:%@",self.platformStr);
    CGFloat convertPixel = 0;
    if (viewWidth ==320) {
        if (viewHeight ==480) {
            //不支持4s设备
            NSLog(@"NOT SUPPORT");
            return convertPixel  =  1/parameterOne/3.0/parametertwo;
        }else if (viewHeight ==568){
//            return convertPixel  =  1/parameterOne/3.0/parametertwo;
            if (_calloutSize != Callout750X1334) {
                return convertPixel  =  1/parameterOne/3.0/parametertwo;
            }else{
                return convertPixel  = 1/parametertwo/2.0;
            }
        }
    }else if (viewWidth ==375){
        if(viewHeight ==812){
            //该设备为iPhone8，需要将其降到@2x标准尺寸后放大操作满足要求
            //3.075*736
            if (axistype == axisX) {
//                return   convertPixel  =  1/parameterOne/3.0;
                if (_calloutSize != Callout750X1334) {
                    return  convertPixel  = 1/parameterOne/3.0;
                }else{
                    return convertPixel  = 1/2.0;
                }
            } else {
//                return  parameterThree/3.0;
                if (_calloutSize != Callout750X1334) {
                    return convertPixel  =  parameterThree/3.0;
                }else{
                    return convertPixel  = 1/2.0*3*parameterOne*parameterThree/3.0;
                }
            }
        }else{
//            return   convertPixel  =  1/parameterOne/3.0;
            if (_calloutSize != Callout750X1334) {
                return  convertPixel  = 1/parameterOne/3.0;
            }else{
                return convertPixel  = 1/2.0;
            }
        }
    }else if (viewWidth ==414){
//        return   convertPixel  =  parameterThree/3.0;
        if (_calloutSize != Callout750X1334) {
            return convertPixel  =  parameterThree/3.0;
        }else{
            return convertPixel  = 1/2.0*3*parameterOne*parameterThree/3.0;
        }
    }
    return convertPixel;
}







@end
