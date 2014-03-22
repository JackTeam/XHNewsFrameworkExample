//
//  XHFountionCommon.h
//  XHNewsFramework
//
//  Created by 曾 宪华 on 14-1-24.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define BUNDLE_IMAGE(_file) [UIImage imageWithContentsOfFile:[[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"XHNewsFramework.bundle"] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@%@.png", _file,  ((int)[[UIScreen mainScreen] scale]-1) ? @"@2x" : @""]]]

#ifdef __IPHONE_6_0 // iOS6 and later
#   define UITextAlignmentCenter    NSTextAlignmentCenter
#   define UITextAlignmentLeft      NSTextAlignmentLeft
#   define UITextAlignmentRight     NSTextAlignmentRight
#   define UILineBreakModeTailTruncation     NSLineBreakByTruncatingTail
#   define UILineBreakModeMiddleTruncation   NSLineBreakByTruncatingMiddle
#   define UILineBreakModeCharacterWrap      NSLineBreakByWordWrapping
#endif

#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
#define IF_IOS7_OR_GREATER(...) \
if (kCFCoreFoundationVersionNumber > kCFCoreFoundationVersionNumber_iOS_6_1) \
{ \
__VA_ARGS__ \
}
#else
#define IF_IOS7_OR_GREATER(...)
#endif

@interface XHFountionCommon : NSObject

+ (BOOL)iOS7;

+ (CGFloat)getAdapterHeight;

+ (void)setOfflineProgress:(CGFloat)progress;

@end
