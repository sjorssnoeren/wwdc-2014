//
//  SJSWorkSlide.m
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 10-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import "SJSWorkSlide.h"

@implementation SJSWorkSlide

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 240)];
        [self addSubview:imageView];
        
        yearLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - 90, 20, 70, 30)];
        yearLabel.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.6];
        yearLabel.clipsToBounds = YES;
        yearLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:14.0];
        yearLabel.textAlignment = NSTextAlignmentCenter;
        yearLabel.textColor = [UIColor whiteColor];
        yearLabel.layer.cornerRadius = 3.0;
        [imageView addSubview:yearLabel];
        
        self.textView = [[SJSTextView alloc] initWithFrame:CGRectMake(0, 240, self.frame.size.width, 300)];
        self.textView.textColor = [UIColor whiteColor];
        self.textView.textContainerInset = UIEdgeInsetsMake(0, 15, 22, 15);
        [self addSubview:self.textView];
        
        self.pageControlBg = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - (90 + 64), self.frame.size.width, 90)];
        self.pageControlBg.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.7];
        self.pageControlBg.hidden = YES;
        [self addSubview:self.pageControlBg];
        
        if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            if([UIScreen mainScreen].bounds.size.height != 568.0)
                self.pageControlBg.frame = CGRectMake(0, self.frame.size.height - (60 + 64), self.frame.size.width, 60);
    }
    return self;
}

- (void)setLogo:(UIImage *)logo
{
    imageView.image = logo;
}

- (void)setDesc:(NSString *)desc
{
    self.textView.text = desc;
}

- (void)setYear:(NSString *)year
{
    yearLabel.text = year;
}

@end
