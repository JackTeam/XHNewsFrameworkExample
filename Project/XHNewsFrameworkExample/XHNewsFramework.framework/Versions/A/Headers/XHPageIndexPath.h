//
//  XHPageIndexPath.h
//  XHNewsFramework
//
//  Created by 曾 宪华 on 14-1-24.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XHPageIndexPath : NSObject
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger row;
@property (nonatomic, assign) NSInteger section;

- (instancetype)initWithPage:(NSInteger)page row:(NSInteger)row section:(NSInteger)section;
+ (instancetype)panelIndexPathForPage:(NSInteger)page row:(NSInteger)row section:(NSInteger)section ;
+ (id)panelIndexPathForPage:(NSInteger)page indexPath:(NSIndexPath*)indexPath;
@end
