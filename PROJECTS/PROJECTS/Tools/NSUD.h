//
//  NSUD.h
//  PROJECTS
//
//  Created by yiyahanyu on 2017/11/17.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//

#import <Foundation/Foundation.h>

#define KEY_NeverShowGuide [NSString stringWithFormat:@"NeverShowGuideForVersion%@", VersionString]
#define KEY_IsLogin @"IsUserLogin"

@interface NSUD : NSObject

/** 设置指导功能是否展示 */
+(void)setNeverShowGuide:(BOOL)b;
/** 获取指导功能是否展示 */
+(BOOL)neverShowGuide;

/** 设置用户是否登录 **/
+(void)setIsLogin:(BOOL)b;
/** 获取用户是否登录 **/
+(BOOL)isLogin;

@end
