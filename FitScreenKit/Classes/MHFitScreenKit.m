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
    NSLog(@"platformString:%@",[self platformString]);
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
//375*736
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

//MARK:  runtime

/**
 <#Description#>

 @return <#return value description#>
 */
- (float)ft_IPhoneXFactorToX{
    return  1/parameterOne/3;
}

/**
 IPhone的X轴缩放系数

 @return <#return value description#>
 */
- (float)ft_IPhoneXFactorToY{
    return  parameterThree/3;;
}





-  (void)currentPlatform{

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
    
    // iPhone======(支持5)
    
   
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5C";
    
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5C";
    
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5S";
    
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5S";
    
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6";
    
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6 Plus";
    
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    
    if ([platform isEqualToString:@"iPhone9,3"]) return @"iPhone 7";
    
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    
    if ([platform isEqualToString:@"iPhone9,4"]) return @"iPhone 7 Plus";
    
    if ([platform isEqualToString:@"iPhone10,1"]) return @"iPhone 8";
    
    if ([platform isEqualToString:@"iPhone10,4"]) return @"iPhone 8";
    
    if ([platform isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus";
    
    if ([platform isEqualToString:@"iPhone10,5"]) return @"iPhone 8 Plus";
    
    if ([platform isEqualToString:@"iPhone10,3"]) return @"iPhone X";
    
    if ([platform isEqualToString:@"iPhone10,6"]) return @"iPhone X";
    
    // 模拟器======
    
    if ([platform isEqualToString:@"iPhone Simulator"] || [platform isEqualToString:@"x86_64"]) return @"iPhone Simulator";
    
    return @"型号未知";
}






@end
