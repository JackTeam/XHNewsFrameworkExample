//
//  XHHTTPClient.h
//  XHOperationNetworkKit
//
//  Created by 曾 宪华 on 14-1-4.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#import "XHOperationNetworkKit.h"

#define XHHTTPClientTimeoutInterval 30

static NSString *const pailixiuHomeURL = @"http://www.pailixiu.com";

@interface XHHTTPClient : XHOperationNetworkKit

+ (void)GETPath:(NSString *)urlString parameters:(NSDictionary *)parameters jsonSuccessHandler:(XHJSONSuccessHandler)jsonSuccessHandler
failureHandler:(XHHTTPFailureHandler)failureHandler;

+ (void)POSTPath:(NSString *)urlString parameters:(NSDictionary *)parameters jsonSuccessHandler:(XHJSONSuccessHandler)jsonSuccessHandler
failureHandler:(XHHTTPFailureHandler)failureHandler;

+ (void)DELETEPath:(NSString *)urlString parameters:(NSDictionary *)parameters jsonSuccessHandler:(XHJSONSuccessHandler)jsonSuccessHandler
    failureHandler:(XHHTTPFailureHandler)failureHandler;


@end
