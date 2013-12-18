//
//  AppDelegate.m
//  Test
//
//  Created by 余真 on 13-7-23.
//  Copyright (c) 2013年 余真. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize imageCache, networkQueue;

- (void)dealloc
{
    [imageCache release];
    [networkQueue release];
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    IndexViewController *mainVC = [[IndexViewController alloc] init];
    self.window.rootViewController = mainVC;
    [mainVC release];
    
    //自定义缓存
    imageCache = [[ASIDownloadCache alloc] init];
    
    //设置缓存路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    [self.imageCache setStoragePath:[documentDirectory stringByAppendingPathComponent:@"resource"]];
    [self.imageCache setDefaultCachePolicy:ASIOnlyLoadIfNotCachedCachePolicy];
//    [self.imageCache clearCachedResponsesForStoragePolicy:ASICachePermanentlyCacheStoragePolicy];
    
    //自定义networkQueue
    networkQueue = [[ASINetworkQueue alloc] init];
    [networkQueue reset];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
