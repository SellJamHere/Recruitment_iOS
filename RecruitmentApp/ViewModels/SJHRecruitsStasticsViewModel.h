//
//  SJHRecruitsStasticsHelperViewModel.h
//  RecruitmentApp
//
//  Created by James Heller on 8/17/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SJHRecruitsStatisticsModel;

@interface SJHRecruitsStasticsViewModel : NSObject

@property (strong, nonatomic) SJHRecruitsStatisticsModel *recruitsStasticsModel;

- (instancetype)initWithRecruits:(NSArray *)recruits;

- (void)loadData;

@end
