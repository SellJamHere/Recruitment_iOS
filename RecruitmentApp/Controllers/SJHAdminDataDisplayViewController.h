//
//  SJHAdminDataDisplayViewController.h
//  RecruitmentApp
//
//  Created by James Heller on 8/16/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SJHAdminRecruitStatsView;

@interface SJHAdminDataDisplayViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *sideBar;
@property (weak, nonatomic) IBOutlet UIView *sortingSelectorView;
@property (weak, nonatomic) IBOutlet SJHAdminRecruitStatsView *recruitStatsView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)backButtonTouched:(id)sender;

@end
