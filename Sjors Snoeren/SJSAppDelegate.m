//
//  SJSAppDelegate.m
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 05-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import "SJSAppDelegate.h"

#import "SJSPresentationViewController.h"
#import "SJSAboutViewController.h"
#import "SJSMenuViewController.h"

@implementation SJSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    SJSAboutViewController *rootViewController = [SJSAboutViewController new];
    SJSMenuViewController *menuViewController = [SJSMenuViewController new];
    
    self.sidebarController = [[SJSSidebarViewController alloc] initWithMainViewController:rootViewController sideViewController:menuViewController];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:self.sidebarController];
    [navController setNavigationBarHidden:YES];
    
    [self customizeAppearance];
    
    self.window.rootViewController = navController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)customizeAppearance
{
    [UINavigationBar appearance].titleTextAttributes = @{NSFontAttributeName: [UIFont fontWithName:@"Avenir-Medium" size:17.0]};
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"Avenir-Medium" size:15.0]} forState:UIControlStateNormal];
}
@end
