//
//  RectUtils.h
//  MusicPlayer
//
//  Created by DeepWater on 2017/2/18.
//  Copyright © 2017年 DeepWater. All rights reserved.
//

#ifndef RectUtils_h
#define RectUtils_h

#include <CoreGraphics/CGGeometry.h>

/**
 适配屏幕

 @param pix 像素
 @return 适配后返回数值
 */
#define Factor(pix) [FitScreen shareInstance].factor*(pix)

#define fit [FitScreen shareInstance].factor

//CG_INLINE CGRect CGRectChangeSize(CGRect rect, CGSize size);
//CG_INLINE CGRect CGRectChangeWidth(CGRect rect, CGFloat width);
//CG_INLINE CGRect CGRectChangeHeight(CGRect rect, CGFloat height);
//
//CG_INLINE CGRect CGRectChangeOrigin(CGRect rect, CGPoint origin);
//CG_INLINE CGRect CGRectChangeY(CGRect rect, CGFloat y);
//CG_INLINE CGRect CGRectChangeX(CGRect rect, CGFloat x);
//
//CG_INLINE CGRect CGRectAspectFit(CGRect parentRect, CGSize childSize);
//CG_INLINE CGRect CGRectAspectFill(CGRect parentRect, CGSize childSize);
//
//CG_INLINE CGRect CGRectMakeFromOriginAndSize(CGPoint origin, CGSize size);
//
//CG_INLINE CGSize CGSizeAspectFit(CGSize parentSize, CGSize childSize);
//CG_INLINE CGSize CGSizeAspectFill(CGSize parentSize, CGSize childSize);
//CG_INLINE CGSize CGSizeChangeHeigth(CGSize size, CGFloat height);
//CG_INLINE CGSize CGSizeChangeWidth(CGSize size, CGFloat width);
//
///*** Definitions of inline functions. ***/
//
//CG_INLINE CGRect CGRectChangeSize(CGRect rect, CGSize size)
//{ return CGRectMake(rect.origin.x, rect.origin.y, size.width, size.height); }
//
//CG_INLINE CGRect CGRectChangeWidth(CGRect rect, CGFloat width)
//{ return CGRectMake(rect.origin.x, rect.origin.y, width, rect.size.height); }
//
//CG_INLINE CGRect CGRectChangeHeight(CGRect rect, CGFloat height)
//{ return CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, height); }
//
//CG_INLINE CGRect CGRectChangeOrigin(CGRect rect, CGPoint origin)
//{ return CGRectMake(origin.x, origin.y, rect.size.width, rect.size.height); }
//
//CG_INLINE CGRect CGRectChangeY(CGRect rect, CGFloat y)
//{ return CGRectMake(rect.origin.x, y, rect.size.width, rect.size.height); }
//
//CG_INLINE CGRect CGRectChangeX(CGRect rect, CGFloat x)
//{ return CGRectMake(x, rect.origin.y, rect.size.width, rect.size.height); }
//
//CG_INLINE CGRect CGRectMakeFromOriginAndSize(CGPoint origin, CGSize size)
//{ return CGRectMake(origin.x, origin.y, size.width, size.height); }
//
//CG_INLINE CGSize CGSizeAspectFit(CGSize parentSize, CGSize childSize)
//{
//    return (parentSize.width / parentSize.height > childSize.width / childSize.height) ?
//    CGSizeMake(childSize.width * parentSize.height / childSize.height, parentSize.height) :
//    CGSizeMake(parentSize.width, childSize.height * parentSize.width / childSize.width);
//}
//
//CG_INLINE CGSize CGSizeAspectFill(CGSize parentSize, CGSize childSize)
//{
//    return (parentSize.width / parentSize.height > childSize.width / childSize.height) ?
//    CGSizeMake(parentSize.width, childSize.height * parentSize.width / childSize.width) :
//    CGSizeMake(childSize.width * parentSize.height / childSize.height, parentSize.height);
//}
//
//CG_INLINE CGRect CGRectAspectFit(CGRect parentRect, CGSize childSize)
//{
//    CGSize resultSize = CGSizeAspectFit(parentRect.size, childSize);
//    CGPoint resultOrigin = CGPointMake(parentRect.origin.x + (parentRect.size.width - resultSize.width) / 2.0,
//                                       parentRect.origin.y + (parentRect.size.height - resultSize.height) / 2.0);
//    return CGRectMakeFromOriginAndSize(resultOrigin, resultSize);
//}
//
//CG_INLINE CGRect CGRectAspectFill(CGRect parentRect, CGSize childSize)
//{
//    CGSize resultSize = CGSizeAspectFill(parentRect.size, childSize);
//    CGPoint resultOrigin = CGPointMake(parentRect.origin.x + (parentRect.size.width - resultSize.width) / 2.0,
//                                       parentRect.origin.y + (parentRect.size.height - resultSize.height) / 2.0);
//    return CGRectMakeFromOriginAndSize(resultOrigin, resultSize);
//}
//
//CG_INLINE CGSize CGSizeChangeHeigth(CGSize size, CGFloat height)
//{ return CGSizeMake(size.width, height); }
//
//CG_INLINE CGSize CGSizeChangeWidth(CGSize size, CGFloat width)
//{ return CGSizeMake(width, size.height); }






CG_INLINE CGRect FCCGRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height);



/*** Definitions of inline functions. ***/

/**
 适配操作注意参数需1080*1920的数据

 @param x x坐标
 @param y y坐标
 @param width 宽
 @param height 高
 @return <#return value description#>
 */
CG_INLINE CGRect
FCCGRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
    CGRect rect;
    
    rect.origin.x = x*fit; rect.origin.y = y*fit;
    rect.size.width = width*fit; rect.size.height = height*fit;
    return rect;
}


#endif /* RectUtils_h */
