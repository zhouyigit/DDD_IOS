//
//  ManagedTableViewController.m
//  PROJECTS
//
//

#import "ManagedTableViewController.h"

@interface ManagedTableViewController ()

@end

@implementation ManagedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ArrayIsEmpty(self.dataSource) ? 1 : self.dataSource.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ArrayIsEmpty(self.dataSource) ? HEIGHT-msNavHeight-44 : D3ModelCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (ArrayIsEmpty(self.dataSource)) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.contentView.backgroundColor = DebugColor;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {
        return [self cellForRowAtIndexPath:indexPath tableView:tableView];
    }
}

@end
