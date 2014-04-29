//
//  XHNetNewsCell.m
//  XHNewsFrameworkExample
//
//  Created by qtone-1 on 14-4-29.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import "XHNetNewsCell.h"

@implementation XHNetNewsCell

- (void)setNewsModel:(XHNewsModel *)newsModel {
    self.newsTitle.text = newsModel.title;
    self.newsDescriptionLabel.text = newsModel.summary;
    
    self.newsThumb.image = [UIImage imageNamed:@"列表图片"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:newsModel.pic]];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               self.newsThumb.image = [UIImage imageWithData:data];
                           }];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
