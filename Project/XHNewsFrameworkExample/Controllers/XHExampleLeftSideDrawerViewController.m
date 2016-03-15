//
//  XHExampleLeftSideDrawerViewController.m
//  XHDrawerController
//
//  Created by 曾 宪华 on 13-12-27.
//  Copyright (c) 2013年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import "XHExampleLeftSideDrawerViewController.h"

@interface XHExampleLeftSideDrawerViewController ()

@end

@implementation XHExampleLeftSideDrawerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    CGRect tableViewFrame = self.tableView.frame;
    tableViewFrame.origin.y = 95;
    tableViewFrame.origin.x = 40;
    tableViewFrame.size.height = 377;
    self.tableView.frame = tableViewFrame;
    [self.view addSubview:self.tableView];
    // test github
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
