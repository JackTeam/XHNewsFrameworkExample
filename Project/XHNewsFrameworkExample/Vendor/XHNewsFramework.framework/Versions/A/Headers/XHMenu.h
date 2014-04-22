//
//  XHMenu.h
//  XHScrollMenu
//
//  Created by 曾 宪华 on 14-3-8.
//  Copyright (c) 2014年 曾宪华 QQ群: (142557668) QQ:543413507  Gmail:xhzengAIB@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XHMenu : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIColor *titleNormalColor;
@property (nonatomic, strong) UIColor *titleSelectedColor;
@property (nonatomic, strong) UIColor *titleHighlightedColor;

@property (nonatomic, strong) UIImage *normalImage;
@property (nonatomic, strong) UIImage *hightlightedImage;
@property (nonatomic, strong) UIImage *selectedImage;

@property (nonatomic, copy) NSString *dataSourcesStringUrl;
@property (nonatomic, strong) NSMutableArray *dataSources;


@end
