//
//  XHProgressStatusBar.h
//  XHNewsFramework
//
//  Created by 曾 宪华 on 14-1-26.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ProgressStatusBarCloseBlock)(void);
@interface XHProgressStatusBar : UIWindow {
    
}

@property (nonatomic, strong) UILabel     *loadingLabel;
@property (nonatomic, strong) UIView      *loadingView;
@property (nonatomic, strong) UIImageView *flashView;
@property (nonatomic, strong) UIButton    *closeButton;
@property (nonatomic, strong) NSTimer     *timer;
@property (nonatomic, copy) ProgressStatusBarCloseBlock progressStatusBarCloseCompled;

@property (nonatomic, assign) CGFloat progress;

/*
 * progress: [0, 1]
 */
- (void)setProgress:(CGFloat)progress;
- (void)setLoadingMsg:(NSString *)msg;
- (void)show;
- (void)hide;

@end
