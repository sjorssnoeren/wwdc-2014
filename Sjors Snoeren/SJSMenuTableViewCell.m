//
//  SJSMenuTableViewCell.m
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 08-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import "SJSMenuTableViewCell.h"

@implementation SJSMenuTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        self.textLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:17.0];
        self.textLabel.textColor = [UIColor whiteColor];
        
        UIView *selected = [[UIView alloc] initWithFrame:self.bounds];
        selected.backgroundColor = [UIColor colorWithRed:15/255.0 green:133/255.0 blue:251/255.0 alpha:1.0];
        self.selectedBackgroundView = selected;
    }
    return self;
}

@end
