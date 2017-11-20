//
//  CountDownButton.h
//  PROJECTS
//
//  Created by yiyahanyu on 2017/11/20.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//倒计时按钮

#import <UIKit/UIKit.h>

@interface CountDownButton : UIButton
{
    int _count;
    NSString *_originalTitle;
}

@property(strong, nonatomic)NSTimer *timer;

-(instancetype)initWithTitle:(NSString*)title;
-(void)startCountDown;
-(void)endCountDown;

@end
