//
//  Recruit.m
//  RecruitmentApp
//
//  Created by James Heller on 8/12/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import "SJHRecruit.h"

#import "SJHRecruitJSONModel.h"

@implementation SJHRecruit

@dynamic key;
@dynamic name;
@dynamic email;
@dynamic year;
@dynamic major;

- (SJHRecruitJSONModel *)JSONRecruit {
    return [[SJHRecruitJSONModel alloc] initWithRecruit:self];
}

@end
