//
//  SJHAdminOnlineDataDisplayViewController.m
//  RecruitmentApp
//
//  Created by James Heller on 8/18/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import "SJHAdminOnlineDataDisplayViewController.h"

//#import <QuartzCore/QuartzCore.h>

#import "MBProgressHUD.h"
#import "HMSegmentedControl.h"

#import "SJHApiClient.h"
#import "SJHRecruitsStasticsViewModel.h"

#import "SJHRecruitTableViewCell.h"
#import "SJHAdminRecruitStatsView.h"

#import "SJHRecruitJSONModel.h"

@interface SJHAdminOnlineDataDisplayViewController ()

@property (strong, nonatomic) NSArray *recruits;

@property (strong, nonatomic) MBProgressHUD *hud;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

@property (strong, nonatomic) SJHRecruitsStasticsViewModel *recruitStasticsViewModel;

@end

@implementation SJHAdminOnlineDataDisplayViewController

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
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(loadData) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
    [self loadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButtonTouched:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)loadData {
    if ([[[SJHApiClient sharedClient] reachabilityManager] isReachable]) {
        self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        self.hud.labelText = @"Downloading";
        
        [[SJHApiClient sharedClient] recruitsGETSuccess:^(NSURLSessionDataTask *task, id responseObject) {
            
            NSError *error;
            NSMutableArray *recruits = [[NSMutableArray alloc] initWithCapacity:[responseObject count]];
            for (NSDictionary *recruitDict in responseObject) {
                SJHRecruitJSONModel *jsonRecruit = [[SJHRecruitJSONModel alloc] initWithDictionary:recruitDict error:&error];
                [recruits addObject: jsonRecruit];
                if (jsonRecruit.major == nil) {
                    jsonRecruit.major = @"Undecided/Undeclared";
                }
            }
            self.recruits = [recruits copy];
            self.recruitStasticsViewModel = [[SJHRecruitsStasticsViewModel alloc] initWithRecruits:self.recruits];
            [self.tableView reloadData];
            [self loadStats];
            
            [self.refreshControl endRefreshing];
            [self.hud hide:YES];
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
            [self.refreshControl endRefreshing];
            [self.hud hide:YES];
        }];
    }
    [self.refreshControl endRefreshing];
}

- (void)loadStats {
    self.recruitStatsView.recruitsStasticsModel = self.recruitStasticsViewModel.recruitsStasticsModel;
}

#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.recruits count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SJHRecruitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RecruitCell"];
    
    SJHRecruitJSONModel *recruit = self.recruits[indexPath.row];
        
    cell.nameLabel.text = recruit.name;
    cell.emailLabel.text = recruit.email;
    cell.majorLabel.text = recruit.major;
    cell.yearLabel.text = [recruit.year stringValue];
    if([recruit.isMale isEqual: @YES]) {
        cell.genderLabel.text = @"Male";
        cell.genderLabel.textColor = [UIColor blueColor];
    }
    else {
        cell.genderLabel.text = @"Female";
        cell.genderLabel.textColor = [UIColor colorWithRed:255/255.0 green:20/255.0 blue:147/255.0 alpha:1];
    }
    
//    if ([recruit.isUploaded isEqual:@YES]) {
//        cell.uploadedLabel.text = @"Yes";
//        cell.uploadedLabel.textColor = [UIColor colorWithRed:0 green:170/255.0 blue:0 alpha:1];
//    }
//    else {
//        cell.uploadedLabel.text = @"No";
//        cell.uploadedLabel.textColor = [UIColor redColor];
//    }
    
    return cell;
}

#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
