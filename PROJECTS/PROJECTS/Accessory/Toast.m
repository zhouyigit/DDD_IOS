//
//  Toast.m
//  PROJECTS
//
//  Created by yiyahanyu on 2017/11/20.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//

#import "Toast.h"

@implementation Toast

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+(void)toastMessage:(NSString*)message inView:(UIView*)superView
{
    Toast *toast = [[[self class] alloc] init];
    UILabel *label = [[UILabel alloc] init];
    label.text = message;
    [superView addSubview:toast];
    [toast addSubview:label];
    [toast mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(superView);
    }];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_offset(3);
        make.right.bottom.mas_offset(-3);
    }];
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 3;
        self.backgroundColor = [UIColor colorWithHex:0x000000 alpha:0.5];
        
        __block Toast *weak = self;
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:NO block:^(NSTimer * _Nonnull timer) {
            [timer invalidate];
            timer = nil;
            [UIView animateWithDuration:0.25 animations:^{
                weak.alpha = 0;
            } completion:^(BOOL finished) {
                [weak removeFromSuperview];
            }];
        }];
    };
    return self;
}

-(void)dealloc
{
    
}

@end
