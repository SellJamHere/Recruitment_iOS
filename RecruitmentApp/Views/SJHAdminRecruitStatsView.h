//
//  SJHAdminRecruitStatsView.h
//  RecruitmentApp
//
//  Created by James Heller on 8/17/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SJHAdminRecruitStatsView : UIView

@property (weak, nonatomic) IBOutlet UILabel *maleCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *femaleCountLabel;

@property (weak, nonatomic) IBOutlet UILabel *freshmanCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *sophomoreCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *juniorCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *seniorCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *superSeniorCountLabel;

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
