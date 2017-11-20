//
//  RegisterViewController.m
//  PROJECTS
//
//  Created by yiyahanyu on 2017/11/20.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"注册";
    
    _username = [[LabelTextField alloc] initWithLabelString:@"账        号：" placeholder:@"请输入您的手机号"];
    [self.contentView addSubview:_username];
    _username.textField.keyboardType = UIKeyboardTypePhonePad;
    [_username mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(msHMargin);
        make.right.mas_offset(-msHMargin);
        make.top.mas_offset(50);
    }];
    
    _sendButton = [[CountDownButton alloc] initWithTitle:@"发送验证码"];
    [self.contentView addSubview:_sendButton];
    [_sendButton addTarget:self action:@selector(sendVerifyCode) forControlEvents:UIControlEventTouchUpInside];
    [_sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_username.mas_bottom).offset(50);
        make.right.mas_offset(-msHMargin);
        make.width.offset(100);
    }];
    
    _verifyCode = [[LabelTextField alloc] initWithLabelString:@"验  证  码：" placeholder:@"输入验证码"];
    [self.contentView addSubview:_verifyCode];
    _verifyCode.textField.keyboardType = UIKeyboardTypeNumberPad;
    [_verifyCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_username);
        make.centerY.equalTo(_sendButton);
        make.right.equalTo(_sendButton.mas_left).offset(-msHMargin);
    }];
    
    _passwordSetup = [[LabelTextField alloc] initWithLabelString:@"设置密码：" placeholder:@"请输入密码"];
    [self.contentView addSubview:_passwordSetup];
    _passwordSetup.textField.keyboardType = UIKeyboardTypeNumberPad;
    [_passwordSetup mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_username);
        make.top.equalTo(_sendButton.mas_bottom).offset(50);
    }];
    
    _passwordConfirm = [[LabelTextField alloc] initWithLabelString:@"确认密码：" placeholder:@"请再次输入密码"];
    [self.contentView addSubview:_passwordConfirm];
    _passwordConfirm.textField.keyboardType = UIKeyboardTypeNumberPad;
    [_passwordConfirm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_passwordSetup);
        make.top.equalTo(_passwordSetup.mas_bottom).offset(50);
    }];
    
    _registerButton = [[UIButton alloc] init];
    [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [_registerButton setBackgroundImage:[UIImage imageWithColor:DebugColor] forState:UIControlStateNormal];
    [_registerButton setBackgroundImage:[UIImage imageWithColor:DebugColorOrange] forState:UIControlStateDisabled];
    [_registerButton addTarget:self action:@selector(registerButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_registerButton];
    [_registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_passwordConfirm);
        make.top.equalTo(_passwordConfirm.mas_bottom).offset(50);
    }];
    
    UIButton *agreementButton = [[UIButton alloc] init];
    [agreementButton addTarget:self action:@selector(agreementButtonAction) forControlEvents:UIControlEventTouchUpInside];
    NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:@"用户协议" attributes:attribtDic];
    [agreementButton setAttributedTitle:attribtStr forState:UIControlStateNormal];
    [self.contentView addSubview:agreementButton];
    [agreementButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_registerButton);
        make.top.equalTo(_registerButton.mas_bottom).offset(10);
    }];
    
    UILabel *agreementLabel = [[UILabel alloc] init];
    agreementLabel.text = @"注册即表示同意";
    [self.contentView addSubview:agreementLabel];
    [agreementLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(agreementButton);
        make.right.equalTo(agreementButton.mas_left);
    }];
}

-(void)agreementButtonAction
{
    UserAgreementViewController *vc = [[UserAgreementViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)registerButtonAction
{
    if (StringIsEmpty(_username.textField.text)) {
        [Toast toastMessage:@"账号不能为空" inView:self.contentView];
        return;
    }
    if (StringIsEmpty(_verifyCode.textField.text)) {
        [Toast toastMessage:@"验证码不能为空" inView:self.contentView];
        return;
    }
    if (StringIsEmpty(_passwordSetup.textField.text)) {
        [Toast toastMessage:@"密码不能为空" inView:self.contentView];
        return;
    }
    if (StringIsEmpty(_passwordConfirm.textField.text) || ![_passwordConfirm.textField.text isEqualToString:_passwordSetup.textField.text]) {
        [Toast toastMessage:@"两次密码输入不一致" inView:self.contentView];
        return;
    }
    
    __block MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:NO];
    __block RegisterViewController *weak = self;
    NSURLSessionDataTask *task = [UserNetwork registerWithParameters:@{@"username":_username.textField.text,@"password":_passwordConfirm.textField.text} completionHandler:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject, NSError * _Nullable error) {
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

-(void)sendVerifyCode
{
    [_sendButton startCountDown];
}

-(void)releaseSomething
{
    [_sendButton endCountDown];
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
