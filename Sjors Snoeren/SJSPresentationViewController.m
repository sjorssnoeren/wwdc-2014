//
//  SJSPresentationViewController.m
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 05-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import "SJSPresentationViewController.h"

#import "SJSPresentationSlide.h"
#import "SJSReadMoreBtn.h"

@interface SJSPresentationViewController () <UIScrollViewDelegate>
{
    int slidesCount;
    int timerCount;
    UIView *bottomView;
    SJSReadMoreBtn *readMoreBtn;
}

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) NSArray *content;

@end

@implementation SJSPresentationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
        
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
    
    self.content = @[@{@"content": @"Hi Apple", @"lines": @1, @"image": @"circle"},
                     @{@"content": @"I'm Sjors Snoeren, \n18 years old", @"lines": @2, @"image": @"square"},
                     @{@"content": @"I create products for \nWeb & iOS", @"lines": @2},
                     @{@"content": @"I'm currently studying \nfor a bachelor degree \nin computer science", @"lines": @3},
                     @{@"content": @"Hope to see \nyou at WWDC 2014", @"lines": @2}];
    
    bottomView = [[UIView alloc] initWithFrame:CGRectMake(20, self.view.frame.size.height - 38, self.view.frame.size.width - 40, 24)];
    [self.view addSubview:bottomView];
    
    UILabel *introLabel = [[UILabel alloc] initWithFrame:bottomView.bounds];
    introLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:15.0];
    introLabel.text = [@"Intro" uppercaseString];
    [bottomView addSubview:introLabel];
    
    UILabel *slideLabel = [[UILabel alloc] initWithFrame:bottomView.bounds];
    slideLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:15.0];
    slideLabel.text = [@"\u2190 Slide To Left" uppercaseString];
    slideLabel.textAlignment = NSTextAlignmentRight;
    slideLabel.textColor = [UIColor lightGrayColor];
    [bottomView addSubview:slideLabel];
    
    readMoreBtn = [SJSReadMoreBtn new];
    readMoreBtn.frame = CGRectMake(20, self.view.frame.size.height - 64, self.view.frame.size.width - 40, 44);
    [readMoreBtn setTitle:@"Read more about me" forState:UIControlStateNormal];
    [readMoreBtn addTarget:self action:@selector(dismissViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:readMoreBtn];
}

#pragma mark - Content Management

- (void)setContent:(NSArray *)content
{
    self.scrollView.contentSize = CGSizeMake([content count] * self.view.frame.size.width, 0);
    
    for (int i = 0; i < [content count]; i++) {
        
        SJSPresentationSlide *slide = [[SJSPresentationSlide alloc] initWithFrame:CGRectMake(i * self.view.frame.size.width, 0, self.view.frame.size.height, self.view.frame.size.height)];
        slide.label.text = content[i][@"content"];
        slide.label.numberOfLines = (int)content[i][@"slide"];
        [self.scrollView addSubview:slide];
    }
    
    slidesCount =  (int)[content count];
}

- (void)showReadMoreBtn
{
    readMoreBtn.hidden = NO;
    
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        bottomView.alpha = 0.0;
        readMoreBtn.alpha = 1.0;
    } completion:^(BOOL finished) {
       
    }];
}

- (void)hideReadMoreBtn
{
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        bottomView.alpha = 1.0;
        readMoreBtn.alpha = 0.0;
    } completion:^(BOOL finished) {
        readMoreBtn.hidden = YES;
    }];
}

- (void)dismissViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if((scrollView.contentOffset.x + 30) / self.view.frame.size.width > slidesCount - 1)
        [self showReadMoreBtn];
    else {
        [self hideReadMoreBtn];
    }
}

@end
