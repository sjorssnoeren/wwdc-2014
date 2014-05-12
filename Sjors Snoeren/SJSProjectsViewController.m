//
//  SJSProjectsViewController.m
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 13-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import "SJSProjectsViewController.h"

@interface SJSProjectsViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_projects;
}

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation SJSProjectsViewController

- (id)initWithTitle:(NSString *)title projects:(NSArray *)projects
{
    if(self = [super init])
    {
        self.title = title;
        _projects = projects;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStylePlain target:self action:@selector(dismissViewController)];
}

- (void)dismissViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_projects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:identifier];
    
    cell.textLabel.text = _projects[indexPath.row][@"url"];
    cell.detailTextLabel.text = _projects[indexPath.row][@"title"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *url = _projects[indexPath.row][@"url"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

@end
