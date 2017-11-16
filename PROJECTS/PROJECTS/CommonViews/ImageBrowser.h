//
//  ImageBrowser.h
//  PROJECTS
//
//  Created by 周义 on 2017/11/16.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageBrowser : UIScrollView<UIScrollViewDelegate>
{
    UIImageView *_imageView;
}

-(void)setImage:(NSString*)image;

@end
