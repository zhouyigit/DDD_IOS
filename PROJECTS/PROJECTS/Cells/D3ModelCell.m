//
//  D3ModelCell.m
//  PROJECTS
//
//  Created by yiyahanyu on 2017/11/16.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//

#import "D3ModelCell.h"

@implementation D3ModelCell

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
        _nameL = [[UILabel alloc] init];
        _nameL.backgroundColor = DebugColor;
        [self.contentView addSubview:_nameL];
        [_nameL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(msHMargin);
            make.top.mas_offset(msVMargin);
            make.right.mas_offset(-msHMargin);
        }];
        
        float width = (WIDTH-msHMargin*4)/3.0;
        
        _imv1 = [[UIImageView alloc] init];
        _imv1.backgroundColor = DebugColor;
        [self.contentView addSubview:_imv1];
        [_imv1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_nameL);
            make.top.equalTo(_nameL.mas_bottom).offset(msVMargin);
            make.width.offset(width);
            make.bottom.mas_equalTo(-msVMargin);
        }];
        
        _imv2 = [[UIImageView alloc] init];
        _imv2.backgroundColor = DebugColor;
        [self.contentView addSubview:_imv2];
        [_imv2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_imv1.mas_right).offset(msHMargin);
            make.top.equalTo(_nameL.mas_bottom).offset(msVMargin);
            make.width.offset(width);
            make.bottom.mas_equalTo(-msVMargin);
        }];
        
        _imv3 = [[UIImageView alloc] init];
        _imv3.backgroundColor = DebugColor;
        [self.contentView addSubview:_imv3];
        [_imv3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_imv2.mas_right).offset(msHMargin);
            make.top.equalTo(_nameL.mas_bottom).offset(msVMargin);
            make.width.offset(width);
            make.bottom.mas_equalTo(-msVMargin);
        }];
        
    }
    return self;
}

-(void)setModel:(BaseModel *)model atIndexPath:(NSIndexPath *)indexPath
{
    [super setModel:model atIndexPath:indexPath];
    
    _nameL.text = @"模型名称";
}

@end
