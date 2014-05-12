//
//  SJSDribbbleModel.h
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 06-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJSDribbbleModel : NSObject

typedef void (^SJSDribbbleCompletion)(BOOL success, NSArray *shots);

+ (void)loadDribbbleWithCompletion:(SJSDribbbleCompletion)completion;

@end
