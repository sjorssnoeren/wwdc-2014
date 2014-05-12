//
//  SJSDetailViewController.m
//  Sjors Snoeren
//
//  Created by Sjors Snoeren on 07-04-14.
//  Copyright (c) 2014 Sjors Snoeren. All rights reserved.
//

#import "SJSDetailViewController.h"

@interface SJSDetailViewController ()
{
    CGRect _imageFrame;
    UIImage *_image;
    NSString *_url;
}

@property (strong, nonatomic) UIView *backgroundView;
@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation SJSDetailViewController

- (id)initWithImage:(UIImage *)image imageFrame:(CGRect)imageFrame shotUrl:(NSString *)url
{
    if (self = [super init]) {
        _image = image;
        _imageFrame = imageFrame;
        _url = url;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    
    self.backgroundView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.backgroundView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.8];
    self.backgroundView.alpha = 0.0;
    [self.view addSubview:self.backgroundView];
    
    self.imageView = [[UIImageView alloc] initWithFrame:_imageFrame];
    self.imageView.image = _image;
    self.imageView.layer.cornerRadius = 3.0;
    self.imageView.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:self.imageView];
    
    [UIView animateWithDuration:0.15 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.imageView.frame = CGRectMake(0, (self.view.frame.size.height - 240) / 2, 320, 240);
        self.backgroundView.alpha = 1.0;
    } completion:nil];
    
    UIButton *openBtn = [UIButton new];
    openBtn.frame = CGRectMake(0, self.view.frame.size.height - 60, self.view.frame.size.width, 60);
    openBtn.titleLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:18.0];
    
    [openBtn setTitle:@"View shot on dribbble" forState:UIControlStateNormal];
    [openBtn setTitleColor:[UIColor colorWithRed:234/255.0 green:76/255.0 blue:137/255.0 alpha:1.0] forState:UIControlStateNormal];
    
    [openBtn addTarget:self action:@selector(openUrl) forControlEvents:UIControlEventTouchUpInside];
    [self.backgroundView addSubview:openBtn];
    
    UIBarButtonItem *close = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStylePlain target:self action:@selector(dismissViewController)];
    self.navigationItem.leftBarButtonItem = close;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissViewController)];
    tap.numberOfTapsRequired = 1.0;
    [self.view addGestureRecognizer:tap];
    
}

- (void)dismissViewController
{
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.imageView.frame = _imageFrame;
        self.backgroundView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
}

- (void)openUrl
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_url]];
}

@end
