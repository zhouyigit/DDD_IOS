//
//  CountDownButton.m
//  PROJECTS
//
//  Created by yiyahanyu on 2017/11/20.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//

#import "CountDownButton.h"

@implementation CountDownButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithTitle:(NSString*)title
{
    self = [super init];
    if (self) {
        _originalTitle = title;
        [self setTitle:_originalTitle forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageWithColor:DebugColor] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageWithColor:DebugColorOrange] forState:UIControlStateDisabled];
    }
    return self;
}

-(void)startCountDown
{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    _count = 60;
    self.enabled = NO;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    [_timer fire];
}

-(void)countDown
{
    NSString *title = [NSString stringWithFormat:@"%d秒", _count];
    [self setTitle:title forState:UIControlStateDisabled];
    if (_count == 0) {
        [self endCountDown];
    }
    _count--;
}

-(void)endCountDown
{
    [_timer invalidate];
    _timer = nil;
    [self setTitle:_originalTitle forState:UIControlStateNormal];
    self.enabled = YES;
}

@end
