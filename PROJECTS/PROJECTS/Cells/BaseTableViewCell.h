//
//  BaseTableViewCell.h
//  PROJECTS
//
//所有自定义cell的基类，有用没用的吧

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

@property(strong, nonatomic) BaseModel *model;
@property(strong, nonatomic) NSIndexPath *indexPath;

@property(strong, nonatomic) UIView *line;

-(void)setModel:(BaseModel*)model atIndexPath:(NSIndexPath*)indexPath;

@end
