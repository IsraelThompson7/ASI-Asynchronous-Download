//
//  PicturePresentIV.h
//  Test
//
//  Created by 余真 on 13-7-23.
//  Copyright (c) 2013年 余真. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "ASIDownloadCache.h"
#import "ASINetworkQueue.h"
#import "AppDelegate.h"

#define WIDTH [[UIScreen mainScreen] bounds].size.width
#define HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface PicturePresentIV : UIImageView<ASIHTTPRequestDelegate>

@property(nonatomic, retain)NSURL *imageUrl;
@property(nonatomic, retain)ASIHTTPRequest *request;

- (id)initWIthImageUrl:(NSURL *)url;
- (void)loadImage;
- (void)clearImage;

@end
