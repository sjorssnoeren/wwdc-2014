//
//  SJSWorkSlide.h
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 10-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SJSTextView.h"

@interface SJSWorkSlide : UIView
{
    UIImageView *imageView;
    UILabel *yearLabel;
}

@property (strong, nonatomic) UIImage *logo;

@property (strong, nonatomic) NSString *desc;
@property (strong, nonatomic) UITextView *textView;

@property (strong, nonatomic) NSString *year;

@property (strong, nonatomic) UIView *pageControlBg;

@end
