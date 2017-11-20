//
//  LabelTextField.h
//  PROJECTS
//
//  Created by yiyahanyu on 2017/11/20.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LabelTextField : UIView

@property(strong, nonatomic) UILabel *label;
@property(strong, nonatomic) UITextField *textField;

-(instancetype)initWithLabelString:(NSString*)labelString placeholder:(NSString*)placeholder;

@end
