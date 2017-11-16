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
        self.pagingEnabled = YES;
    }
    return self;
}

-(void)setImages:(NSArray<NSString*>*)images
{
    for (int i=0; i<images.count; i++) {
        CGRect frame = CGRectMake(CGRectGetWidth(self.bounds)*i, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
        ImageBrowser *imageBrowser = [[ImageBrowser alloc] initWithFrame:frame];
        [self addSubview:imageBrowser];
        [imageBrowser setImage:images[i]];
        
        self.contentSize = CGSizeMake(CGRectGetWidth(self.bounds)*(i+1), CGRectGetHeight(self.bounds));
    }
}

@end
