//
//  XHColumnItemView.h
//  XHNewsFramework
//
//  Created by 曾 宪华 on 14-1-27.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XHColumnItemView;
@protocol XHColumnItemViewDelegate <NSObject>

- (void)didSelected:(XHColumnItemView *)columnItemView;

@end

@class XHMenu;
@interface XHColumnItemView : UIView
@property (nonatomic, strong) XHMenu *item;
@property (nonatomic, assign) id <XHColumnItemViewDelegate> delegate;
- (id)initWithFrame:(CGRect)frame target:(id)target action:(SEL)action isTapHandle:(BOOL)isTap;
@end
