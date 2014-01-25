//
//  XHItem.h
//  XHItemScrollToolBar
//
//  Created by 曾 宪华 on 14-1-23.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XHItemView;
typedef void(^XHItemSelectedBlcok)(XHItemView *itemView);

@interface XHItem : NSObject
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, readonly) UIImage *selectedImage;
@property (nonatomic, readonly) UIImage *normalImage;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) XHItemSelectedBlcok itemSelectedCompled;

- (instancetype)initWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage title:(NSString *)title itemSelectedBlcok:(XHItemSelectedBlcok)itemSelectedCompled;

@end
