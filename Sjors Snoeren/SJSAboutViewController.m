//
//  SJSAboutViewController.m
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 08-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import "SJSAboutViewController.h"

#import "UIImage+ImageEffects.h"

#import "SJSTextView.h"
#import "SJSAvatarImageView.h"

@interface SJSAboutViewController ()

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) SJSAvatarImageView *avatar;
@property (strong, nonatomic) SJSTextView *textView;

@end

@implementation SJSAboutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Sjors Snoeren";
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.scrollView];
    
    UIImage *bgImage = [[UIImage imageNamed:@"aboutBg"] applyDarkEffect];
    
    UIImageView *bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 240)];
    bg.image = bgImage;
    [self.scrollView addSubview:bg];
    
    self.avatar = [[SJSAvatarImageView alloc] initWithFrame:CGRectMake((bg.frame.size.width - 150) / 2, (bg.frame.size.height - 150) / 2, 150, 150)];
    self.avatar.image = [UIImage imageNamed:@"avatar"];
    [bg addSubview:self.avatar];
    
    self.textView = [[SJSTextView alloc] initWithFrame:CGRectMake(0, 240, self.view.frame.size.width, 0)];
    self.textView.text = @"My name is Sjors Snoeren, I'm 18 years old and I'm from the Netherlands. I'm currently studying Computer Science at Avans Hogeschool in Breda, I'm a first year's student. \n\nIn 2011 I started my own company 'Rockweb', nowadays called 'Pixelworks Media'. At Pixelworks Media I create digital products (websites and apps) for both companies and individuals. \n\nSince I've started Pixelworks Media, as a freelancer, I've been working on more than a hundred client projects. \n\nI really hope you will like this app. \n\nYours Sincerly, Sjors Snoeren";
    [self.textView resetFrame];
    [self.scrollView addSubview:self.textView];
    
    [self resetScrollViewContentSize];
}

- (void)resetScrollViewContentSize
{
    self.scrollView.contentSize = CGSizeMake(0, 240 + self.textView.frame.size.height);
}

@end
