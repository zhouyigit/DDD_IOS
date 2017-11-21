//
//  OrderBuilderViewController.m
//  PROJECTS
//
//  Created by 周义 on 2017/11/21.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//

#import "OrderBuilderViewController.h"

@interface OrderBuilderViewController ()

@end

@implementation OrderBuilderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"生成订单";
    self.tableView.mj_footer = nil;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 2) {
        return 50;
    } else {
        return 30;
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"选择打印机(默认选择离我最近的):";
    } else if (section == 1) {
        return @"打印耗时:";
    } else if (section == 2) {
        return @"预计打印开始时间\n(具体以付款时选择的打印机预约到的时间为准):";
    } else if (section == 3) {
        return @"选择颜色(默认随机颜色):";
    } else if (section == 4) {
        return @"价格(20元/小时):";
    } else {
        return nil;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
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
