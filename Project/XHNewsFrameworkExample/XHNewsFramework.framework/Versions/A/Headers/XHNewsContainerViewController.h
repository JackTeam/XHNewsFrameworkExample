//
//  XHNewsContainerViewController.h
//  XHNewsFramework
//
//  Created by 曾 宪华 on 14-1-24.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XHEdittingScrollView.h"
#import "XHContentView.h"

@interface XHNewsContainerViewController : UIViewController <UIScrollViewDelegate, XHContentViewDelegate>

@property (nonatomic, assign) CGFloat contentViewPaddingX; // default is 0
@property (nonatomic, assign) CGFloat contentViewContentInsetTop; // default is 0
@property (nonatomic, assign) int currentPage;
@property (nonatomic, assign) int lastDisplayedPage;
@property (nonatomic, assign) BOOL isEditing; // default is NO

@property (nonatomic, strong) NSArray *items;

- (XHContentView *)dequeueReusablePageWithIdentifier:(NSString*)identifier;
- (XHContentView *)contentViewAtPage:(NSInteger)page;

#pragma mark editing
- (void)setEditing:(BOOL)isEditing;
- (void)shouldWiggle:(BOOL)wiggle;

#pragma mark frame and sizes
- (CGRect)scrollViewFrame;
- (CGSize)contentViewSize;
- (NSInteger)numberOfVisibleContentViews;

#pragma mark adding and removing page
- (void)addPage;
- (void)removeCurrentPage;
- (void)removeContentOfPage:(NSInteger)page;
- (void)pushNextPage;
- (void)jumpToPreviousPage;

- (NSInteger)numberOfContentViews;

- (void)goToContentView:(NSInteger)index;

@end
