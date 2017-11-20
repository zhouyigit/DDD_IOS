//
//  UserAgreementViewController.m
//  PROJECTS
//
//  Created by yiyahanyu on 2017/11/20.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//

#import "UserAgreementViewController.h"

@interface UserAgreementViewController ()

@end

@implementation UserAgreementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"用户协议";
    
    UILabel *label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    [self.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.contentView);
    }];
    
    label.text = @"我同意我同意我同意我同意我同意我同意我同意我同意我同意我同意我同意我同意我同意我同意我同意我同意我同意我同意我同意我同意我同意我同意我同意我同意我同意我同意我同意";
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
