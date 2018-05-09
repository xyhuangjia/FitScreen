//
//  MHFitScreenKit.h
//  Pods
//
//  Created by 黄佳 on 2017/9/11.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger,CalloutSize) {
   
    Callout750X1334  = 1 << 1,
    Callout1080X1920 = 1 << 2,
};

@interface MHFitScreenKit : NSObject
@property(nonatomic,assign,readonly)CGFloat factor;
@property(nonatomic,assign,readonly)CalloutSize calloutSize;
+ (instancetype)shareInstance;
- (void)setViewCalloutSize:(CalloutSize) calloutSize;
- (float)ft_IPhoneXFactorToX;
- (float)ft_IPhoneXFactorToY;
@end
