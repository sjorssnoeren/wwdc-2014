//
//  SJSDribbbleModel.m
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 06-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import "SJSDribbbleModel.h"

@implementation SJSDribbbleModel

+ (void)loadDribbbleWithCompletion:(SJSDribbbleCompletion)completion
{
    NSString *url = @"http://api.dribbble.com/players/SjorsSnoeren/shots?per_page=18";
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        
        NSError *error;
        NSDictionary *parsed = nil;
        
        if (data) {
            parsed = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            if (!error)
                completion(YES, parsed[@"shots"]);
            else
                completion(NO, nil);
        }
        else
            completion(NO, nil);
    });
}

@end
