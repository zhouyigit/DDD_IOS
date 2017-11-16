//
//  BaseTableViewCell.m
//  PROJECTS
//
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_line];
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.contentView);
            make.height.offset(OnePX);
        }];
    }
    return self;
}

-(void)setModel:(BaseModel *)model atIndexPath:(NSIndexPath *)indexPath
{
    _model = model;
    _indexPath = indexPath;
}

-(void)dealloc
{
    
}

@end
