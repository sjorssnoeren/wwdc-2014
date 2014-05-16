//
//  SJSAsynchronousImage.m
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 08-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import "SJSAsynchronousImage.h"

@implementation SJSAsynchronousImage

+ (void)loadImageWithUrl:(NSString *)url completion:(SJSCompletion)completion
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            if (image)
                completion(YES, image);
            else
                completion(NO, nil);
        }
        else
            completion(NO, nil);
    });
}

@end
