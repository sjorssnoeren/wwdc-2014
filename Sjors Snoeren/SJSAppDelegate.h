//
//  SJSAppDelegate.h
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 05-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SJSSidebarViewController.h"

@interface SJSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SJSSidebarViewController *sidebarController;

@end
