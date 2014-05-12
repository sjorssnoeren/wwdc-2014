//
//  SJSViewController.m
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 07-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import "SJSViewController.h"
#import "SJSSidebarViewController.h"

#import "SJSVCAnimator.h"

@interface SJSViewController ()

@end

@implementation SJSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *hamburger = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"hamburger"] style:UIBarButtonItemStylePlain target:self action:@selector(toggleSidebar)];
    self.navigationItem.leftBarButtonItem = hamburger;
}

- (void)toggleSidebar
{
    SJSSidebarViewController *sidebarController = (SJSSidebarViewController *)self.parentViewController.parentViewController;
    [sidebarController toggleSidebar];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    SJSVCAnimator *animator = [SJSVCAnimator new];
    return animator;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    SJSVCAnimator *animator = [SJSVCAnimator new];
    return animator;
}

@end
