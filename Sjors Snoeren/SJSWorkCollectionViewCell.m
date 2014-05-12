//
//  SJSWorkCollectionViewCell.m
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 07-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import "SJSWorkCollectionViewCell.h"

@implementation SJSWorkCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.thumbView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:self.thumbView];
    }
    return self;
}

@end
