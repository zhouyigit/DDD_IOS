//
//  ImageBrowser.m
//  PROJECTS
//
//  Created by 周义 on 2017/11/16.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//

#import "ImageBrowser.h"

@implementation ImageBrowser

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.backgroundColor = DebugColorOrange;
        [self addSubview:_imageView];
        
        self.delegate = self;
        self.maximumZoomScale = 3;
        self.minimumZoomScale = 1;
    }
    return self;
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}

-(void)setImage:(NSString*)image
{
    [_imageView sd_setImageWithURL:[NSURL URLWithString:image] placeholderImage:nil];
}

@end
