//
//  SJSReadMoreBtn.m
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 06-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import "SJSReadMoreBtn.h"

@implementation SJSReadMoreBtn

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = YES;
        self.titleLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:16.0];
        
        self.textColor = [UIColor blackColor];
        self.tintColor = [UIColor colorWithRed:15/255.0 green:133/255.0 blue:251/255.0 alpha:1.0];
        
        [self setTitleColor:self.textColor forState:UIControlStateNormal];
        
        self.layer.borderColor = [UIColor colorWithWhite:0 alpha:0.1].CGColor;
        self.layer.borderWidth = 2.0;
        self.layer.cornerRadius = 3.0;
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted
{
    if(highlighted) {
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.backgroundColor = self.tintColor;
        self.layer.borderColor = self.tintColor.CGColor;
    }
    else {
        [self setTitleColor:self.textColor forState:UIControlStateNormal];
        self.backgroundColor = [UIColor clearColor];
        self.layer.borderColor = [UIColor colorWithWhite:0 alpha:0.1].CGColor;
    }
}

@end
