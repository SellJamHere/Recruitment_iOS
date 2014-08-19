//
//  SJHAdminDataDisplayViewController.m
//  RecruitmentApp
//
//  Created by James Heller on 8/16/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import "SJHAdminDataDisplayViewController.h"

#import <QuartzCore/QuartzCore.h>

#import "MBProgressHUD.h"
#import "HMSegmentedControl.h"

#import "SJHCoreDataHandler.h"
#import "SJHRecruitsStasticsViewModel.h"

#import "SJHRecruitTableViewCell.h"
#import "SJHAdminRecruitStatsView.h"

#import "SJHRecruit.h"

@interface SJHAdminDataDisplayViewController ()

@property (strong, nonatomic) NSArray *recruits;
@property (strong, nonatomic) NSArray *uploadedRecruits;
@property (strong, nonatomic) NSArray *notUploadedRecruits;

@property (strong, nonatomic) HMSegmentedControl *sortingSelector;

@property (strong, nonatomic) SJHRecruitsStasticsViewModel *recruitStasticsViewModel;

@end

@implementation SJHAdminDataDisplayViewController

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
    [self loadSortingSelector];
    
    
    
    [self loadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadSortingSelector {
    self.sortingSelector = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"Total", @"Uploaded", @"Not Yet"]];
    self.sortingSelector.backgroundColor = [UIColor clearColor];
    self.sortingSelector.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    self.sortingSelector.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.sortingSelector.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:16.0f];
    self.sortingSelector.selectionIndicatorColor = [UIColor colorWithRed:0 green:100/255.0 blue:164/255.0 alpha:1];
    __block UITableView *tableview = self.tableView;
    [self.sortingSelector setIndexChangeBlock:^(NSInteger index) {
        [tableview reloadData];
    }];
    
    self.sortingSelector.frame = self.sortingSelectorView.bounds;
    [self.sortingSelector removeFromSuperview];
    [self.sortingSelectorView addSubview:self.sortingSelector];
}

- (void)loadData {
    //load all saved recruits
    self.recruits = [[SJHCoreDataHandler dataHandler] getRecruits];
    self.recruitStasticsViewModel = [[SJHRecruitsStasticsViewModel alloc] initWithRecruits:self.recruits];
    //uploaded recruits
    self.uploadedRecruits = [self.recruits filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"isUploaded = YES"]];
    //not uploaded recruits
    self.notUploadedRecruits = [self.recruits filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"isUploaded = NO"]];
    
    //load stats
    [self loadStats];
}

- (void)loadStats {
    self.recruitStatsView.recruitsStasticsModel = self.recruitStasticsViewModel.recruitsStasticsModel;
}

- (IBAction)backButtonTouched:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if ([self.sortingSelector selectedSegmentIndex] == 0) {
        //Total
        return [self.recruits count];
    }
    else if ([self.sortingSelector selectedSegmentIndex] == 1) {
        //Uploaded
        return [self.uploadedRecruits count];
    }
    else if ([self.sortingSelector selectedSegmentIndex] == 2) {
        //Not yet uploaded
        return [self.notUploadedRecruits count];
    }
    
    return [self.recruits count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SJHRecruitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RecruitCell"];
    
    SJHRecruit *recruit;
    if ([self.sortingSelector selectedSegmentIndex] == 0) {
        //Total
        recruit = self.recruits[indexPath.row];
    }
    else if ([self.sortingSelector selectedSegmentIndex] == 1) {
        //Uploaded
        recruit = self.uploadedRecruits[indexPath.row];
    }
    else if ([self.sortingSelector selectedSegmentIndex] == 2) {
        //Not yet uploaded
        recruit = self.notUploadedRecruits[indexPath.row];
    }
    
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
    
    if ([recruit.isUploaded isEqual:@YES]) {
        cell.uploadedLabel.text = @"Yes";
        cell.uploadedLabel.textColor = [UIColor colorWithRed:0 green:170/255.0 blue:0 alpha:1];
    }
    else {
        cell.uploadedLabel.text = @"No";
        cell.uploadedLabel.textColor = [UIColor redColor];
    }
    
    return cell;
}

#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
