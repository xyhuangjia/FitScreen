//
//  MHFitScreenKit.m
//  Pods
//
//  Created by 黄佳 on 2017/9/11.
//

#import "MHFitScreenKit.h"
#import <UIKit/UIKit.h>
#import "MHDeviceModel.h"

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
@property (nonatomic,assign,readwrite) CGFloat  factor;
@property (nonatomic,assign,readwrite)  CalloutSize calloutSize;
@property (nonatomic,assign,readwrite)  MHScreenSize size;
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
        self.size = [MHDeviceModel platformScreenSize];
    }
    return self;
}
- (void)setViewCalloutSize:(CalloutSize) calloutSize{
//    NSLog(@"%ld",(long)calloutSize);
//    NSLog(@"%ld",_calloutSize);
    _calloutSize = calloutSize;
}

- (CGFloat)factor{
    return [self normalPlatformFactor:self.size];
}


//MARK:  runtime
/**
 iPhone的X轴缩放系数

 @return 缩放系数
 */
- (float)ft_IPhoneXFactorToX{
    float factorx  = 0.0;
    if (self.size == MHScreenSize5_8) {
        if (_calloutSize != Callout750X1334) {
            factorx = parameterThree/3.0;
        }else{
            factorx =  1/2.0*3*parameterOne*parameterThree/3.0;
        }
    } else {
        factorx = [self normalPlatformFactor:self.size];
    }
    return factorx;
}

/**
 iPhone的Y轴缩放系数

 @return return 缩放系数
 */
- (float)ft_IPhoneXFactorToY{
    float factory  = 0.0;
    if (self.size == MHScreenSize5_8) {
        if (_calloutSize != Callout750X1334) {
            return  parameterThree/3.0;
        }else{
            return  1/2.0*3*parameterOne*parameterThree/3.0;
        }
    } else {
        factory = [self normalPlatformFactor:self.size];
    }
    return factory;
}


/**
 正常平台系数

 @return <#return value description#>
 */
-  (float)normalPlatformFactor:(MHScreenSize)size{
    float normalFactor  = 0.0;
    switch (size) {
        case MHScreenSize5_5:
        {
            if (_calloutSize != Callout750X1334) {
                normalFactor = parameterThree/3.0;
            }else{
                normalFactor =  1/2.0*3*parameterOne*parameterThree/3.0;
            }
        }
            break;
        case MHScreenSize4_7:
        {
            if (_calloutSize != Callout750X1334 ) {
                normalFactor =   1/parameterOne/3.0;
            }else{
                normalFactor = 1/2.0;
            }
        }
            break;
        case MHScreenSize4_0:
        {
            //5
            if (_calloutSize != Callout750X1334) {
                normalFactor =  1/parameterOne/3.0/parametertwo;
            }else{
                normalFactor = 1/2.0/parametertwo;
            }
        }
            break;
        case MHScreenSize3_5:
        {//4S
            if (_calloutSize != Callout750X1334) {
                normalFactor =  parameterThree/3.0;
            }else{
                normalFactor =   1/2.0*3*parameterOne*parameterThree/3.0;
            }
        }
            break;
            
        default:
            break;
    }
    return normalFactor;
}

//MARK: 系数运算


/**
 获取设别信息

 @param callloutSizeType <#callloutSizeType description#>
 @param screenSize <#deviceName description#>
 @param completion <#completion description#>
 */
- (void)getMessageWithCallloutSizeType:(CalloutSize)callloutSizeType
                           MHScreenSize:(MHScreenSize )screenSize
                           Completion:(void(^)(NSDictionary * info))completion{
    NSDictionary * dic = @{@"size":@"设备型号"};
    completion(dic);
}

@end
