//
//  SJSShowcaseViewController.m
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 11-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import "SJSShowcaseViewController.h"

#import "SJSWorkSlide.h"
#import "SJSLogoPageControl.h"

@interface SJSShowcaseViewController () <SJSLogoPageControlDelegate>
{
    NSMutableArray *titles;
}

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) SJSLogoPageControl *pageControl;

@end

@implementation SJSShowcaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
    
    self.pageControl = [[SJSLogoPageControl alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 60, self.view.frame.size.width, 40)];
    self.pageControl.delegate = self;
    [self.view addSubview:self.pageControl];
}

- (void)reloadData
{
    self.scrollView.contentSize = CGSizeMake([self.data count] * self.view.frame.size.width, 0);
    titles = [NSMutableArray new];
    
    for(int i = 0; i < [self.data count]; i++) {
        
        SJSWorkSlide *slide = [[SJSWorkSlide alloc] initWithFrame:CGRectMake(i * self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
        
        self.currentItem = self.data[i];
        slide.backgroundColor = self.currentItem[@"color"];
        
        slide.logo = [UIImage imageNamed:[self.currentItem[@"title"] lowercaseString]];
        slide.desc = self.currentItem[@"desc"];
        
        if(self.currentItem[@"darkText"]) {
            slide.textView.textColor = [UIColor colorWithWhite:0.2 alpha:1.0];
            slide.pageControlBg.hidden = NO;
        }
        
        if(self.currentItem[@"year"])
            slide.year = self.currentItem[@"year"];
        
        [self.scrollView addSubview:slide];
        
        [titles addObject:self.data[i][@"title"]];
    }
    
    [self.pageControl setLogos:titles];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int index = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    self.currentItem = self.data[index];
    self.title = self.currentItem[@"title"];
    
    if(!self.currentItem[@"darkText"]) {
        self.navigationController.navigationBar.tintColor = self.currentItem[@"color"];
    }
    else {
        self.navigationController.navigationBar.tintColor = nil;
    }
    
    [self.pageControl setActive:index];
}

#pragma mark - SJSLogoPageControlDelegate

- (void)pageControlButtonTapped:(UIButton *)sender
{
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.scrollView.contentOffset = CGPointMake((sender.tag - 10) * self.scrollView.frame.size.width, self.scrollView.contentOffset.y);
    } completion:nil];
}

@end
