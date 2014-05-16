//
//  SJSLogoPageControl.m
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 11-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import "SJSLogoPageControl.h"

#import "UIImage+ImageEffects.h"

@implementation SJSLogoPageControl
{
    NSArray *logoArray;
}

- (void)setLogos:(NSMutableArray *)logos
{
    if([logoArray count] > 0) {
        for(int i = 0; i < [logoArray count]; i++) {
            [[self viewWithTag:10 + i] removeFromSuperview];
        }
    }
    
    for(int i = 0; i < [logos count]; i++) {
        UIButton *btn = [UIButton new];
        UIImageView *iconView = [UIImageView new];
        
        if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            if([UIScreen mainScreen].bounds.size.height == 568.0) {
                btn.frame = CGRectMake(i * (self.frame.size.width / [logos count]), 0, self.frame.size.width / [logos count], self.frame.size.height);
                iconView.frame = CGRectMake((btn.frame.size.width - 30) / 2, 0, 30, 30);
            }
            else {
                btn.frame = CGRectMake(i * (self.frame.size.width / [logos count]), 20, self.frame.size.width / [logos count], self.frame.size.height - 20);
                iconView.frame = CGRectMake((btn.frame.size.width - 20) / 2, 0, 20, 20);
            }
        }
        
        btn.tag = 10 + i;
        
        NSString *imageString = [NSString stringWithFormat:@"%@-icon", logos[i]];
        iconView.image = [UIImage imageNamed:[imageString lowercaseString]];
        
        [btn addSubview:iconView];
        
        [btn addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    
    logoArray = logos;
}

- (void)setActive:(int)active
{
    for (int i = 0; i < [logoArray count]; i++) {
        [self viewWithTag:10 + i].alpha = 0.6;
    }
    [self viewWithTag:10 + active].alpha = 1.0;
}

- (void)buttonTapped:(UIButton *)sender
{
    [self.delegate pageControlButtonTapped:sender];
}

@end
