//
//  MHFitScreenKit.h
//  Pods
//
//  Created by 黄佳 on 2017/9/11.
//

#import <Foundation/Foundation.h>

@interface MHFitScreenKit : NSObject
@property(nonatomic,assign,readonly)CGFloat factor;
+ (instancetype)shareInstance;
@end
