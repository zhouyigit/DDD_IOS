//
//  LoginViewController.h
//  PROJECTS
//
//  Created by yiyahanyu on 2017/11/17.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//

#import "BaseViewController.h"
#import "RegisterViewController.h"
#import "ForgetPasswordViewController.h"

@interface LoginViewController : BaseViewController
{
    LabelTextField *_username;
    LabelTextField *_password;
    UIButton *_loginButton;
}

@end
