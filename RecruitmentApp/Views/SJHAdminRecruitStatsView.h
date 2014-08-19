//
//  SJHAdminRecruitStatsView.h
//  RecruitmentApp
//
//  Created by James Heller on 8/17/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SJHRecruitsStatisticsModel;

@interface SJHAdminRecruitStatsView : UIView

@property (weak, nonatomic) SJHRecruitsStatisticsModel *recruitsStasticsModel;

@property (weak, nonatomic) IBOutlet UILabel *maleCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *femaleCountLabel;

@property (weak, nonatomic) IBOutlet UILabel *graduate2015CountLabel;
@property (weak, nonatomic) IBOutlet UILabel *graduate2016CountLabel;
@property (weak, nonatomic) IBOutlet UILabel *graduate2017CountLabel;
@property (weak, nonatomic) IBOutlet UILabel *graduate2018CountLabel;
@property (weak, nonatomic) IBOutlet UILabel *graduate2019CountLabel;
@property (weak, nonatomic) IBOutlet UILabel *graduate2020CountLabel;

@property (weak, nonatomic) IBOutlet UILabel *major0Label;
@property (weak, nonatomic) IBOutlet UILabel *major0CountLabel;
@property (weak, nonatomic) IBOutlet UILabel *major1Label;
@property (weak, nonatomic) IBOutlet UILabel *major1CountLabel;
@property (weak, nonatomic) IBOutlet UILabel *major2Label;
@property (weak, nonatomic) IBOutlet UILabel *major2CountLabel;
@property (weak, nonatomic) IBOutlet UILabel *major3Label;
@property (weak, nonatomic) IBOutlet UILabel *major3CountLabel;
@property (weak, nonatomic) IBOutlet UILabel *major4Label;
@property (weak, nonatomic) IBOutlet UILabel *major4CountLabel;

@end
