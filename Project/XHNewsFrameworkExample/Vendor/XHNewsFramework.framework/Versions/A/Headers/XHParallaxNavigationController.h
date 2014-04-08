//
//  XHParallaxNavigationController.h
//  iyilunba
//
//  Created by 曾 宪华 on 13-12-4.
//  Copyright (c) 2013年 曾 宪华 开发团队(http://iyilunba.com ). All rights reserved.
//

#import <UIKit/UIKit.h>

// 背景视图起始frame.x
#define startX -200;
@class XHParallaxNavigationController;
typedef void(^ParallaxNavigationControllerMovieBegin)(XHParallaxNavigationController *parallaxNavigationController);
typedef void(^ParallaxNavigationControllerMovieEnd)(XHParallaxNavigationController *parallaxNavigationController);
typedef void(^ParallaxNavigationControllerMovieCancel)(XHParallaxNavigationController *parallaxNavigationController);

@interface XHParallaxNavigationController : UINavigationController
// 静态栏 默认是显示的
@property (nonatomic, assign) BOOL hideStatusBar;
// 默认为特效开启
@property (nonatomic, assign) BOOL canDragBack;
// 默认为毛玻璃不开启
@property (nonatomic, assign) BOOL isBlurry;
// 默认为有背景阴影
@property (nonatomic, assign) BOOL shadowEffect;

@property (nonatomic, copy) ParallaxNavigationControllerMovieBegin parallaxNavigationControllerMovieBegin;
@property (nonatomic, copy) ParallaxNavigationControllerMovieEnd parallaxNavigationControllerMovieEnd;
@property (nonatomic, copy) ParallaxNavigationControllerMovieCancel parallaxNavigationControllerMovieCancel;
@end

@interface UIViewController (XHParallaxNavigationController)
- (void)addParallaxNavigationControllerMovieBegin:(ParallaxNavigationControllerMovieBegin)parallaxNavigationControllerMovieBegin;
- (void)addParallaxNavigationControllerMovieEnd:(ParallaxNavigationControllerMovieEnd)parallaxNavigationControllerMovieEnd;
- (void)addParallaxNavigationControllerMovieCancel:(ParallaxNavigationControllerMovieCancel)parallaxNavigationControllerMovieCancel;
- (XHParallaxNavigationController *)xh_parallaxNavigationController;
@end