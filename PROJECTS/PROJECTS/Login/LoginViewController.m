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
    _username = [[LabelTextField alloc] initWithLabelString:@"账号：" placeholder:@"请输入您的手机号"];
    [self.contentView addSubview:_username];
    _username.textField.keyboardType = UIKeyboardTypePhonePad;
    [_username mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(msHMargin);
        make.right.mas_offset(-msHMargin);
        make.top.mas_offset(50);
    }];
    
    _password = [[LabelTextField alloc] initWithLabelString:@"密码：" placeholder:@"请输入密码"];
    [self.contentView addSubview:_password];
    _password.textField.keyboardType = UIKeyboardTypeNumberPad;
    [_password mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_username);
        make.top.equalTo(_username.mas_bottom).offset(50);
    }];
    
    _loginButton = [[UIButton alloc] init];
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [_loginButton setBackgroundImage:[UIImage imageWithColor:DebugColor] forState:UIControlStateNormal];
    [_loginButton setBackgroundImage:[UIImage imageWithColor:DebugColorOrange] forState:UIControlStateDisabled];
    [_loginButton addTarget:self action:@selector(loginButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_loginButton];
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_password);
        make.top.equalTo(_password.mas_bottom).offset(50);
    }];
    
    UIButton *forgetButton = [[UIButton alloc] init];
    [forgetButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetButton setTitleColor:DebugColor forState:UIControlStateNormal];
    [forgetButton addTarget:self action:@selector(forgetButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:forgetButton];
    [forgetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_loginButton);
        make.top.equalTo(_loginButton.mas_bottom).offset(msVMargin);
    }];
    
    UIButton *registerButton = [[UIButton alloc] init];
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [registerButton setTitleColor:DebugColor forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(registerButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:registerButton];
    [registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_loginButton);
        make.top.equalTo(forgetButton);
    }];
}

-(void)loginButtonAction
{
    if (StringIsEmpty(_username.textField.text)) {
        [Toast toastMessage:@"账号不能为空" inView:self.contentView];
        return;
    }
    if (StringIsEmpty(_password.textField.text)) {
        [Toast toastMessage:@"密码不能为空" inView:self.contentView];
        return;
    }
    
    __block MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:NO];
//    hud.label.text = @"我日ing";
    
    __block LoginViewController *weak = self;
    NSURLSessionDataTask *task = [UserNetwork loginWithParameters:@{@"username":_username.textField.text,@"password":_password.textField.text} completionHandler:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            //该网络事务是成功完成的
            NSNumber *errCode = responseObject[@"error"];
            if (errCode.boolValue == NO) {//这个判断由返回的json串定义
                //获取数据成功（获取数据的成功或失败 与 网络事务的成功失败 无关）
                
            }
        } else {
            //该网络事务失败
            if (error.code == -999) {
                //网络事务被取消
            }
        }
        [weak deleteTask:task];
        //        [MBProgressHUD hideHUDForView:weak.view animated:NO];
        [hud hideAnimated:NO];
    }];
    [self saveTask:task];
}

-(void)forgetButtonAction
{
    ForgetPasswordViewController *vc = [[ForgetPasswordViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)registerButtonAction
{
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
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
