//
//  BaseTableViewController.m
//  PROJECTS
//
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

-(instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super init];
    if (self) {
        _style = style;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:_style];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.estimatedSectionHeaderHeight = 0;//ios11激活heightForHeaderInSection
    _tableView.sectionHeaderHeight = 0;
    _tableView.estimatedRowHeight = 44;//默认44，子类中覆盖
    _tableView.estimatedSectionFooterHeight = 0;//ios11激活heightForFooterInSection
    _tableView.sectionFooterHeight = 0;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    if (self.navBar) {
        [self.view insertSubview:_tableView belowSubview:self.navBar];
    } else {
        [self.view addSubview:_tableView];
    }
}

-(void)viewWillLayoutSubviews
{
    CGRect frame = self.view.bounds;
    NSString *className = [NSString stringWithFormat:@"%@", [self class]];
    if ([className isEqualToString:@"JoinedTableViewController"] || [className isEqualToString:@"ManagedTableViewController"]) {
        self.navBar.hidden = YES;
    } else {
        frame.origin.y = msNavHeight;
        frame.size.height = CGRectGetHeight(frame)-msNavHeight;
    }
    _tableView.frame = frame;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self cellForRowAtIndexPath:indexPath tableView:tableView];
}

-(UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
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
