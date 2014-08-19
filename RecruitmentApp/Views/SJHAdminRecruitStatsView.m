//
//  SJHAdminRecruitStatsView.m
//  RecruitmentApp
//
//  Created by James Heller on 8/17/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import "SJHAdminRecruitStatsView.h"

#import "SJHRecruitsStatisticsModel.h"

@implementation SJHAdminRecruitStatsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setRecruitsStasticsModel:(SJHRecruitsStatisticsModel *)recruitsStasticsModel {
    _recruitsStasticsModel = recruitsStasticsModel;
    [self loadViewData];
}

- (void)loadViewData {
    self.maleCountLabel.text = [NSString stringWithFormat:@"%ld", self.recruitsStasticsModel.maleCount];
    self.femaleCountLabel.text = [NSString stringWithFormat:@"%ld", self.recruitsStasticsModel.femaleCount];
    
    self.graduate2015CountLabel.text = [NSString stringWithFormat:@"%ld", self.recruitsStasticsModel.graduate2015Count];
    self.graduate2016CountLabel.text = [NSString stringWithFormat:@"%ld", self.recruitsStasticsModel.graduate2016Count];
    self.graduate2017CountLabel.text = [NSString stringWithFormat:@"%ld", self.recruitsStasticsModel.graduate2017Count];
    self.graduate2018CountLabel.text = [NSString stringWithFormat:@"%ld", self.recruitsStasticsModel.graduate2018Count];
    self.graduate2019CountLabel.text = [NSString stringWithFormat:@"%ld", self.recruitsStasticsModel.graduate2019Count];
    self.graduate2020CountLabel.text = [NSString stringWithFormat:@"%ld", self.recruitsStasticsModel.graduate2020Count];
    
    if (self.recruitsStasticsModel.major0Count) {
        self.major0Label.hidden = NO;
        self.major0Label.text = [NSString stringWithFormat:@"%@:", self.recruitsStasticsModel.major0];
        self.major0CountLabel.hidden = NO;
        self.major0CountLabel.text = [NSString stringWithFormat:@"%ld", self.recruitsStasticsModel.major0Count];
    }
    if (self.recruitsStasticsModel.major1Count) {
        self.major1Label.hidden = NO;
        self.major1Label.text = [NSString stringWithFormat:@"%@:", self.recruitsStasticsModel.major1];
        self.major1CountLabel.hidden = NO;
        self.major1CountLabel.text = [NSString stringWithFormat:@"%ld", self.recruitsStasticsModel.major1Count];
    }
    if (self.recruitsStasticsModel.major2Count) {
        self.major2Label.hidden = NO;
        self.major2Label.text = [NSString stringWithFormat:@"%@:", self.recruitsStasticsModel.major2];
        self.major2CountLabel.hidden = NO;
        self.major2CountLabel.text = [NSString stringWithFormat:@"%ld", self.recruitsStasticsModel.major2Count];
    }
    if (self.recruitsStasticsModel.major3Count) {
        self.major3Label.hidden = NO;
        self.major3Label.text = [NSString stringWithFormat:@"%@:", self.recruitsStasticsModel.major3];
        self.major3CountLabel.hidden = NO;
        self.major3CountLabel.text = [NSString stringWithFormat:@"%ld", self.recruitsStasticsModel.major3Count];
    }
    if (self.recruitsStasticsModel.major4Count) {
        self.major4Label.hidden = NO;
        self.major4Label.text = [NSString stringWithFormat:@"%@:", self.recruitsStasticsModel.major4];
        self.major4CountLabel.hidden = NO;
        self.major4CountLabel.text = [NSString stringWithFormat:@"%ld", self.recruitsStasticsModel.major4Count];
    }
}

@end
