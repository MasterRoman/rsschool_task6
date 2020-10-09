//
//  AppDelegate.m
//  TASK
//
//  Created by Admin on 29.07.2020.
//  Copyright © 2020 MasterCORP. All rights reserved.
//

#import "AppDelegate.h"
#import "StartViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    StartViewController *startVC = [StartViewController new];
    
    UINavigationController *mainController = [[UINavigationController alloc] initWithRootViewController:startVC];
    [mainController.navigationBar setHidden:YES];
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.rootViewController = mainController;
    [self.window setBackgroundColor:[UIColor clearColor]];
    self.window = window;
    [window makeKeyAndVisible];
    return YES;
}

@end
