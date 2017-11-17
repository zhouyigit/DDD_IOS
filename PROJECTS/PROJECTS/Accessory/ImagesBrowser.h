//
//  ImagesBrowser.h
//  PROJECTS
//
//  Created by 周义 on 2017/11/16.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageBrowser.h"

@interface ImagesBrowser : UIView<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
}

-(void)setImages:(NSArray<NSString*>*)images;

@end
