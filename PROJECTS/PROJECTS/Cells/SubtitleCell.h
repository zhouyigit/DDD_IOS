//
//  SubtitleCell.h
//  PROJECTS
//
//  Created by yiyahanyu on 2017/11/27.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//主标题、副标题

#import "BaseTableViewCell.h"

#define SubtitleCellHeight 60
#define SubtitleCellIdentifier @"SubtitleCell"

@interface SubtitleCell : BaseTableViewCell
{
    UILabel *_mainLabel;
    UILabel *_subLabel;
}

-(void)setTitle:(NSString*)title subtitle:(NSString*)subtitle;

@end
