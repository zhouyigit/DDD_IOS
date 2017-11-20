//
//  LabelTextField.m
//  PROJECTS
//
//  Created by yiyahanyu on 2017/11/20.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//

#import "LabelTextField.h"

@implementation LabelTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithLabelString:(NSString*)labelString placeholder:(NSString*)placeholder
{
    self = [super init];
    if (self) {
        _label = [[UILabel alloc] init];
        _label.text = labelString;
        [self addSubview:_label];
        CGSize size = [labelString sizeWithAttributes:@{NSFontAttributeName:_label.font}];
        int width = (int)(size.width+0.5);//四舍五入
        if (width < size.width) {
            width++;//向后取整
        }
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(self);
            make.width.offset(width);
        }];
        
        _textField = [[UITextField alloc] init];
        _textField.placeholder = placeholder;
        _textField.layer.borderColor = DebugColor.CGColor;
        _textField.layer.borderWidth = OnePX;
        [self addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_label.mas_right);
            make.top.right.bottom.equalTo(self);
        }];
    }
    return self;
}

@end
