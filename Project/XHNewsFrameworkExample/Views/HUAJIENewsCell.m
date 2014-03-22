//
//  HUAJIENewsCell.m
//  HUAJIENewsiPhoneSDK
//
//  Created by 曾 宪华 on 14-3-7.
//  Copyright (c) 2014年 曾宪华 QQ群: (142557668) QQ:543413507  Gmail:xhzengAIB@gmail.com. All rights reserved.
//

#import "HUAJIENewsCell.h"

@interface HUAJIENewsCell ()

//单元格背景
@property (nonatomic, strong) UIImageView *centerImageView;

@end

@implementation HUAJIENewsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        //设置cell的长度和位置,注意，这个方法覆盖了默认方法
        [self setFrame:self.bounds];
        
        //设置背景
        UIImage *centerImage = [UIImage imageNamed:@"feed_cell_bg@2x.png"];
        //拉伸图片背景，原来如此
        centerImage = [centerImage stretchableImageWithLeftCapWidth:15 topCapHeight:9];
        self.centerImageView = [[UIImageView alloc] initWithImage:centerImage];
        self.backgroundView = self.centerImageView;
        
        //设置高亮状态
        UIImage *centerImage2 = [UIImage imageNamed:@"feed_cell_bg_hl@2x.png"];
        //拉伸图片背景，原来如此
        centerImage2 = [centerImage2 stretchableImageWithLeftCapWidth:15 topCapHeight:9];
        UIImageView *imageView2 = [[UIImageView alloc] initWithImage:centerImage2];
        self.selectedBackgroundView = imageView2;
        
        //缩略图
        self.newsThumb = [UIImageView new];
        self.newsThumb.frame = CGRectMake(8, 5, 110, 90);
        self.newsThumb.image = [UIImage imageNamed:@"列表图片@2x.jpg"];
        [self.contentView addSubview:self.newsThumb];
        
        //新闻标题
        self.newsTitle = [UILabel new];
        self.newsTitle.frame = CGRectMake(self.newsThumb.frame.origin.x + self.newsThumb.frame.size.width + 10, 10, 183, 25);
        self.newsTitle.numberOfLines = 0;
        self.newsTitle.text = @"北京天文馆朱金表示，神十将在明晚7时左右过境北京，天文爱好者可以观看";
        self.newsTitle.textColor = lightGreyColor;
        self.newsTitle.lineBreakMode = NSLineBreakByTruncatingTail;
        self.newsTitle.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        self.newsTitle.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.newsTitle];
        
        self.newsDescriptionLabel = [UILabel new];
        self.newsDescriptionLabel.frame = CGRectMake(self.newsTitle.frame.origin.x, CGRectGetMaxY(self.newsTitle.frame), 183, 40);
        self.newsDescriptionLabel.numberOfLines = 0;
        self.newsDescriptionLabel.text = @"天文爱好者可以观看啊实打实的疯狂哪凉快天文爱好者可以观看啊实打实的疯狂哪凉快天文爱好者可以观看啊实打实的疯狂哪凉快";
        self.newsDescriptionLabel.textColor = lightGreyColor;
        self.newsDescriptionLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        self.newsDescriptionLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
        self.newsDescriptionLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.newsDescriptionLabel];
        
        // 新闻的赞
        self.newsLike = [UILabel new];
        self.newsLike.frame = CGRectMake(130, 80, 33, 14);
        self.newsLike.font = [UIFont fontWithName:@"Arial" size:10];
        self.newsLike.text = @"33赞";
        self.newsLike.textColor = [UIColor grayColor];
        self.newsLike.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.newsLike];
        
        // 新闻的评论
        self.newsComment = [UILabel new];
        self.newsComment.frame = CGRectMake(180, 80, 43, 14);
        self.newsComment.text = @"111评论";
        self.newsComment.font = [UIFont fontWithName:@"Arial" size:10];
        self.newsComment.textColor = [UIColor grayColor];
        self.newsComment.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.newsComment];
        
        //发表时间
        self.newsPublishDate = [UILabel new];
        self.newsPublishDate.frame = CGRectMake(240, 80, 95, 14);
        self.newsPublishDate.font = [UIFont fontWithName:@"Arial" size:10];
        self.newsPublishDate.textColor = [UIColor grayColor];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"YY-MM-dd HH:mm"];
        self.newsPublishDate.text = [dateFormatter stringFromDate:[NSDate date]];
        self.newsPublishDate.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.newsPublishDate];
        
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    
    if (selected)
    {
        //看过之后，新闻标题变灰
        self.newsTitle.textColor = [UIColor grayColor];
    }
    
    [super setSelected:selected animated:animated];
}


- (void)setHighlighted:(BOOL)highlighted
{
    if (highlighted)
    {
        
    }
    // 必须要设置这个，不然高亮背景显示不出来
    [super setHighlighted:highlighted];
}

@end
