//
//  HUAJIEBannerView.m
//  HUAJIENewsiPhoneSDK
//
//  Created by 曾 宪华 on 14-3-16.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import "HUAJIEBannerView.h"

@implementation HUAJIEBannerView

- (UIImageView *)focusImageView {
    if (!_focusImageView) {
        _focusImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _focusImageView.contentMode = UIViewContentModeScaleToFill;
        _focusImageView.image = [UIImage imageNamed:@"图片@2x.jpg"];
    }
    return _focusImageView;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self addSubview:self.focusImageView];
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
