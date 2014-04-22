//
//  XHNeteaseNewsViewController.m
//  XHNewsFrameworkExample
//
//  Created by 曾 宪华 on 14-1-24.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import "XHNeteaseNewsViewController.h"
#import <XHNewsFramework/XHMenu.h>
#import <XHNewsFramework/XHNewsDetail.h>
#import <XHNewsFramework/XHScrollBannerView.h>

#import "HUAJIENewsCell.h"
#import "HUAJIEBannerView.h"

@interface XHNeteaseNewsViewController () <XHContentViewRefreshingDelegate>

@property (nonatomic, strong) NSMutableArray *bannerViews;
@property (nonatomic, strong) XHScrollBannerView *scrollBannerView;

@end

@implementation XHNeteaseNewsViewController

#pragma mark - Action

- (void)rightOpened {
    [self.sideMenuViewController presentRightViewController];
}

- (void)leftOpened {
    [self.sideMenuViewController presentMenuViewController];
}

- (void)receiveScrollViewPanGestureRecognizerHandle:(UIPanGestureRecognizer *)scrollViewPanGestureRecognizer {
    [self.sideMenuViewController panGestureRecognized:scrollViewPanGestureRecognizer];
}

#pragma mark - Perprotys

- (NSMutableArray *)bannerViews {
    if (!_bannerViews) {
        _bannerViews = [[NSMutableArray alloc] init];
        [_bannerViews addObject:[[HUAJIEBannerView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.scrollBannerView.bounds), CGRectGetHeight(self.scrollBannerView.bounds))]];
        [_bannerViews addObject:[[HUAJIEBannerView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.scrollBannerView.bounds), CGRectGetHeight(self.scrollBannerView.bounds))]];
        [_bannerViews addObject:[[HUAJIEBannerView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.scrollBannerView.bounds), CGRectGetHeight(self.scrollBannerView.bounds))]];
        [_bannerViews addObject:[[HUAJIEBannerView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.scrollBannerView.bounds), CGRectGetHeight(self.scrollBannerView.bounds))]];
        [_bannerViews addObject:[[HUAJIEBannerView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.scrollBannerView.bounds), CGRectGetHeight(self.scrollBannerView.bounds))]];
        [_bannerViews addObject:[[HUAJIEBannerView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.scrollBannerView.bounds), CGRectGetHeight(self.scrollBannerView.bounds))]];
    }
    return _bannerViews;
}

- (XHScrollBannerView *)scrollBannerView {
    if (!_scrollBannerView) {
        __weak typeof(self) weakSelf = self;
        _scrollBannerView = [[XHScrollBannerView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 200) animationDuration:3.0f];
        self.scrollBannerView.totalPagesCount = ^NSUInteger(void){
            return weakSelf.bannerViews.count;
        };
        self.scrollBannerView.fetchContentViewAtIndex = ^UIView *(NSUInteger pageIndex){
            return weakSelf.bannerViews[pageIndex];
        };
        self.scrollBannerView.fetchFocusTitle = ^NSString *(NSUInteger pageIndex) {
            if (pageIndex == 0) {
                return @"我是皇上，你想怎样？";
            } else if (pageIndex == 1) {
                return @"我是王子，那你又想怎样？";
            } else if (pageIndex == 2) {
                return @"我是Jack，那你还想怎样？";
            } else {
                return @"我管你是谁，我就是仿网易新闻";
            }
        };
        _scrollBannerView.didSelectCompled = ^(NSUInteger selectIndex) {
            NSLog(@"selectIndex : %d", selectIndex);
        };
    }
    return _scrollBannerView;
}
#pragma mark - Life cycle

- (void)loadDataSource {
    NSMutableArray *items = [NSMutableArray new];
    NSMutableArray *unItems = [NSMutableArray new];
    int numberOfPanels = 15;
    for (int i = 0; i < numberOfPanels; i++) {
        XHMenu *item = [[XHMenu alloc] init];
        NSString *title;
        switch (i) {
            case 0:
                title = @"头条";
                break;
            case 1:
                title = @"热点新闻";
                break;
            case 2:
                title = @"原创";
                break;
            case 3:
                title = @"汽车";
                break;
            case 4:
                title = @"CBA";
                break;
            case 5:
                title = @"NBA";
                break;
            case 6:
                title = @"热点新闻";
                break;
            case 8:
                title = @"房产";
                break;
            case 9:
                title = @"新闻热点";
                break;
            default:
                title = @"热点";
                break;
        }
        item.title = title;
        item.titleNormalColor = [UIColor colorWithWhite:0.141 alpha:1.000];
        item.titleFont = [UIFont boldSystemFontOfSize:16];
        
        XHMenu *unItem = [[XHMenu alloc] init];
        unItem.title = [NSString stringWithFormat:@"Title%d", i + numberOfPanels];
        unItem.titleNormalColor = [UIColor colorWithWhite:0.141 alpha:1.000];
        unItem.titleFont = [UIFont boldSystemFontOfSize:16];
        
        NSMutableArray *rows = [NSMutableArray array];
        int numberOfRows = 10;
        for (int j = 0; j < numberOfRows; j++) {
            XHNewsDetail *newsDetail = [[XHNewsDetail alloc] init];
            newsDetail.newsTitle = @"新浪微博被收购";
            newsDetail.newsContent = @"不知道为什么，就这样被收购了，可能是还没有发挥创新吧！";
            [rows addObject:newsDetail];
        }
        item.dataSources = rows;
        unItem.dataSources = rows;
        
        [items addObject:item];
        
        [unItems addObject:unItem];
    }
    self.items = items;
    self.unItems = unItems;
}

- (id)init {
    self = [super init];
	if (self) {
        // custom UI
        /*
         self.topScrollViewToolBarBackgroundColor = [UIColor colorWithRed:0.362 green:0.555 blue:0.902 alpha:1.000];
         self.leftShadowImage = [UIImage imageNamed:@"leftShadow"];
         self.rightShadowImage = [UIImage imageNamed:@"rightShadow"];
         self.indicatorColor = [UIColor colorWithRed:0.219 green:0.752 blue:0.002 alpha:1.000];
         self.managerButtonBackgroundImage = [UIImage imageNamed:@"managerMenuButton"];
         
         self.midContentLogoImage = [UIImage imageNamed:@"logo"];
         self.contentScrollViewBackgroundColor = [UIColor colorWithRed:1.000 green:0.724 blue:0.640 alpha:1.000];
         */
        
        [self loadDataSource];
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
    
    if ([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)])
        self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"网易新闻";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Left" style:UIBarButtonItemStyleBordered target:self action:@selector(leftOpened)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Right" style:UIBarButtonItemStyleBordered target:self action:@selector(rightOpened)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - contentView refreshControl delegate

- (void)pullDownRefreshingAction:(XHContentView *)contentView {
    [contentView performSelector:@selector(endPullDownRefreshing) withObject:nil afterDelay:3];
}

- (void)pullUpRefreshingAction:(XHContentView *)contentView {
    [contentView performSelector:@selector(endPullUpRefreshing) withObject:nil afterDelay:3];
}

#pragma mark contentViews delegate/datasource

- (NSInteger)numberOfContentViews {
	int numberOfPanels = [self.items count];
	return numberOfPanels;
}

- (NSInteger)contentView:(XHContentView *)contentView numberOfRowsInPage:(NSInteger)page section:(NSInteger)section {
    XHMenu *item = [self.items objectAtIndex:page];
	return [item.dataSources count];
}

- (UITableViewCell *)contentView:(XHContentView *)contentView cellForRowAtIndexPath:(XHPageIndexPath *)indexPath {
	static NSString *cellIdentifier = @"cellIdentifier";
	HUAJIENewsCell *cell = [contentView.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[HUAJIENewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
	return cell;
}

- (void)contentView:(XHContentView *)contentView didSelectRowAtIndexPath:(XHPageIndexPath *)indexPath {
	NSLog(@"row : %d section : %d  page : %d", indexPath.row, indexPath.section, indexPath.page);
    [super contentView:contentView didSelectRowAtIndexPath:indexPath];
}

- (XHContentView *)contentViewForPage:(NSInteger)page {
	static NSString *identifier = @"XHContentView";
	XHContentView *contentView = (XHContentView *)[self dequeueReusablePageWithIdentifier:identifier];
	if (contentView == nil) {
		contentView = [[XHContentView alloc] initWithIdentifier:identifier];
        contentView.pullDownRefreshed = YES;
        contentView.refreshControlDelegate = self;
	}
    if (!page)
        contentView.tableView.tableHeaderView = self.scrollBannerView;
    else
        contentView.tableView.tableHeaderView = nil;
	return contentView;
}

#pragma mark - UITableView delegate

- (CGFloat)contentView:(XHContentView *)contentView heightForRowAtIndexPath:(XHPageIndexPath *)indexPath {
    return 100;
}

@end
