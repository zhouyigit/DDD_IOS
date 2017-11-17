//
//  ImagesBrowser.m
//  PROJECTS
//
//  Created by 周义 on 2017/11/16.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//

#import "ImagesBrowser.h"

@implementation ImagesBrowser

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
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.delegate = self;
        [self addSubview:_scrollView];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        
        _pageControl = [[UIPageControl alloc] init];
        [self addSubview:_pageControl];
        [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.bottom.equalTo(self.mas_bottom).offset(-20);
            make.height.offset(20);
        }];
    }
    return self;
}

-(void)setImages:(NSArray<NSString*>*)images
{
    for (int i=0; i<images.count; i++) {
        CGRect frame = CGRectMake(CGRectGetWidth(self.bounds)*i, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
        ImageBrowser *imageBrowser = [[ImageBrowser alloc] initWithFrame:frame];
        [_scrollView addSubview:imageBrowser];
        [imageBrowser setImage:images[i]];
        
        _scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.bounds)*(i+1), CGRectGetHeight(self.bounds));
    }
    
    [_pageControl setNumberOfPages:images.count];
    
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (decelerate) {
        //
    } else {
        [self scrollViewDidEndScroll:scrollView];
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScroll:scrollView];
}
-(void)scrollViewDidEndScroll:(UIScrollView *)scrollView
{
    int index = (int)(scrollView.contentOffset.x/CGRectGetWidth(_scrollView.bounds));
    [_pageControl setCurrentPage:index];
}

@end
