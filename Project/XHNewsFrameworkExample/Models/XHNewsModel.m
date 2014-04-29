//
//  XHNewsModel.m
//  XHNewsFrameworkExample
//
//  Created by qtone-1 on 14-4-29.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import "XHNewsModel.h"

@implementation XHNewsModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = [dictionary valueForKey:@"title"];
        self.summary = [dictionary valueForKey:@"summary"];
        self.pic = [dictionary valueForKey:@"pic"];
    }
    return self;
}

@end
