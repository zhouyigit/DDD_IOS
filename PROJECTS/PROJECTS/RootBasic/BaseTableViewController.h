//
//  BaseTableViewController.h
//  PROJECTS
//
//所有tableview列表的基类

#import "BaseViewController.h"

@interface BaseTableViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>
{
    UITableViewStyle _style;//init和viewdidload之间传值用
}

@property(strong, nonatomic) UITableView *tableView;
@property(strong, nonatomic) NSMutableArray *dataSource;

-(instancetype)initWithStyle:(UITableViewStyle)style;

/** 自定义的 有个别cell时,用于tableView:cellForRowAtIndexPath:中,返回一般cell **/
-(UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView;

@end
