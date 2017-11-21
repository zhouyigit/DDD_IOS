//
//  D3DetailTableViewController.m
//  PROJECTS
//
//  Created by 周义 on 2017/11/16.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//

#import "D3DetailTableViewController.h"

@interface D3DetailTableViewController ()

@end

@implementation D3DetailTableViewController

-(instancetype)initWithModel:(D3ModelModel*)model
{
    self = [super init];
    if (self) {
        _model = model;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"模型预览";
    
    self.tableView.scrollEnabled = NO;
    
    [self.navBar setRightItemText:@"预约" forState:UIControlStateNormal];
    [self.navBar setRightItemTarget:self action:@selector(rightItemAction) forControlEvents:UIControlEventTouchUpInside];
    
    _browser = [[ImagesBrowser alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-msNavHeight)];
    [_browser setImages:@[@"https://image.baidu.com/search/down?tn=download&word=download&ie=utf8&fr=detail&url=https%3A%2F%2Ftimgsa.baidu.com%2Ftimg%3Fimage%26quality%3D80%26size%3Db9999_10000%26sec%3D1510854560890%26di%3D624a06ffe3588ee1ad3114ee946ec994%26imgtype%3D0%26src%3Dhttp%253A%252F%252Fp2.bahamut.com.tw%252FM%252F2KU%252F50%252F0001243850.JPG&thumburl=https%3A%2F%2Fss0.bdstatic.com%2F70cFvHSh_Q1YnxGkpoWK1HF6hhy%2Fit%2Fu%3D4232954192%2C3043724630%26fm%3D27%26gp%3D0.jpg",@"https://image.baidu.com/search/down?tn=download&word=download&ie=utf8&fr=detail&url=https%3A%2F%2Ftimgsa.baidu.com%2Ftimg%3Fimage%26quality%3D80%26size%3Db9999_10000%26sec%3D1510859508257%26di%3Db44a029cf746711bec4a7621d50d59ff%26imgtype%3D0%26src%3Dhttp%253A%252F%252Fe.hiphotos.baidu.com%252Fimage%252Fpic%252Fitem%252F37d12f2eb9389b50ebf6033f8f35e5dde7116e56.jpg&thumburl=https%3A%2F%2Fss1.baidu.com%2F-4o3dSag_xI4khGko9WTAnF6hhy%2Fimage%2Fh%253D220%2Fsign%3D5210bd3d0633874483c5287e610ed937%2F37d12f2eb9389b50ebf6033f8f35e5dde7116e56.jpg"]];

}

-(void)rightItemAction
{
    if ([NSUD isLogin]) {
        OrderBuilderViewController *vc = [[OrderBuilderViewController alloc] initWithStyle:UITableViewStyleGrouped];
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        LoginViewController *loginvc = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:loginvc animated:YES];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGRectGetHeight(_browser.bounds);
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return _browser;
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
