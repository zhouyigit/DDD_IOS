//
//  RegisterViewController.h
//  PROJECTS
//
//  Created by yiyahanyu on 2017/11/20.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//

#import "BaseViewController.h"
#import "UserAgreementViewController.h"

@interface RegisterViewController : BaseViewController
{
    LabelTextField *_username;
    CountDownButton *_sendButton;
    LabelTextField *_verifyCode;
    LabelTextField *_passwordSetup;
    LabelTextField *_passwordConfirm;
    UIButton *_registerButton;
    
}

@end
