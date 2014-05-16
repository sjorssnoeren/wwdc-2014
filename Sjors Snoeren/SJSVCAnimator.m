//
//  SJSVCAnimator.m
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 07-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import "SJSVCAnimator.h"

@implementation SJSVCAnimator

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {

    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    fromViewController.view.userInteractionEnabled = NO;
    
    [transitionContext.containerView addSubview:fromViewController.view];
    [transitionContext.containerView addSubview:toViewController.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromViewController.view.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
    } completion:^(BOOL finished) {
        fromViewController.view.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
        fromViewController.view.userInteractionEnabled = YES;
        [transitionContext completeTransition:YES];
    }];
}

@end
