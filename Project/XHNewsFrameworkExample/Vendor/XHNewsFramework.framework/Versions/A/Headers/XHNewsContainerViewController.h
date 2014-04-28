//
//  XHNewsContainerViewController.h
//  XHNewsFramework
//
//  Created by 曾 宪华 on 14-1-24.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XHBaseViewController.h"
#import "XHEdittingScrollView.h"
#import "XHContentView.h"

@interface XHNewsContainerViewController : XHBaseViewController <UIScrollViewDelegate, XHContentViewDelegate>


#pragma mark - Custom UI
// top
@property (nonatomic, assign) BOOL isShowTopScrollToolBar; // default is YES
@property (nonatomic, strong) UIImage *topScrollViewToolBarBackgroundImage; // default is nil
@property (nonatomic, strong) UIColor *topScrollViewToolBarBackgroundColor; // default is [UIColor colorWithWhite:0.902 alpha:1.000]
@property (nonatomic, strong) UIImage *managerButtonBackgroundImage; // default is arrow image
@property (nonatomic, strong) UIColor *indicatorColor; // default is redColor
@property (nonatomic, assign) CGFloat topScrollViewToolBarHieght; // default is 36
@property (nonatomic, strong) UIImage *leftShadowImage;
@property (nonatomic, strong) UIImage *rightShadowImage;
@property (nonatomic, assign) BOOL isShowManagerButton; // default is NO

// mid
@property (nonatomic, strong) UIImage *midContentLogoImage; // default is netEase logo
// contentScrollView
@property (nonatomic, strong) UIColor *contentScrollViewBackgroundColor; // default is [UIColor whiteColor]
@property (nonatomic, assign) CGFloat contentViewPaddingX; // default is 0
@property (nonatomic, assign) CGFloat contentViewContentInsetTop; // default is 0
#pragma mark frame and sizes
- (CGRect)scrollViewFrame;
- (CGSize)contentViewSize;
#pragma mark - scroll the contentView
- (void)goToContentView:(NSInteger)index;


#pragma mark - DataSource
@property (nonatomic, assign) int currentPage;
@property (nonatomic, assign) int lastDisplayedPage;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSArray *unItems;
- (NSInteger)numberOfVisibleContentViews;
- (NSInteger)numberOfContentViews;
- (void)reloadDataSource;


#pragma mark - Reuse
- (XHContentView *)dequeueReusablePageWithIdentifier:(NSString*)identifier;
- (XHContentView *)contentViewAtPage:(NSInteger)page;


#pragma mark - Custom Action
// 管理menu item的按钮事件，由你自己发挥
- (void)didOpenManagerItems;

#pragma mark - 手势冲突解决
@property (nonatomic, assign) BOOL enableSideMenu; // default is YES
// 用于解决手势冲突的问题，内部已经解决细节的问题，只需要直接传递就可以，因为内部判断好了向左还是向右，
- (void)receiveScrollViewPanGestureRecognizerHandle:(UIPanGestureRecognizer *)scrollViewPanGestureRecognizer;

@end
