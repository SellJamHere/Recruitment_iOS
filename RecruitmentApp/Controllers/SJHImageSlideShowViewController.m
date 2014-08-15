//
//  SJHImageSlideShowViewController.m
//  RecruitmentApp
//
//  Created by James Heller on 8/5/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import "SJHImageSlideShowViewController.h"

#import "UIViewController+AutorotateRules.h"
#import "UIViewController+REFrostedViewController.h"
#import "REFrostedViewController.h"

#import "KASlideshow.h"

#define kSlideShowImageString @"image0.jpg", @"image1.jpg", @"image2.jpg", @"image3.jpg", @"image4.jpg"

@interface SJHImageSlideShowViewController ()

@end

@implementation SJHImageSlideShowViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.slideShowContainerView setDelay:5.0];
    [self.slideShowContainerView setTransitionDuration:1.0];
    [self.slideShowContainerView setTransitionType:KASlideShowTransitionFade];
    [self.slideShowContainerView setImagesContentMode:UIViewContentModeScaleAspectFill];
    [self.slideShowContainerView addImagesFromResources:@[kSlideShowImageString]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    NSLog(@"%@", NSStringFromCGSize(self.view.bounds.size));
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.touchView.frame = CGRectMake(0, 0, 1024, 768);
    
    [self.slideShowContainerView start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)viewTouched:(id)sender {
    [self.frostedViewController presentMenuViewController];
}

- (IBAction)settingsButtonTouched:(id)sender {
    //Show Settings View
}

@end
