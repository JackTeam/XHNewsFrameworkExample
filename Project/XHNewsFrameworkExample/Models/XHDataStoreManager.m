//
//  XHDataStoreManager.m
//  XHNewsFrameworkExample
//
//  Created by qtone-1 on 14-4-29.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import "XHDataStoreManager.h"
#import <XHNewsFramework/XHOperationNetworkKit.h>

@interface XHDataStoreManager ()

@property (nonatomic) dispatch_queue_t dueJSONDataQueue;

@end

@implementation XHDataStoreManager
@synthesize dueJSONDataQueue = _dueJSONDataQueue;

- (dispatch_queue_t)dueJSONDataQueue {
    if (!_dueJSONDataQueue) {
        _dueJSONDataQueue = dispatch_queue_create("dueJSONDataQueue", NULL);
    }
    return _dueJSONDataQueue;
}

+ (instancetype)shareDataStoreManager {
    static XHDataStoreManager *dataStoreManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataStoreManager = [[XHDataStoreManager alloc] init];
    });
    return dataStoreManager;
}

- (void)exDueJSONDataQueue:(void (^)())queue {
    dispatch_async(self.dueJSONDataQueue, queue);
}

- (void)exMainQueue:(void (^)())queue {
    dispatch_async(dispatch_get_main_queue(), queue);
}

- (void)loadNetDataSourceWithPagesize:(NSInteger)pagesize pageNumber:(NSInteger)pageNumber compledBlock:(void (^)(NSMutableArray *datas))compled {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://bbs.suizhou.com/suizhoudzapi/topiclist.php?type=tops&pageno=1&pagesize=20"]];
    XHOperationNetworkKit *operation = [[XHOperationNetworkKit alloc] initWithRequest:request jsonSuccessHandler:^(id json) {
        if ([[json valueForKey:@"code"] integerValue] == 200) {
            [self exDueJSONDataQueue:^{
                NSArray *dataDictionarys = [json valueForKey:@"datas"];
                NSLog(@"dataDictionarys : %@", dataDictionarys);
                
                if ([dataDictionarys isKindOfClass:[NSArray class]]) {
                    NSMutableArray *datas = [NSMutableArray arrayWithCapacity:dataDictionarys.count];
                    for (NSDictionary *dictionary in dataDictionarys) {
                        XHNewsModel *newsModel = [[XHNewsModel alloc] initWithDictionary:dictionary];
                        [datas addObject:newsModel];
                    }
                    compled(datas);
                }
            }];
        }
    } failureHandler:^(NSData *responseData, NSURLResponse *response, NSError *error) {
        NSLog(@"error : %@", error);
    }];
    [[XHOperationNetworkKit queue] addOperation:operation];
}

@end
