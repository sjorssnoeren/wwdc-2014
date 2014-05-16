//
//  SJSAsynchronousImage.h
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 08-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJSAsynchronousImage : NSObject

typedef void (^SJSCompletion)(BOOL success, UIImage *image);

+ (void)loadImageWithUrl:(NSString *)url completion:(SJSCompletion)completion;

@end
