//
//  XHItemScrollToolBar.h
//  XHItemScrollToolBar
//
//  Created by 曾 宪华 on 14-1-23.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XHItemView.h"

#define kXHItemScrollToolBarHeight 30

@interface XHItemScrollToolBar : UIScrollView
@property (nonatomic, strong) NSArray *itemViews;
@property (nonatomic, strong) NSArray *items; // dataSources
@property (nonatomic, assign) CGFloat itemWidth; // default is CGRectGetWidth([[UIScreen mainScreen] bounds]) / 5.0;
@property (nonatomic, assign) CGFloat itemPaddingX; // default is 0
@property (nonatomic, assign) CGFloat itemPaddingY; // default is 0
@property (nonatomic, assign) NSInteger selectIndex; // default is 0

- (CGPoint)centerForSelectedItemAtIndex:(NSUInteger)index;
- (CGPoint)contentOffsetForSelectedItemAtIndex:(NSUInteger)index;

- (void)reloadData;

@end
