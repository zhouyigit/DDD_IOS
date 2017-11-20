//
//  Toast.h
//  PROJECTS
//
//  Created by yiyahanyu on 2017/11/20.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Toast : UIView
{
    NSTimer *_timer;
}

+(void)toastMessage:(NSString*)message inView:(UIView*)superView;

@end
