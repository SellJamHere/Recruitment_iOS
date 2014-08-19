//
//  SJHRecruitsStatisticsHelper.h
//  RecruitmentApp
//
//  Created by James Heller on 8/17/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJHRecruitsStatisticsModel : NSObject

@property (nonatomic) NSInteger maleCount;
@property (nonatomic) NSInteger femaleCount;

@property (nonatomic) NSInteger graduate2015Count;
@property (nonatomic) NSInteger graduate2016Count;
@property (nonatomic) NSInteger graduate2017Count;
@property (nonatomic) NSInteger graduate2018Count;
@property (nonatomic) NSInteger graduate2019Count;
@property (nonatomic) NSInteger graduate2020Count;

@property (nonatomic) NSString *major0;
@property (nonatomic) NSInteger major0Count;
@property (nonatomic) NSString *major1;
@property (nonatomic) NSInteger major1Count;
@property (nonatomic) NSString *major2;
@property (nonatomic) NSInteger major2Count;
@property (nonatomic) NSString *major3;
@property (nonatomic) NSInteger major3Count;
@property (nonatomic) NSString *major4;
@property (nonatomic) NSInteger major4Count;

@end
