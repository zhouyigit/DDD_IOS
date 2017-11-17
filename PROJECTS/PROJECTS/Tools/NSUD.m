//
//  NSUD.m
//  PROJECTS
//
//  Created by yiyahanyu on 2017/11/17.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//

#import "NSUD.h"

@implementation NSUD

+(void)setNeverShowGuide:(BOOL)b
{
    NSUserDefaults *nsud = [NSUserDefaults standardUserDefaults];
    [nsud setBool:b forKey:KEY_NeverShowGuide];
    [nsud synchronize];
}

+(BOOL)neverShowGuide
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:KEY_NeverShowGuide];
}

+(void)setIsLogin:(BOOL)b
{
    NSUserDefaults *nsud = [NSUserDefaults standardUserDefaults];
    [nsud setBool:b forKey:KEY_IsLogin];
    [nsud synchronize];
}

+(BOOL)isLogin
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:KEY_IsLogin];
}

@end
