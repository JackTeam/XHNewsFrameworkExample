//
//  XHFriendlyLoadingView.h
//  XHFriendlyLoadingView
//
//  Created by 曾 宪华 on 13-12-31.
//  Copyright (c) 2013年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ReloadButtonClickedCompleted)(UIButton *sender);

@interface XHFriendlyLoadingView : UIView
@property (nonatomic, copy) ReloadButtonClickedCompleted reloadButtonClickedCompleted;

+ (instancetype)shareFriendlyLoadingView;

- (void)showFriendlyLoadingViewWithText:(NSString *)text loadingAnimated:(BOOL)animated;

/**
 * 隐藏页面加载动画及信息提示
 */
- (void)hideLoadingView;

/**
 * 重新加载提示
 * @param reloadString 要显示的提示字符串
 */
- (void)showReloadViewWithText:(NSString *)reloadString;

@end
