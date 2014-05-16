//
//  SJSAppsViewController.m
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 09-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import "SJSAppsViewController.h"

@interface SJSAppsViewController ()
{
    NSURL *url;
}

@end

@implementation SJSAppsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.data = @[@{@"title": @"Sportbuddy",
                    @"desc": @"Sportbuddy is the first real app I've launched. It was based on an idea of a friend of mine. It's a timer where you can add players to a list and tap on them to assign the current time to their name.",
                    @"color": [UIColor colorWithRed:213/255.0 green:0/255.0 blue:0/255.0 alpha:1.0],
                    @"year": @"2012",
                    @"url": @"https://itunes.apple.com/us/app/sportbuddy/id556435077?mt=8&uo=4",
                    @"btn-title": @"Download"},
                  
                  @{@"title": @"Domainy",
                    @"desc": @"A good domain is a must-have these days, Domainy enables you to check whether your desired domain is still available or not. Checking domains without distraction is what this app is about. We've also improved the experience with simple gestures",
                    @"color": [UIColor colorWithRed:51/255.0 green:184/255.0 blue:174/255.0 alpha:1.0],
                    @"year": @"2014",
                    @"url": @"https://itunes.apple.com/us/app/domainy/id811998486?mt=8&uo=4",
                    @"btn-title": @"Download"},
                
                  @{@"title": @"Droodle",
                    @"desc": @"Droodle is a simple dutch word game. There are over 300 puzzles with their own creative word placement which illustrates the solution.",
                    @"color": [UIColor colorWithRed:0/255.0 green:186/255.0 blue:255/255.0 alpha:1.0],
                    @"year": @"Soon",
                    @"url": @"http://www.droodle.be",
                    @"btn-title": @"Promo site"},
                
                  @{@"title": @"Folio",
                    @"desc" : @"eBooks are expensive and not every book is online yet. We try to change that. We're creating a simple platform for Web & iOS. You'll need a subscription, but that will give you unlimited access to our library of (dutch) books.",
                    @"color": [UIColor colorWithRed:213/255.0 green:74/255.0 blue:81/255.0 alpha:1.0],
                    @"year": @"Soon",
                    @"url": @"http://folioapp.nl",
                    @"btn-title": @"Promo site"},
                 
                  @{@"title": @"Remindrugs",
                    @"desc": @"Most people often forget to take their drugs in time. To prevent that we are creating a easy-to-use app that sends a push notification every time you need to take your drugs.",
                    @"color": [UIColor colorWithRed:0/255.0 green:158/255.0 blue:236/255.0 alpha:1.0],
                    @"year": @"Soon",
                    @"url": @"http://remindrugs.com",
                    @"btn-title": @"Promo site"}];
    
    [self reloadData];
}

- (void)openUrl
{
    if(url)
        [[UIApplication sharedApplication] openURL:url];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [super scrollViewDidScroll:scrollView];
    
    int index = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:self.data[index][@"btn-title"] style:UIBarButtonItemStylePlain target:self action:@selector(openUrl)];
    url = [NSURL URLWithString:self.data[index][@"url"]];
}

@end
