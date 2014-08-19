//
//  SJHRecruitsStasticsHelperViewModel.m
//  RecruitmentApp
//
//  Created by James Heller on 8/17/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import "SJHRecruitsStasticsViewModel.h"

#import "SJHCoreDataHandler.h"

#import "SJHRecruitsStatisticsModel.h"
#import "SJHRecruit.h"

@interface SJHRecruitsStasticsViewModel ()

@property (weak, nonatomic) NSArray *recruits;

@end

@implementation SJHRecruitsStasticsViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.recruitsStasticsModel = [[SJHRecruitsStatisticsModel alloc] init];
    }
    return self;
}

- (instancetype)initWithRecruits:(NSArray *)recruits {
    self = [self init];
    if (self) {
        self.recruits = recruits;
        [self loadData];
    }
    return self;
}

- (void)loadData {
    self.recruitsStasticsModel.maleCount = [self countMaleRecruits];
    self.recruitsStasticsModel.femaleCount = [self countFemaleRecruits];
    
    self.recruitsStasticsModel.graduate2015Count = [self count2015];
    self.recruitsStasticsModel.graduate2016Count = [self count2016];
    self.recruitsStasticsModel.graduate2017Count = [self count2017];
    self.recruitsStasticsModel.graduate2018Count = [self count2018];
    self.recruitsStasticsModel.graduate2019Count = [self count2019];
    self.recruitsStasticsModel.graduate2020Count = [self count2020];
    
    [self setTopMajors];
}

#pragma mark - Gender Count

- (NSInteger)countMaleRecruits {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isMale = YES"];
    
    NSArray *maleArray = [self.recruits filteredArrayUsingPredicate:predicate];
    
    return [maleArray count];

}

- (NSInteger)countFemaleRecruits {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isMale = NO"];
    
    NSArray *maleArray = [self.recruits filteredArrayUsingPredicate:predicate];
    
    return [maleArray count];
}

#pragma mark Graduation Year Count

- (NSInteger)count2015 {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"year == 2015"];
    
    NSArray *maleArray = [self.recruits filteredArrayUsingPredicate:predicate];
    
    return [maleArray count];
}

- (NSInteger)count2016 {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"year == 2016"];
    
    NSArray *maleArray = [self.recruits filteredArrayUsingPredicate:predicate];
    
    return [maleArray count];
}

- (NSInteger)count2017 {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"year == 2017"];
    
    NSArray *maleArray = [self.recruits filteredArrayUsingPredicate:predicate];
    
    return [maleArray count];
}

- (NSInteger)count2018 {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"year == 2018"];
    
    NSArray *maleArray = [self.recruits filteredArrayUsingPredicate:predicate];
    
    return [maleArray count];
}

- (NSInteger)count2019 {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"year == 2019"];
    
    NSArray *maleArray = [self.recruits filteredArrayUsingPredicate:predicate];
    
    return [maleArray count];
}

- (NSInteger)count2020 {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"year == 2020"];
    
    NSArray *maleArray = [self.recruits filteredArrayUsingPredicate:predicate];
    
    return [maleArray count];
}

#pragma mark Top Majors Count

- (void)setTopMajors {
    //Generate dictionary of majors <major, count>
    NSMutableDictionary *majorDict = [[NSMutableDictionary alloc] init];
    for (SJHRecruit *recruit in self.recruits) {
        NSNumber *count = [majorDict objectForKey:recruit.major];
        [majorDict setObject:@([count intValue] + 1) forKey:recruit.major];
    }
    
    //Order the majors
    NSArray *orderedMajors = [majorDict keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [(NSNumber *)obj2 compare:(NSNumber *)obj1];
    }];
    
    if ([orderedMajors count] >= 1) {
        self.recruitsStasticsModel.major0 = orderedMajors[0];
        self.recruitsStasticsModel.major0Count = [[majorDict objectForKey:orderedMajors[0]] integerValue];
    }
    if ([orderedMajors count] >= 2) {
        self.recruitsStasticsModel.major1 = orderedMajors[1];
        self.recruitsStasticsModel.major1Count = [[majorDict objectForKey:orderedMajors[1]] integerValue];
    }
    if ([orderedMajors count] >= 3) {
        self.recruitsStasticsModel.major2 = orderedMajors[2];
        self.recruitsStasticsModel.major2Count = [[majorDict objectForKey:orderedMajors[2]] integerValue];
    }
    if ([orderedMajors count] >= 4) {
        self.recruitsStasticsModel.major3 = orderedMajors[3];
        self.recruitsStasticsModel.major3Count = [[majorDict objectForKey:orderedMajors[3]] integerValue];
    }
    if ([orderedMajors count] >= 5) {
        self.recruitsStasticsModel.major4 = orderedMajors[4];
        self.recruitsStasticsModel.major4Count = [[majorDict objectForKey:orderedMajors[4]] integerValue];
    }
}

@end
