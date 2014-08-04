//
//  BRAppDelegate.m
//  Brick
//
//  Created by Evan Coleman on 8/2/14.
//  Copyright (c) 2014 Evan Coleman. All rights reserved.
//

#import "BRAppDelegate.h"

#import "BRGameViewController.h"

@implementation BRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    BRGameViewController *gameViewController = [[BRGameViewController alloc] init];
    self.window.rootViewController = gameViewController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
