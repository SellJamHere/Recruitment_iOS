//
//  SJHRecruit.m
//  RecruitmentApp
//
//  Created by James Heller on 8/12/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import "SJHRecruit.h"

#import "SJHRecruitJSONModel.h"

@implementation SJHRecruit

@dynamic email;
@dynamic key;
@dynamic major;
@dynamic name;
@dynamic year;
@dynamic uploaded;

- (SJHRecruitJSONModel *)JSONrecruit {
    return [[SJHRecruitJSONModel alloc] initWithRecruit:self];
}

@end
