//
//  UserNetwork.h
//  PROJECTS
//
//  Created by yiyahanyu on 2017/11/20.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//

#import "BaseNetwork.h"

@interface UserNetwork : BaseNetwork

/**
 *登录
 */
+ (NSURLSessionDataTask * _Nullable )loginWithParameters:(NSDictionary*_Nullable)parameters completionHandler:(void (^_Nonnull)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject, NSError * _Nullable error))handler;

/**
 *注册
 */
+ (NSURLSessionDataTask * _Nullable )registerWithParameters:(NSDictionary*_Nullable)parameters completionHandler:(void (^_Nonnull)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject, NSError * _Nullable error))handler;

/**
 *发送验证码
 */
+ (NSURLSessionDataTask * _Nullable )sendVerifyCodeWithParameters:(NSDictionary*_Nullable)parameters completionHandler:(void (^_Nonnull)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject, NSError * _Nullable error))handler;

/**
 *重置密码
 */
+ (NSURLSessionDataTask * _Nullable )resetPasswordWithParameters:(NSDictionary*_Nullable)parameters completionHandler:(void (^_Nonnull)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject, NSError * _Nullable error))handler;

@end
