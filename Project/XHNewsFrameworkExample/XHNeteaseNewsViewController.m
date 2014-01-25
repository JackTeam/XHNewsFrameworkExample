//
//  XHNeteaseNewsViewController.m
//  XHNewsFrameworkExample
//
//  Created by 曾 宪华 on 14-1-24.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import "XHNeteaseNewsViewController.h"
#import <XHNewsFramework/XHItemScrollToolBar.h>
#import <XHNewsFramework/XHFountionCommon.h>


@interface XHNeteaseNewsViewController ()
@property (nonatomic, strong) XHItemScrollToolBar *itemScrollToolBar;
@end

@implementation XHNeteaseNewsViewController

- (XHItemScrollToolBar *)itemScrollToolBar {
    if (!_itemScrollToolBar) {
        _itemScrollToolBar = [[XHItemScrollToolBar alloc] initWithFrame:CGRectMake(0, [XHFountionCommon getAdapterHeight], CGRectGetWidth(self.view.bounds), kXHItemScrollToolBarHeight)];
        _itemScrollToolBar.items = self.items;
        [self.view addSubview:_itemScrollToolBar];
    }
    return _itemScrollToolBar;
}

- (id)init {
	if (self = [super init]) {
        self.contentViewContentInsetTop = kXHItemScrollToolBarHeight;
		_pages = [NSMutableArray new];
        _items = [NSMutableArray new];
        __weak typeof(self) weakSelf = self;
		int numberOfPanels = 10;
		for (int i = 0; i < numberOfPanels; i++) {
			NSMutableArray *rows = [NSMutableArray array];
			int numberOfRows = arc4random() % 100;
			for (int j=0; j < numberOfRows; j++) {
				[rows addObject:@""];
			}
			[self.pages addObject:rows];
            
            XHItem *item = [[XHItem alloc] initWithNormalImage:[UIImage imageNamed:@"tabBar-camera"] selectedImage:[UIImage imageNamed:@"tabBar-camera-on"] title:nil itemSelectedBlcok:^(XHItemView *itemView) {
                NSInteger index = itemView.item.index;
                NSLog(@"index : %d", index);
                [weakSelf goToContentView:index];
            }];
            [self.items addObject:item];
		}
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
    [self.itemScrollToolBar reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark contentViews delegate/datasource

- (NSInteger)numberOfContentViews {
	int numberOfPanels = [self.pages count];
	[self setTitle:[NSString stringWithFormat:@"%i contentView(s)", numberOfPanels]];
	
	return numberOfPanels;
}

- (NSInteger)contentView:(XHContentView *)contentView numberOfRowsInPage:(NSInteger)page section:(NSInteger)section {
	return [[self.pages objectAtIndex:page] count];
}

- (NSString *)contentView:(XHContentView *)contentView titleForHeaderInPage:(NSInteger)pageNumber section:(NSInteger)section {
    return [NSString stringWithFormat:@"Page %i Section %i", pageNumber, section];
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
