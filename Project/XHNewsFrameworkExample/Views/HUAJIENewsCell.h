//
//  HUAJIENewsCell.h
//  HUAJIENewsiPhoneSDK
//
//  Created by 曾 宪华 on 14-3-7.
//  Copyright (c) 2014年 曾宪华 QQ群: (142557668) QQ:543413507  Gmail:xhzengAIB@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#define lightGreyColor [UIColor colorWithRed:80.0f/255.0f green:80.0f/255.0f  blue:80.0f/255.0f  alpha:1.0f]

#define cccColor [UIColor colorWithRed:236.0/255.0f green:238.0/255.0f blue:239.0/255.0f alpha:1.0f]


@interface HUAJIENewsCell : UITableViewCell

//新闻缩略图
@property (nonatomic, strong) UIImageView *newsThumb;

//新闻标题
@property (nonatomic, strong) UILabel *newsTitle;

@property (nonatomic, strong) UILabel *newsDescriptionLabel;

//新闻发表时间
@property (nonatomic, strong) UILabel *newsPublishDate;

// 新闻的赞
@property (nonatomic, strong) UILabel *newsLike;

// 新闻的评论
@property (nonatomic, strong) UILabel *newsComment;

@end
