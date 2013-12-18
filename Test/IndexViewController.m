//
//  IndexViewController.m
//  Test
//
//  Created by 余真 on 13-7-23.
//  Copyright (c) 2013年 余真. All rights reserved.
//

#import "IndexViewController.h"

@implementation IndexViewController

@synthesize scrollView, pageControl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSMutableArray *dataArray = [NSMutableArray arrayWithCapacity:0];
    [dataArray addObject:[NSURL URLWithString:@"http://pica.nipic.com/2007-09-09/200799164044473_2.jpg"]];
    [dataArray addObject:[NSURL URLWithString:@"http://picm.photophoto.cn/072/014/046/0140460229.jpg"]];
    [dataArray addObject:[NSURL URLWithString:@"http://d.img.youboy.com/20113/15/21/g0/g0_12492388.jpg"]];
    [dataArray addObject:[NSURL URLWithString:@"http://pic8.nipic.com/20100622/4100964_125013123036_2.jpg"]];
    [dataArray addObject:[NSURL URLWithString:@"http://i9.hexunimg.cn/2012-02-04/137745539.jpg"]];
    [dataArray addObject:[NSURL URLWithString:@"http://img1.uuyoyo.com/12/0419/14564148A.jpg"]];
    [dataArray addObject:[NSURL URLWithString:@"http://www.ibaolan.com/fudiao/upfile/reliefpic/picture/20110320153955100.jpg"]];
    [dataArray addObject:[NSURL URLWithString:@"http://pic1a.nipic.com/2009-01-14/200911484447902_2.jpg"]];
    [dataArray addObject:[NSURL URLWithString:@"http://pic6.huitu.com/res/20121228/175094_20121228164049502200_1.jpg"]];
    [dataArray addObject:[NSURL URLWithString:@"http://img2.duitang.com/uploads/item/201302/21/20130221094248_zzVQr.thumb.600_0.jpeg"]];
    [dataArray addObject:[NSURL URLWithString:@"http://pic12.nipic.com/20101230/3234279_115743003000_2.jpg"]];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    scrollView.userInteractionEnabled = YES;
    scrollView.indicatorStyle = UIScrollViewIndicatorStyleDefault;
    [scrollView setBackgroundColor:[UIColor blackColor]];
    scrollView.delegate = self;
    scrollView.scrollEnabled = YES;
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(WIDTH*[dataArray count], HEIGHT);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:scrollView];
    
    //设置翻页功能
	pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    pageControl.hidden = YES;
    //设置页数
    pageControl.numberOfPages = [dataArray count];
    //默认的第几页
    pageControl.currentPage = 0;
    
    [self.view addSubview:pageControl];
    
    int count = 0;
    for (NSURL *tempUrl in dataArray) {
        PicturePresentIV *tempPicturePresentIV = [[PicturePresentIV alloc] initWIthImageUrl:tempUrl];
        tempPicturePresentIV.frame = CGRectMake(count*WIDTH, 0, WIDTH, HEIGHT);
        
        [scrollView addSubview:tempPicturePresentIV];
        
        if (count < 3) {
            [tempPicturePresentIV loadImage];
        }
        
        [tempPicturePresentIV release];
        
        count++;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)bscrollView
{
    if (fabs(bscrollView.contentOffset.x-WIDTH*pageControl.currentPage)>(WIDTH/2)) {
        int page = bscrollView.contentOffset.x/WIDTH;
        
        if (page == pageControl.currentPage) {
            page++;
        }
        
        PicturePresentIV *tempPicturePresentIV;
        
        if (page > pageControl.currentPage) {
            if (!(pageControl.currentPage-2<0)) {
                tempPicturePresentIV = [[scrollView subviews] objectAtIndex:(pageControl.currentPage-2)];
                [tempPicturePresentIV clearImage];
            }
            
            if (page+2 < [[scrollView subviews] count]) {
                tempPicturePresentIV = [[scrollView subviews] objectAtIndex:(page+2)];
                [tempPicturePresentIV loadImage];
            }
        }else{
            if (pageControl.currentPage+2<[[scrollView subviews] count]) {
                tempPicturePresentIV = [[scrollView subviews] objectAtIndex:(pageControl.currentPage+2)];
                [tempPicturePresentIV clearImage];
            }
            
            if (!(page-2<0)) {
                tempPicturePresentIV = [[scrollView subviews] objectAtIndex:(page-2)];
                [tempPicturePresentIV loadImage];
            }
        }
        pageControl.currentPage = page;
    }    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
