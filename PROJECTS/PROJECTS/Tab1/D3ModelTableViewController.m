//
//  D3ModelTableViewController.m
//  PROJECTS
//
//  Created by yiyahanyu on 2017/11/16.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//

#import "D3ModelTableViewController.h"

@interface D3ModelTableViewController ()

@end

@implementation D3ModelTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.estimatedRowHeight = 44;
    [self.tableView registerClass:[D3ModelCell class] forCellReuseIdentifier:@"D3ModelCell"];
    
//    self.dataSource = [WxGroupSqlWork getManagedGroups];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return D3ModelCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self cellForRowAtIndexPath:indexPath tableView:tableView];
}

-(UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView
{
    D3ModelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"D3ModelCell" forIndexPath:indexPath];
    [cell setModel:nil atIndexPath:indexPath];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (!ArrayIsEmpty(self.dataSource)) {
        //
    } else {
        D3ModelModel *model = [self.dataSource objectAtIndex:indexPath.row];
        D3DetailTableViewController *detailvc = [[D3DetailTableViewController alloc] initWithModel:model];
//        detailvc.hidesBottomBarWhenPushed = NO;
        [NavC pushViewController:detailvc animated:YES];
    }
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
