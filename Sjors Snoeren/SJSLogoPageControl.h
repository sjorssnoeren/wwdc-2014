//
//  SJSLogoPageControl.h
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 11-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SJSLogoPageControlDelegate <NSObject>

/**
 Delegate method for receiving tapped button index
 @param {int} Sent Button Index
 */
- (void)pageControlButtonTapped:(UIButton *)sender;

@end

@interface SJSLogoPageControl : UIView

@property (nonatomic) int active;

/**
 Implent delegate methods
 */
@property (strong, nonatomic) id<SJSLogoPageControlDelegate> delegate;

/**
 Add Content To Page Control
 */
@property (strong, nonatomic) NSArray *logos;

@end
