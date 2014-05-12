//
//  SJSShowcaseViewController.h
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 11-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import "SJSViewController.h"

#import "SJSLogoPageControl.h"

@interface SJSShowcaseViewController : SJSViewController <UIScrollViewDelegate>

/**
 Array container all data
 */
@property (strong, nonatomic) NSArray *data;

/**
 Containg data for currentItem
 */
@property (strong, nonatomic) NSDictionary *currentItem;

/**
 Reload Data for slides
 */
- (void)reloadData;

@end
