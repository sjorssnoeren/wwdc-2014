//
//  SJSSocialViewController.m
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 12-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import "SJSSocialViewController.h"

@interface SJSSocialViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *links;
}

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation SJSSocialViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Social Media";
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 50.0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    links = @[@{@"title": @"Twitter",
                @"url": @"http://twitter.com/sjorssnoeren",
                @"color": [UIColor colorWithRed:85/255.0 green:172/255.0 blue:238/255.0 alpha:1.0]},
              
              @{@"title": @"Facebook",
                @"url" : @"http://facebook.com/sjorssnoeren",
                @"color": [UIColor colorWithRed:59/255.0 green:89/255.0 blue:152/255.0 alpha:1.0]},
              
              @{@"title": @"Dribbble",
                @"url": @"http://dribbble.com/sjorssnoeren",
                @"color": [UIColor colorWithRed:234/255.0 green:76/255.0 blue:137/255.0 alpha:1.0]},
              
              @{@"title": @"LinkedIN",
                @"url": @"http://www.linkedin.com/in/sjorssnoeren",
                @"color": [UIColor colorWithRed:14/255.0 green:118/255.0 blue:168/255.0 alpha:1.0]},
    
              @{@"title": @"hello@sjors.me",
                @"url": @"mailto:hello@sjors.me",
                @"color": [UIColor colorWithWhite:0.2 alpha:1.0]}];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [links count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    
    cell.backgroundColor = links[indexPath.row][@"color"];
    cell.textLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:16.0];
    cell.textLabel.text = links[indexPath.row][@"title"];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *url = [links[indexPath.row][@"url"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

@end
