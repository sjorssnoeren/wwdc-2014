//
//  SJSExperienceViewController.m
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 11-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import "SJSExperienceViewController.h"
#import "SJSProjectsViewController.h"

@interface SJSExperienceViewController ()

@end

@implementation SJSExperienceViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.data = @[@{@"title": @"HawQRate",
                    @"desc": @"I've created serveral apps for clients of the company HawQRate. I have also created the HawQRate web app: make clients able to rate your services by scanning a QR code.",
                    @"color": [UIColor colorWithRed:19/255.0 green:170/255.0 blue:140/255.0 alpha:1.0],
                    @"year": @"2012",
                    @"projects": @[@{@"url": @"https://itunes.apple.com/nl/app/iris/id566839763?mt=8&uo=4", @"title": @"Iris App"},
                                   @{@"url": @"https://itunes.apple.com/nl/app/facility/id632600493?mt=8&uo=4", @"title": @"Facility App"},
                                   @{@"url": @"http://hawqrate.com", @"title": @"HawQRate Web App"}]},
                  
                  @{@"title": @"Yummygum",
                    @"desc" : @"Yummygum is one of the companies I've always wanted to work for. One day they asked my help for a few webprojects. I've also created a big part of their portfolio site.",
                    @"darkText": @YES,
                    @"color": [UIColor whiteColor],
                    @"year": @"2013",
                    @"projects": @[@{@"url": @"http://yummygum.com", @"title": @"Yummygum site"}]},
                  
                  @{@"title": @"76interactive",
                    @"desc": @"Nowadays I'm helping this local company by creating Web and iOS apps. It's a small team of 3 members. I help them out when they need an extra hand.",
                    @"color": [UIColor colorWithWhite:40/255.0 alpha:1.0],
                    @"year": @"Current",
                    @"projects": @[@{@"url": @"http://altijdhoren.nl", @"title": @"Atlijd Horen site"},
                                   @{@"url": @"http://oudehaven.nl", @"title": @"Oude Haven site"},
                                   @{@"url": @"http://bredainconcert.com", @"title": @"Breda in Concert site"},
                                   @{@"url": @"http://76interactive.com", @"title": @"76interactive site"},
                                   @{@"url": @"https://itunes.apple.com/nl/app/roadie/id634906056?mt=8&uo=4", @"title": @"Roadie app"}]},
                  
                  @{@"title": @"Pixelworks",
                    @"desc": @"I started my own business in 2011. After 4 years I worked on more than a hunderd projects for clients worldwide. In projects you can view a bunch of them.",
                    @"darkText": @YES,
                    @"color": [UIColor whiteColor],
                    @"year": @"Current",
                    @"projects": @[@{@"url": @"http://amtcg.com", @"title": @"AMTCG site"},
                                   @{@"url": @"http://blackcreativeboutique.com", @"title": @"Black CB site"},
                                   @{@"url": @"http://dominikmartin.co", @"title": @"Dominik Martin site"},
                                   @{@"url": @"http://goscreenworks.com", @"title": @"Go ScreenWorks site"},
                                   @{@"url": @"http://kinderkledingbeursoosterhout.nl", @"title": @"Kinderkledingbeurs Site"},
                                   @{@"url": @"http://markvanleeuwen.co", @"title": @"Mark van Leeuwen site"},
                                   @{@"url": @"http://measureapp.com", @"title": @"Measure App site"},
                                   @{@"url": @"http://nandobennis.com", @"title": @"Nando Bennis site"},
                                   @{@"url": @"http://nocospraynederland.nl", @"title": @"Nocospray Site"},
                                   @{@"url": @"http://petervandenbroek.nl", @"title": @"Peter van den Broek site"},
                                   @{@"url": @"http://soledier.com", @"title": @"Soledier site"}]}];
    
    [self reloadData];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Projects" style:UIBarButtonItemStylePlain target:self action:@selector(openProjects)];
}

- (void)openProjects
{
    SJSProjectsViewController *projectsVc = [[SJSProjectsViewController alloc] initWithTitle:self.currentItem[@"title"] projects:self.currentItem[@"projects"]];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:projectsVc];
    
    if (!self.currentItem[@"darkText"])
        navController.navigationBar.tintColor = self.currentItem[@"color"];
    
    [self.navigationController presentViewController:navController animated:YES completion:nil];
}

@end
