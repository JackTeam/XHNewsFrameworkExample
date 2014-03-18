//
//  HUAJIEScrollBannerView.h
//  HUAJIENewsiPhoneSDK
//
//  Created by 曾 宪华 on 14-3-16.
//  Copyright (c) 2014年 曾宪华 QQ群: (142557668) QQ:543413507  Gmail:xhzengAIB@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kHUAJIEFocusLabelWidth 240
#define kHUAJIEFocusLabelHeight 35

typedef NSUInteger(^TotalPagesCount)(void);
typedef UIView *(^FetchContentViewAtIndex)(NSUInteger pageIndex);
typedef void(^DidSelectCompled)(NSUInteger selectIndex);
typedef NSString *(^FetchFocusTitle)(NSUInteger pageIndex);

@interface XHScrollBannerView : UIView <UIScrollViewDelegate>

@property (nonatomic , readonly) UIScrollView *scrollView;

// 数据源：获取总的page个数
@property (nonatomic , copy) TotalPagesCount totalPagesCount;

// 数据源：获取第pageIndex个位置的contentView
@property (nonatomic , copy) FetchContentViewAtIndex fetchContentViewAtIndex;

// 数据源：获取第pageIndex个位置的焦点标题
@property (nonatomic, copy) FetchFocusTitle fetchFocusTitle;

// 当点击的时候，执行的block
@property (nonatomic , copy) DidSelectCompled didSelectCompled;

@property (nonatomic, assign) NSTimeInterval animationDuration;

- (id)initWithFrame:(CGRect)frame;
- (id)initWithFrame:(CGRect)frame animationDuration:(NSTimeInterval)animationDuration;

@end
