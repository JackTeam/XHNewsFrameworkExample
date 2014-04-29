//
//  XHDataStoreManager.h
//  XHNewsFrameworkExample
//
//  Created by qtone-1 on 14-4-29.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XHNewsModel.h"

@interface XHDataStoreManager : NSObject

+ (instancetype)shareDataStoreManager;

- (void)loadNetDataSourceWithPagesize:(NSInteger)pagesize pageNumber:(NSInteger)pageNumber compledBlock:(void (^)(NSMutableArray *datas))compled;

@end
