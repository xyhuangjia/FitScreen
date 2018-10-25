//
//  MHDeviceModel.h
//  FBSnapshotTestCase
//
//  Created by huangj on 2018/5/31.
//

#import <Foundation/Foundation.h>


/**
 屏幕尺寸

 - MHScreenSize3_5: <#MHScreenSize3_5 description#>
 - MHScreenSize4_0: <#MHScreenSize4_0 description#>
 - MHScreenSize4_7: <#MHScreenSize4_7 description#>
 - MHScreenSize5_5: <#MHScreenSize5_5 description#>
 - MHScreenSize5_8: <#MHScreenSize5_8 description#>
 - MHScreenSize6_1: <#MHScreenSize6_1 description#>
 - MHScreenSize6_5: <#MHScreenSize6_5 description#>
 - MHScreenSizeNew: <#MHScreenSizeNew description#>
 */
typedef NS_ENUM(NSInteger,MHScreenSize) {
    MHScreenSize3_5,
    MHScreenSize4_0,
    MHScreenSize4_7,
    MHScreenSize5_5,
    MHScreenSize5_8,
    MHScreenSize6_1,
    MHScreenSize6_5,
    MHScreenSizeNew,
};

@interface MHDeviceModel : NSObject

//MARK:  固件号

/**
 判断设备的型号

 @return 设备型号
 */
+ (MHScreenSize )platformScreenSize;

@end
