//
//  HUAJIEPageControl.h
//  HUAJIENewsiPhoneSDK
//
//  Created by 曾 宪华 on 14-3-16.
//  Copyright (c) 2014年 曾宪华 QQ群: (142557668) QQ:543413507  Gmail:xhzengAIB@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DidSelectDotAtIndex)(NSUInteger dotIndex);

@interface XHPageControl : UIView

@property (nonatomic, copy) DidSelectDotAtIndex didSelectDotAtIndex;
@property (nonatomic, strong) UIImage *normalDotImage;
@property (nonatomic, strong) UIImage *highlightedDotImage;
@property (nonatomic, assign) NSUInteger pageNumbers; // degault is 3
@property (nonatomic, assign) NSInteger currentSelectedIndex; // default is 0
@property (nonatomic, assign) CGSize dotSize; // default is 6
@property (nonatomic, assign) CGFloat dotPadding; // default is 6
@property (nonatomic, assign) NSTimeInterval animationDuration; // default is 0

- (void)reloadData;

@end
