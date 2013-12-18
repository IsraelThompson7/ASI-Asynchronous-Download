//
//  AppDelegate.h
//  Test
//
//  Created by 余真 on 13-7-23.
//  Copyright (c) 2013年 余真. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IndexViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) ASIDownloadCache *imageCache;     //缓存设置
@property (nonatomic, retain) ASINetworkQueue *networkQueue;    //asi下载队列

@end
