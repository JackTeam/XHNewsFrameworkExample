//
//  XHContentView.h
//  XHNewsFramework
//
//  Created by 曾 宪华 on 14-1-24.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XHPageIndexPath.h"

@class XHContentView;
@protocol XHContentViewDelegate <NSObject>
- (NSInteger)contentView:(XHContentView *)contentView numberOfRowsInPage:(NSInteger)page section:(NSInteger)section;
- (UITableViewCell *)contentView:(XHContentView *)contentView cellForRowAtIndexPath:(XHPageIndexPath *)indexPath;
@optional
- (void)contentView:(XHContentView *)contentView didSelectRowAtIndexPath:(XHPageIndexPath *)indexPath;
- (CGFloat)contentView:(XHContentView *)contentView heightForRowAtIndexPath:(XHPageIndexPath *)indexPath;
- (NSInteger)contentView:(XHContentView *)contentView numberOfSectionsInPage:(NSInteger)pageNumber;
- (NSString*)contentView:(XHContentView *)contentView titleForHeaderInPage:(NSInteger)pageNumber section:(NSInteger)section;
- (UIView *)contentView:(XHContentView *)contentView viewForHeaderInPage:(NSInteger)pageNumber section:(NSInteger)section;
- (void)contentView:(XHContentView *)contentView didScroll:(UIScrollView *)scrollView;
- (CGFloat)contentView:(XHContentView *)contentView heightForHeaderInSection:(NSInteger)section;
@end

@protocol XHContentViewRefreshingDelegate <NSObject>

- (void)pullDownRefreshingAction:(XHContentView *)contentView;
- (void)pullUpRefreshingAction:(XHContentView *)contentView;

@end

@interface XHContentView : UIView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) CGFloat transitionDuration; // default is 0.4
@property (nonatomic, assign) CGFloat tableViewContentInsetTop;
@property (nonatomic, assign) NSInteger pageNumber;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, unsafe_unretained) id <XHContentViewDelegate> delegate;
@property (nonatomic, unsafe_unretained) id <XHContentViewRefreshingDelegate> refreshControlDelegate;
@property (nonatomic, copy) NSString *identifier;

@property (nonatomic, assign) BOOL pullDownRefreshed; // default is NO
@property (nonatomic, assign) BOOL pullUpRefreshed; // default is NO

#pragma mark init
- (id)initWithIdentifier:(NSString *)identifier;

#pragma mark reset
- (void)reset;

#pragma mark view state
- (void)pageWillAppear;
- (void)pageDidAppear;
- (void)pageWillDisappear;

#pragma mark animation
- (CGAffineTransform)transformForOrientation;
- (void)showContentView:(BOOL)show animated:(BOOL)animated;
- (void)shouldWiggle:(BOOL)wiggle;

#pragma mark offset save/restore
@property (nonatomic, assign) BOOL restored; // default is NO
- (void)saveTableviewOffset;
- (void)restoreTableviewOffset;
- (void)removeTableviewOffset;

#pragma mark add and remove panels
- (void)addContentViewWithAnimation:(BOOL)animate;
- (void)removeContentViewWithAnimation:(BOOL)animate;

#pragma mark page controll
- (void)showNextContentView;
- (void)showPreviousContentView;

#pragma mark - 刷新的
- (void)endPullDownRefreshing;
- (void)endPullUpRefreshing;

@end
