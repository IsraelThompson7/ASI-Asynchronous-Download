//
//  PicturePresentIV.m
//  Test
//
//  Created by 余真 on 13-7-23.
//  Copyright (c) 2013年 余真. All rights reserved.
//

#import "PicturePresentIV.h"

@interface PicturePresentIV ()
{
    UIProgressView *progressView;
}

@end

@implementation PicturePresentIV

- (void)dealloc
{
    [progressView release];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWIthImageUrl:(NSURL *)url
{
    if (self = [super init]) {
        self.imageUrl = url;
        self.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return self;
}

- (void)loadImage
{
    if (progressView == nil) {
        progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(WIDTH/2-100, HEIGHT/2-10, 200, 0)];
        progressView.progressViewStyle = UIProgressViewStyleBar;
        [self addSubview:progressView];
    }
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate.networkQueue setShouldCancelAllRequestsOnFailure:NO];
    appDelegate.networkQueue.showAccurateProgress = YES;
    
    self.request = [ASIHTTPRequest requestWithURL:self.imageUrl];
    [self.request setDelegate:self];
    [self.request setShouldContinueWhenAppEntersBackground:YES];
    [self.request setTimeOutSeconds:60.0f];
    
    [self.request setDownloadCache:appDelegate.imageCache];
    [self.request setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy];
    [self.request setDownloadProgressDelegate:progressView];
    
    [appDelegate.networkQueue addOperation:self.request];
    
    [appDelegate.networkQueue go];
}

- (void)clearImage
{
    self.image = nil;
    if (!(self.request.isCancelled)) {
        [self.request cancel];
    }
}

#pragma mark - ASIHTTPRequestDelegate -

- (void)requestFinished:(ASIHTTPRequest *)request
{
    self.image = [UIImage imageWithData:[request responseData]];
    [progressView removeFromSuperview];
    [progressView release];
    progressView = nil;
}

#pragma mark - ASIHTTPRequestDelegate -

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
    NSLog(@"请求被终止了%@", error);
    
    [request cancel];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
