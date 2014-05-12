//
//  SJSMenuViewController.m
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 07-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import "SJSMenuViewController.h"
#import "SJSViewController.h"
#import "SJSSidebarViewController.h"

#import "SJSAboutViewController.h"
#import "SJSExperienceViewController.h"
#import "SJSAppsViewController.h"
#import "SJSDribbbleViewController.h"
#import "SJSSocialViewController.h"

#import "SJSMenuTableView.h"

@interface SJSMenuViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *items;
}

@property (strong, nonatomic) SJSMenuTableView *tableView;

@end

@implementation SJSMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:40/255.0 green:43/255.0 blue:56/255.0 alpha:1.0];
    
    self.tableView = [[SJSMenuTableView alloc] initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, self.view.frame.size.height + 20)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    items = @[@"About", @"Jobs", @"Apps", @"Dribbble", @"Social Media"];
    
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    SJSMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell)
        cell = [[SJSMenuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    
    cell.textLabel.text = items[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SJSViewController *viewController;
    
    switch (indexPath.row) {
        case 0:
            viewController = [SJSAboutViewController new];
            break;
            
        case 1:
            viewController = [SJSExperienceViewController new];
            break;
            
        case 2:
            viewController = [SJSAppsViewController new];
            break;
            
        case 3:
            viewController = [SJSDribbbleViewController new];
            break;
            
        case 4:
            viewController = [SJSSocialViewController new];
            break;
            
        default:
            break;
    }
    
    SJSSidebarViewController *sidebarController = (SJSSidebarViewController *)self.parentViewController;
    
    if (viewController) {
        viewController.navigationController.navigationBar.tintColor = nil;
        [sidebarController setCenterViewController:viewController];
    }
}

@end
