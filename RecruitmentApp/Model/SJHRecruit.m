//
//  SJHRecruitJSONModel.m
//  RecruitmentApp
//
//  Created by James Heller on 8/12/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import "SJHRecruit.h"

#import "SJHRecruitCoreData.h"

@implementation SJHRecruit

- (instancetype)init {
    self = [self initWithRecruit:nil];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithRecruit:(SJHRecruitCoreData *)recruit {
    self = [super init];
    if (self) {
        if (recruit) {
            self.key = recruit.key;
            self.name = recruit.name;
            self.email = recruit.email;
            self.year = recruit.year;
            self.major = recruit.major;
        }
    }
    return self;
}

+ (JSONKeyMapper *)keyMapper {
    NSDictionary *dictionary =  @{@"name": @"name",
                                  @"email": @"email",
                                  @"year": @"year",
                                  @"major": @"major"};
    
    return [[JSONKeyMapper alloc] initWithDictionary: dictionary];
}

@end