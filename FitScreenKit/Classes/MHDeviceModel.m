//
//  MHDeviceModel.m
//  FBSnapshotTestCase
//
//  Created by huangj on 2018/5/31.
//

#import "MHDeviceModel.h"
#include <sys/sysctl.h>

/*4 系列设备*/
static CGFloat const kiPhone4SScreenWidth = 320;
static CGFloat const kiPhone4SScreenHeigth = 480;

/*5 系列设备*/
static CGFloat const kiPhone5SScreenWidth = 320;
static CGFloat const kiPhone5SScreenHeigth = 568;

/*正常 系列设备*/
static CGFloat const kiPhone6ScreenWidth = 375;
static CGFloat const kiPhone6ScreenHeigth = 667;

/*Plus系列设备*/
static CGFloat const kiPhone6PlusScreenWidth = 414;
static CGFloat const kiPhone6PlusScreenHeigth = 736;

/*X系列设备*/
static CGFloat const kiPhoneXScreenWidth = 375;
static CGFloat const kiPhoneXScreenHeigth = 812;

@interface MHDeviceModel()

@end

@implementation MHDeviceModel

//MARK:  固件号
/**
 判断设备的型号
 
 @return 设备型号
 */
+ (MHScreenSize )platformScreenSize{
    //https://www.theiphonewiki.com/wiki/Models
    // Gets a string with the device model
    size_t size;
    int nR = sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = (char *)malloc(size);
    nR = sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);
    
    if ([platform isEqualToString:@"iPhone11,8"]){
        //XSMax
        return MHScreenSize6_1;
    }else if ([platform isEqualToString:@"iPhone11,6"]||[platform isEqualToString:@"iPhone11,4"]){
        //XSMax
        return MHScreenSize6_5;
    }else if ([platform isEqualToString:@"iPhone10,3"]||[platform isEqualToString:@"iPhone10,6"]||[platform isEqualToString:@"iPhone11,2"]){
        //X XS
        return MHScreenSize5_8;
    }else if ([platform isEqualToString:@"iPhone5,1"]||[platform isEqualToString:@"iPhone5,2"]||[platform isEqualToString:@"iPhone5,3"]||[platform isEqualToString:@"iPhone5,4"]||[platform isEqualToString:@"iPhone6,1"]||[platform isEqualToString:@"iPhone6,2"]||[platform isEqualToString:@"iPhone8,4"]) {
        //5,5S,5C
        return MHScreenSize4_0;
        
    }else if ([platform isEqualToString:@"iPhone7,2"]||[platform isEqualToString:@"iPhone8,1"]||[platform isEqualToString:@"iPhone9,1"]||[platform isEqualToString:@"iPhone9,3"]||[platform isEqualToString:@"iPhone10,1"]||[platform isEqualToString:@"iPhone10,4"]){
        //6,6S.7,7S,8
        return MHScreenSize4_7;
        
    }else if ([platform isEqualToString:@"iPhone7,1"]||[platform isEqualToString:@"iPhone8,2"]||[platform isEqualToString:@"iPhone9,2"]||[platform isEqualToString:@"iPhone9,4"]||[platform isEqualToString:@"iPhone10,2"]||[platform isEqualToString:@"iPhone10,5"]){
        //6 Plus,6S Plus,7 Plus,7S Plus,8 Plus
        return MHScreenSize5_5;
    } else if ([platform isEqualToString:@"iPhone Simulator"] || [platform isEqualToString:@"x86_64"]){
//        return @"iPhone Simulator";
        /*模拟器返回数据*/
        return [self getMHScreenSizeFromSimulator];
    }
        return MHScreenSizeNew;
}

/**
 通过模拟器获取设备型号

 @return 设备型号
 */
+ (MHScreenSize)getMHScreenSizeFromSimulator{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;

//    NSLog(@"%f == %f",width,height);
    if (width == kiPhone4SScreenWidth && height == kiPhone4SScreenHeigth) {
        return MHScreenSize3_5;
    } else if (width == kiPhone5SScreenWidth && height == kiPhone5SScreenHeigth) {
        return MHScreenSize4_0;
    } else if (width == kiPhone6ScreenWidth && height == kiPhone6ScreenHeigth) {
        return MHScreenSize4_7;
    } else if (width == kiPhone6PlusScreenWidth && height == kiPhone6PlusScreenHeigth) {
        return MHScreenSize5_5;
    } else if (width == kiPhoneXScreenWidth && height == kiPhoneXScreenHeigth) {
        return MHScreenSize5_8;
    } else {
        return MHScreenSizeNew;
    }
    return 0;
}
@end
