//
//  D3DetailTableViewController.h
//  PROJECTS
//
//  Created by 周义 on 2017/11/16.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//

#import "BaseTableViewController.h"

@interface D3DetailTableViewController : BaseTableViewController
{
    ImagesBrowser *_browser;
}

-(instancetype)initWithModel:(D3ModelModel*)model;

@end