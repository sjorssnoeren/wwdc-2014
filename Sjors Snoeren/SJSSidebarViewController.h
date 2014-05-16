//
//  SJSSidebarViewController.h
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 07-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SJSViewController.h"

@interface SJSSidebarViewController : UIViewController

- (id)initWithMainViewController:(UIViewController *)mainViewController sideViewController:(UIViewController *)sideViewController;

/**
 @property {UIViewController} Content View Controller
 */
@property (strong, nonatomic) UIViewController *mainViewController;

/**
 @property {UIViewController} Side Menu View Controller
 */
@property (strong, nonatomic) UIViewController *sideViewController;

/**
 Set Center (content) View Controller
 @param {SJSViewcontroller} New View Controller
 */
- (void)setCenterViewController:(SJSViewController *)viewController;

/**
 Sidebar View
 */
- (void)toggleSidebar;
- (void)showSidebar;
- (void)hideSidebar;

@end
