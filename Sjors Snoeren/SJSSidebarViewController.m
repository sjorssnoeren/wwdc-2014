//
//  SJSSidebarViewController.m
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 07-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import "SJSSidebarViewController.h"
#import "SJSPresentationViewController.h"

#import "SJSDribbbleViewController.h"

@interface SJSSidebarViewController ()
{
    CGRect startRect;
    CGRect shownRect;
    BOOL sidebarIsVisible;
    UITapGestureRecognizer *tap;
}

/**
 Content Interaction
 */
typedef enum {
    SJSContentInteractionDefault,
    SJSContentInteractionClose
} SJSContentInteraction;

@property (strong, nonatomic) UIView *container;
@property (nonatomic) SJSContentInteraction contentInteraction;

@end

@implementation SJSSidebarViewController

- (id)initWithMainViewController:(UIViewController *)mainViewController sideViewController:(UIViewController *)sideViewController
{
    if (self = [super init]) {
        self.mainViewController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
        self.sideViewController = sideViewController;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.container = [[UIView alloc] initWithFrame:self.view.bounds];
    self.container.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.container.layer.shadowColor = [UIColor blackColor].CGColor;
    self.container.layer.shadowOffset = CGSizeMake(0, 1);
    self.container.layer.shadowOpacity = 1.0;
    self.container.layer.shadowRadius = 10.0;
    
    startRect = self.view.bounds;
    shownRect = CGRectMake(260, 0, self.container.frame.size.width, self.container.frame.size.height);
    
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideSidebar)];
    tap.numberOfTapsRequired = 1;
    
    self.mainViewController.view.frame = self.container.bounds;
    self.mainViewController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self addChildViewController:self.mainViewController];
    [self.mainViewController didMoveToParentViewController:self];
    [self.container addSubview:self.mainViewController.view];
        
    self.sideViewController.view.frame = self.container.bounds;
    self.sideViewController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self addChildViewController:self.sideViewController];
    [self.sideViewController didMoveToParentViewController:self];
    [self.view addSubview:self.sideViewController.view];
    
    [self.view addSubview:self.container];
    
    SJSPresentationViewController *presentation = [SJSPresentationViewController new];
    [self.navigationController presentViewController:presentation animated:NO completion:nil];
}

- (void)toggleSidebar
{
    if (sidebarIsVisible)
        [self hideSidebar];
    else
        [self showSidebar];
}

- (void)showSidebar
{
    self.contentInteraction = SJSContentInteractionClose;
    
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.container.frame = shownRect;
    } completion:^(BOOL finished) {
        sidebarIsVisible = YES;
    }];
}

- (void)hideSidebar
{
    self.contentInteraction = SJSContentInteractionDefault;
    
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.container.frame = startRect;
    } completion:^(BOOL finished) {
        sidebarIsVisible = NO;
    }];
}

- (void)setContentInteraction:(SJSContentInteraction)contentInteraction
{
    if (contentInteraction == SJSContentInteractionClose) {
        [self.mainViewController.view addGestureRecognizer:tap];
    }
    else {
        [self.mainViewController.view removeGestureRecognizer:tap];
    }
}

- (void)setCenterViewController:(SJSViewController *)viewController
{
    // Remove old
    [self.mainViewController willMoveToParentViewController:nil];
    [self.mainViewController removeFromParentViewController];
    [self.mainViewController.view removeFromSuperview];
    
    self.mainViewController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    // Add new
    self.mainViewController.view.frame = self.container.bounds;
    self.mainViewController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self addChildViewController:self.mainViewController];
    [self.mainViewController didMoveToParentViewController:self];
    [self.container addSubview:self.mainViewController.view];
    
    [self hideSidebar];
}

@end
