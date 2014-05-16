//
//  SJSMenuTableView.m
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 08-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import "SJSMenuTableView.h"

@implementation SJSMenuTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
        self.rowHeight = 44.0;
        self.separatorColor = [UIColor colorWithWhite:1.0 alpha:0.2];
        self.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return self;
}

@end
