//
//  SJSPresentationSlide.m
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 05-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import "SJSPresentationSlide.h"

@implementation SJSPresentationSlide

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, (self.frame.size.width - 60), self.frame.size.height)];
        self.label.font = [UIFont fontWithName:@"Avenir-Medium" size:26.0];
        [self addSubview:self.label];
    }
    return self;
}

@end
