//
//  SJSAvatarImageView.m
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 09-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import "SJSAvatarImageView.h"

@implementation SJSAvatarImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 4.0;
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.borderWidth = 2.0;
    }
    return self;
}

@end
