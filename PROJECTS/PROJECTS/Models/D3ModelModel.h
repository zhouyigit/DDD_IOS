//
//  D3ModelModel.h
//  PROJECTS
//
//  Created by yiyahanyu on 2017/11/16.
//  Copyright © 2017年 yiyahanyu. All rights reserved.
//

/**
 "id":1001,
 "name":"model name",
 "uploaderId":101,
 "uploaderName":"uploader name",
 "uploadTime":"2017/01/01 00:00:00",
 "images":[
    "imageUrl1",
    "imageUrl2",
    "imageUrl3"
 ],
 "spendTime":3600,
 */

#import "BaseModel.h"

@interface D3ModelModel : BaseModel

@property (assign, nonatomic) long ID;
@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) long uploaderId;
@property (strong, nonatomic) NSString *uploaderName;
@property (strong, nonatomic) NSString *uploadTime;
@property (strong, nonatomic) NSArray<NSString*> *images;
@property (assign, nonatomic) long spendTime;

@end
