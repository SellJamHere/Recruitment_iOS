//
//  SJHAdminSettingsTabBarController.m
//  RecruitmentApp
//
//  Created by James Heller on 8/16/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import "SJHAdminSettingsTabBarController.h"

#import "SJHAdminDataDisplayViewController.h"

@interface SJHAdminSettingsTabBarController ()

@end

@implementation SJHAdminSettingsTabBarController

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
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    for (NSInteger i = 0; i < [self.viewControllers count]; i++) {
        
        if ([self.viewControllers[i] isKindOfClass:[SJHAdminDataDisplayViewController class]]) {
        
            SJHAdminDataDisplayViewController *adminDataDisplayController = self.viewControllers[i];
            switch (i) {
                case SJHAdminDataDisplayTypeLocal: {
                    adminDataDisplayController.displayType = SJHAdminDataDisplayTypeLocal;
                    adminDataDisplayController.tabBarItem.title = @"Local";
                    break;
                }
                case SJHAdminDataDisplayTypeOnline: {
                    adminDataDisplayController.displayType = SJHAdminDataDisplayTypeOnline;
                    adminDataDisplayController.tabBarItem.title = @"Online";
                    break;
                }
                default:
                    break;
            }
            adminDataDisplayController.displayType = (SJHAdminDataDisplayType)i;
        }
    }
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

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    NSLog(segue);
//}

@end
