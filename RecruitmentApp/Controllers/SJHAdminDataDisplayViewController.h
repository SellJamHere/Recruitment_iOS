//
//  SJHAdminDataDisplayViewController.h
//  RecruitmentApp
//
//  Created by James Heller on 8/16/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SJHAdminDataDisplayType) {
    SJHAdminDataDisplayTypeLocal,
    SJHAdminDataDisplayTypeOnline
};

@interface SJHAdminDataDisplayViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) SJHAdminDataDisplayType displayType;

@property (weak, nonatomic) IBOutlet UIView *sideBar;
@property (weak, nonatomic) IBOutlet UIView *sortingSelectorView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)backButtonTouched:(id)sender;

@end
