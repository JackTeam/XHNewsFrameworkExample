//
//  XHItemScrollToolBar.h
//  XHItemScrollToolBar
//
//  Created by 曾 宪华 on 14-1-23.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XHItemView.h"

#define kXHItemScrollToolBarHeight 44

@interface XHItemScrollToolBar : UIScrollView
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, assign) CGFloat itemWidth;
@property (nonatomic, assign) CGFloat itemPaddingX;
@property (nonatomic, assign) CGFloat itemPaddingY;
@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, strong) UIImage *indicatorImage;
- (void)reloadData;

@end
