//
//  FitScreenKit.h
//  Pods
//
//  Created by 黄佳 on 2017/9/11.
//

#ifndef FitScreenKit_h
#define FitScreenKit_h
#import "MHFitScreenKit.h"

static inline CGFloat factor(CGFloat value) {
    return value * [MHFitScreenKit shareInstance].factor;
}
static inline CGFloat factorX(CGFloat value) {
    return value * [[MHFitScreenKit shareInstance]  ft_IPhoneXFactorToX];
}
static inline CGFloat factorY(CGFloat value) {
    return value * [[MHFitScreenKit shareInstance] ft_IPhoneXFactorToY];
}
#endif /* FitScreenKit_h */
