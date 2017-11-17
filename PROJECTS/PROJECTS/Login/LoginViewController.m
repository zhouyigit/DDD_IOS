//
//  LoginViewController.m
//  PROJECTS
//
//  Created by yiyahanyu on 2017/11/17.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"登录";
    
    [self addSubviews];
}

-(void)addSubviews
{
    UILabel *userL = [[UILabel alloc] init];
    userL.text = @"账号：";
    [self.view addSubview:userL];
    [userL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(msHMargin);
        make.top.mas_offset(msNavHeight+50);
        make.width.offset(60);
    }];
    
    _userTF = [[UITextField alloc] init];
    _userTF.placeholder = @"请输入您的手机号";
    _userTF.layer.borderColor = DebugColor.CGColor;
    _userTF.layer.borderWidth = OnePX;
    [self.view addSubview:_userTF];
    [_userTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(userL.mas_right).offset(msHMargin);
        make.right.mas_offset(-msHMargin);
        make.centerY.equalTo(userL);
    }];
    
    UILabel *passwordL = [[UILabel alloc] init];
    passwordL.text = @"密码：";
    [self.view addSubview:passwordL];
    [passwordL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(userL);
        make.top.equalTo(userL.mas_bottom).offset(50);
    }];
    
    _passwordTF = [[UITextField alloc] init];
    _passwordTF.placeholder = @"请输入密码";
    _passwordTF.layer.borderColor = DebugColor.CGColor;
    _passwordTF.layer.borderWidth = OnePX;
    [self.view addSubview:_passwordTF];
    [_passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_userTF);
        make.centerY.equalTo(passwordL);
    }];
    
    _loginButton = [[UIButton alloc] init];
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [_loginButton setBackgroundImage:[UIImage imageWithColor:DebugColor] forState:UIControlStateNormal];
    [_loginButton setBackgroundImage:[UIImage imageWithColor:DebugColorOrange] forState:UIControlStateDisabled];
    [_loginButton addTarget:self action:@selector(loginButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(msHMargin);
        make.right.mas_offset(-msHMargin);
        make.top.equalTo(_passwordTF.mas_bottom).offset(50);
    }];
    
    UIButton *forgetButton = [[UIButton alloc] init];
    [forgetButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetButton setTitleColor:DebugColor forState:UIControlStateNormal];
    [forgetButton addTarget:self action:@selector(forgetButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetButton];
    [forgetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_loginButton);
        make.top.equalTo(_loginButton.mas_bottom).offset(msVMargin);
    }];
    
    UIButton *registerButton = [[UIButton alloc] init];
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [registerButton setTitleColor:DebugColor forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(registerButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    [registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_loginButton);
        make.top.equalTo(forgetButton);
    }];
}

-(void)loginButtonAction
{
    
}

-(void)forgetButtonAction
{
    
}

-(void)registerButtonAction
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
