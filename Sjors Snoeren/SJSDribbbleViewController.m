//
//  SJSDribbbleViewController.m
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 07-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import "SJSDribbbleViewController.h"
#import "SJSDetailViewController.h"

#import "SJSWorkCollectionViewCell.h"

#import "SJSDribbbleModel.h"
#import "SJSAsynchronousImage.h"

@interface SJSDribbbleViewController () <UICollectionViewDataSource,  UICollectionViewDelegate>
{
    NSArray *shots;
    UICollectionViewFlowLayout *flowLayout;
}

@property (strong, nonatomic) UICollectionView *collectionView;

@end

@implementation SJSDribbbleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Dribbble";
    
    flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.itemSize = CGSizeMake(160, 120);
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.collectionView];
    
    [SJSDribbbleModel loadDribbbleWithCompletion:^(BOOL success, NSArray *response) {
        if (success) {
            shots = response;

            dispatch_async(dispatch_get_main_queue(), ^{
                [self.collectionView reloadData];
            });
        }
        else {
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Something went wrong" message:@"This app was not able to load Sjors Snoeren's latest dribbble shots" delegate:self cancelButtonTitle:@"Too bad" otherButtonTitles:nil, nil];
                [alertView show];
            });
        }
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [shots count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView registerClass:[SJSWorkCollectionViewCell class] forCellWithReuseIdentifier:indexPath.description];
    SJSWorkCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:indexPath.description forIndexPath:indexPath];
    
    [SJSAsynchronousImage loadImageWithUrl:shots[indexPath.row][@"image_teaser_url"] completion:^(BOOL success, UIImage *image) {
        if (success) {
            dispatch_async(dispatch_get_main_queue(), ^{
                SJSWorkCollectionViewCell *cell = (id)[collectionView cellForItemAtIndexPath:indexPath];
                if (cell)
                    cell.thumbView.image = image;
            });
        }
    }];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [SJSAsynchronousImage loadImageWithUrl:shots[indexPath.row][@"image_url"] completion:^(BOOL success, UIImage *image) {
        dispatch_async(dispatch_get_main_queue(), ^{
            CGRect rect = [collectionView convertRect:[self rectForCellatIndexPath:indexPath] toView:[collectionView superview]];
            
            SJSDetailViewController *viewController = [[SJSDetailViewController alloc] initWithImage:image imageFrame:rect shotUrl:shots[indexPath.row][@"short_url"]];
            viewController.title = shots[indexPath.row][@"title"];
            UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
            [navController setNavigationBarHidden:YES];
            
            navController.transitioningDelegate = self;
            navController.modalPresentationStyle = UIModalPresentationCustom;
            [self presentViewController:navController animated:YES completion:nil];
        });
    }];
}

- (CGRect)rectForCellatIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
    
    if (!cell)
        return CGRectZero;
    
    return cell.frame;
}

@end
