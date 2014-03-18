//
//  XHColumnItemManagerViewController.h
//  XHNewsFramework
//
//  Created by 曾 宪华 on 14-1-26.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XHColumnItemManagerViewController;
@protocol XHColumnItemManagerViewControllerDelegate <NSObject>

- (void)managerDidFinish:(XHColumnItemManagerViewController *)columnItemManagerViewController;

@end

@interface XHColumnItemManagerViewController : UIViewController
@property (nonatomic, assign) id <XHColumnItemManagerViewControllerDelegate> delegate;
@property (nonatomic, strong) NSArray *subscribed; // 已经订阅分类
@property (nonatomic, strong) NSArray *unSubscribed; // 在本地或者网络搜索回来的未订阅分类
@end
