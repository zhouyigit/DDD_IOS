//
//  WechatGroupViewController.m
//  PROJECTS
//
//

#import "WechatGroupViewController.h"

@interface WechatGroupViewController ()

@end

@implementation WechatGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"TAB1";
    [self initVCs];
    [self initTitleButtons:@[@"公共模型", @"我的模型"]];
//    [self initRightButton:@"添加" target:self sel:@selector(rightButtonAction)];
    [self initLeftButton:[UIImage imageWithColor:[UIColor blackColor] size:CGSizeMake(20, 20)] target:self sel:@selector(leftButtonAction)];
}

-(void)leftButtonAction
{
    CATransition* transition = [CATransition animation];
    transition.duration = 3.0f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    transition.type = kCATransitionPush;            //改变视图控制器出现的方式
    transition.subtype = kCATransitionFromTop;     //出现的位置
    
//    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    
    ViewController *vc = [[ViewController alloc] init];
//    vc.hidesBottomBarWhenPushed = NO;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)rightButtonAction
{
    if (self.currentIndex == 0) {
        NSLog(@"join");
    } else if (self.currentIndex == 1) {
        NSLog(@"add");
        WxGroupModel *model = [[WxGroupModel alloc] init];
        model.gid = 101;
        model.name = @"微信101群";
        [WxGroupSqlWork addManagedGroup:model];
        ManagedTableViewController *rtvc = (ManagedTableViewController*)self.vcs[self.currentIndex];
        [rtvc.dataSource insertObject:model atIndex:0];
        [rtvc.tableView reloadData];
    }
}

-(void)initVCs
{
    [super initVCs];
    
    JoinedTableViewController *vc1 = [[JoinedTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    vc1.view.frame = CGRectMake(0, 0, CGRectGetWidth(self.scrollView.bounds), CGRectGetHeight(self.scrollView.bounds));
    [self.vcs addObject:vc1];
    [self.scrollView addSubview:vc1.view];
    
    ManagedTableViewController *vc2 = [[ManagedTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    vc2.view.frame = CGRectMake(CGRectGetWidth(self.scrollView.bounds), 0, CGRectGetWidth(self.scrollView.bounds), CGRectGetHeight(self.scrollView.bounds));
    [self.vcs addObject:vc2];
    [self.scrollView addSubview:vc2.view];
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
