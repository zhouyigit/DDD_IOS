//
//  ForgetPasswordViewController.h
//  PROJECTS
//
//  Created by yiyahanyu on 2017/11/20.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//与注册界面略有不同，直接复制粘贴的，懒得继承了

#import "BaseViewController.h"

@interface ForgetPasswordViewController : BaseViewController
{
    LabelTextField *_username;
    CountDownButton *_sendButton;
    LabelTextField *_verifyCode;
    LabelTextField *_passwordSetup;
    LabelTextField *_passwordConfirm;
    UIButton *_registerButton;
}

@end
