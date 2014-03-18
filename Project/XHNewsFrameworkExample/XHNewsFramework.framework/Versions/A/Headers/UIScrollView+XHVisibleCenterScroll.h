//
//  UIScrollView+XHVisibleCenterScroll.h
//  XHScrollMenu
//
//  Created by 曾 宪华 on 14-3-9.
//  Copyright (c) 2014年 曾宪华 QQ群: (142557668) QQ:543413507  Gmail:xhzengAIB@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (XHVisibleCenterScroll)

- (void)scrollRectToVisibleCenteredOn:(CGRect)visibleRect
                             animated:(BOOL)animated;

@end
