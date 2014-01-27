//
//  XHNeteaseNewsViewController.m
//  XHNewsFrameworkExample
//
//  Created by 曾 宪华 on 14-1-24.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import "XHNeteaseNewsViewController.h"
#import <XHNewsFramework/XHItemView.h>
#import <XHNewsFramework/XHFountionCommon.h>

@interface XHNeteaseNewsViewController ()
@end

@implementation XHNeteaseNewsViewController

- (id)init {
	if (self = [super init]) {
        NSMutableArray *items = [NSMutableArray new];
        NSMutableArray *unItems = [NSMutableArray new];
        __weak typeof(self) weakSelf = self;
        int numberOfPanels = 20;
        for (int i = 0; i < numberOfPanels; i++) {
            XHItem *item = [[XHItem alloc] initWithNormalImage:nil selectedImage:nil title:[NSString stringWithFormat:@"Title%d", i] itemSelectedBlcok:^(XHItemView *itemView) {
                NSInteger index = itemView.item.index;
                NSLog(@"index : %d", index);
                [weakSelf goToContentView:index];
            }];
            
            NSMutableArray *rows = [NSMutableArray array];
            int numberOfRows = 100;
            for (int j = 0; j < numberOfRows; j++) {
                [rows addObject:@""];
            }
            item.dataSources = rows;
            
            [items addObject:item];
        }
        self.items = items;
        
        for (int i = 20; i < numberOfPanels + 20; i++) {
            XHItem *item = [[XHItem alloc] initWithNormalImage:nil selectedImage:nil title:[NSString stringWithFormat:@"Title%d", i] itemSelectedBlcok:^(XHItemView *itemView) {
                NSInteger index = itemView.item.index;
                NSLog(@"index : %d", index);
                [weakSelf goToContentView:index];
            }];
            
            NSMutableArray *rows = [NSMutableArray array];
            int numberOfRows = 100;
            for (int j = 0; j < numberOfRows; j++) {
                [rows addObject:@""];
            }
            item.dataSources = rows;
            
            [unItems addObject:item];
        }
        self.unItems = items;
    }
	return self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBarTintColor:)])
        [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark contentViews delegate/datasource

- (NSInteger)numberOfContentViews {
	int numberOfPanels = [self.items count];
	[self setTitle:[NSString stringWithFormat:@"%i contentView(s)", numberOfPanels]];
	
	return numberOfPanels;
}

- (NSInteger)contentView:(XHContentView *)contentView numberOfRowsInPage:(NSInteger)page section:(NSInteger)section {
    XHItem *item = [self.items objectAtIndex:page];
	return [item.dataSources count];
}

- (UITableViewCell *)contentView:(XHContentView *)contentView cellForRowAtIndexPath:(XHPageIndexPath *)indexPath {
	static NSString *identity = @"UITableViewCell";
	UITableViewCell *cell = (UITableViewCell*)[contentView.tableView dequeueReusableCellWithIdentifier:identity];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
	}
	[[cell textLabel] setText:[NSString stringWithFormat:@"contentView %i section %i row %i", indexPath.page, indexPath.section, indexPath.row+1]];
	return cell;
}

- (void)contentView:(XHContentView *)contentView didSelectRowAtIndexPath:(XHPageIndexPath *)indexPath {
	NSLog(@"row : %d section : %d  page : %d", indexPath.row, indexPath.section, indexPath.page);
    [XHFountionCommon setOfflineProgress:indexPath.row / 10.0];
}

- (XHContentView *)contentViewForPage:(NSInteger)page {
	static NSString *identifier = @"XHContentView";
	XHContentView *contentView = (XHContentView *)[self dequeueReusablePageWithIdentifier:identifier];
	if (contentView == nil) {
		contentView = [[XHContentView alloc] initWithIdentifier:identifier];
	}
	return contentView;
}

@end
