//
//  GuideViewController.m
//  PROJECTS
//
//  Created by yiyahanyu on 2017/11/16.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//

#import "GuideViewController.h"

@interface GuideViewController ()

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIScrollView *_scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.backgroundColor = DebugColor;
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;//边缘黏滞回弹效果
    [self.view addSubview:_scrollView];
    
    int imageCount = 3;
    for (int i=0; i<imageCount; i++) {
        CGRect frame = CGRectMake(CGRectGetWidth(_scrollView.frame)*i, 0, CGRectGetWidth(_scrollView.frame), CGRectGetHeight(_scrollView.frame));
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.backgroundColor = DebugColorOrange;
        [_scrollView addSubview:imageView];
        
        _scrollView.contentSize = CGSizeMake(CGRectGetWidth(_scrollView.frame)*(i+1), CGRectGetHeight(_scrollView.frame));
        
        if (i == imageCount-1) {
            [self addSubviewInView:imageView];
        }
    }
}

-(void)addSubviewInView:(UIView*)superView
{
    superView.userInteractionEnabled = YES;
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:@"开始旅程" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(startJourney) forControlEvents:UIControlEventTouchUpInside];
    [superView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(superView);
        make.bottom.mas_offset(-50);
    }];
}

-(void)startJourney
{
    TabBarController *tabc = [[TabBarController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabc;
    
    [NSUD setNeverShowGuide:YES];
}

-(void)dealloc
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
