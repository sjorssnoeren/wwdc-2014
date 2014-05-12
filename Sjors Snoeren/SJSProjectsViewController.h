//
//  SJSProjectsViewController.h
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 13-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import "SJSViewController.h"

@interface SJSProjectsViewController : SJSViewController

/**
 Init
 
 @param {NSString} company
 @param {NSArray} Project Data
 */
- (id)initWithTitle:(NSString *)title projects:(NSArray *)projects;

@end
