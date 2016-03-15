//
//  XHNetNewsCell.m
//  XHNewsFrameworkExample
//
//  Created by qtone-1 on 14-4-29.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
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
