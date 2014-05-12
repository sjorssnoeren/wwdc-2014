//
//  SJSTextView.m
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 09-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import "SJSTextView.h"

@implementation SJSTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.editable = NO;
        self.font = [UIFont fontWithName:@"Avenir-Roman" size:14.0];
        self.textContainerInset = UIEdgeInsetsMake(22, 15, 22, 15);
        self.textColor = [UIColor colorWithWhite:0.2 alpha:1.0];
    }
    return self;
}

- (void)resetFrame
{
    [self.layoutManager ensureLayoutForTextContainer:self.textContainer];
    [self layoutIfNeeded];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.contentSize.height);
}

@end
