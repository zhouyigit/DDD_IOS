//
//  SubtitleCell.m
//  PROJECTS
//
//  Created by yiyahanyu on 2017/11/27.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//

#import "SubtitleCell.h"

@implementation SubtitleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _mainLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_mainLabel];
        [_mainLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(msHMargin);
            make.top.equalTo(self.contentView);
            make.right.mas_offset(-msHMargin);
        }];
        
        _subLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_subLabel];
        [_subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(msHMargin);
            make.bottom.mas_offset(0);
            make.right.mas_offset(-msHMargin);
        }];
    }
    return self;
}

-(void)setTitle:(NSString *)title subtitle:(NSString *)subtitle
{
    _mainLabel.text = title;
    _subLabel.text = subtitle;
}

@end
