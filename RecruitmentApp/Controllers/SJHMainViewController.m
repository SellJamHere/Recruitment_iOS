//
//  SJHMainViewController.m
//  RecruitmentApp
//
//  Created by James Heller on 8/5/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import "SJHMainViewController.h"

#import "UIViewController+AutorotateRules.h"

@interface SJHMainViewController ()

@end

@implementation SJHMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.contentViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SJHImageSlideShowViewController"];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.direction = REFrostedViewControllerDirectionTop;
    
    self.menuViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SJHRegistrationViewController"];
    
    self.liveBlur = NO;
    self.blurRadius = 5.0;
    
//    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(presentMenuViewController) userInfo:nil repeats:NO];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    CGSize menuSize = CGSizeMake(self.menuViewController.view.bounds.size.height, self.menuViewController.view.bounds.size.width);
    self.menuViewSize = self.menuViewController.view.bounds.size;
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

@end
