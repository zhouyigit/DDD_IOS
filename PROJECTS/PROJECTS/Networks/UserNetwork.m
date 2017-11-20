//
//  UserNetwork.m
//  PROJECTS
//
//  Created by yiyahanyu on 2017/11/20.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//

#import "UserNetwork.h"

@implementation UserNetwork

+(NSURLSessionDataTask *)loginWithParameters:(NSDictionary *)parameters completionHandler:(void (^)(NSURLSessionDataTask * _Nullable, id _Nullable, NSError * _Nullable))handler
{
    NSString *path = @"login";
    return [[self class] GET:path parameters:parameters completionHandler:handler];
}

+(NSURLSessionDataTask *)registerWithParameters:(NSDictionary *)parameters completionHandler:(void (^)(NSURLSessionDataTask * _Nullable, id _Nullable, NSError * _Nullable))handler
{
    NSString *path = @"register";
    return [[self class] GET:path parameters:parameters completionHandler:handler];
}

+(NSURLSessionDataTask *)sendVerifyCodeWithParameters:(NSDictionary *)parameters completionHandler:(void (^)(NSURLSessionDataTask * _Nullable, id _Nullable, NSError * _Nullable))handler
{
    NSString *path = @"sendVerifyCode";
    return [[self class] GET:path parameters:parameters completionHandler:handler];
}

+(NSURLSessionDataTask *)resetPasswordWithParameters:(NSDictionary *)parameters completionHandler:(void (^)(NSURLSessionDataTask * _Nullable, id _Nullable, NSError * _Nullable))handler
{
    NSString *path = @"resetPassword";
    return [[self class] GET:path parameters:parameters completionHandler:handler];
}

@end
