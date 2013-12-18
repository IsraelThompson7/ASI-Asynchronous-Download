//
//  IndexViewController.h
//  Test
//
//  Created by 余真 on 13-7-23.
//  Copyright (c) 2013年 余真. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PicturePresentIV.h"

@interface IndexViewController : UIViewController<UIScrollViewDelegate>

@property(nonatomic, retain)UIScrollView *scrollView;
@property(nonatomic, retain)UIPageControl *pageControl;

@end
