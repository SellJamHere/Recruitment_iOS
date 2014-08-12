//
//  Recruit.m
//  RecruitmentApp
//
//  Created by James Heller on 8/12/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import "SJHRecruitCoreData.h"

#import "SJHRecruit.h"

@implementation SJHRecruitCoreData

@dynamic key;
@dynamic name;
@dynamic email;
@dynamic year;
@dynamic major;

- (SJHRecruit *)JSONRecruit {
    return [[SJHRecruit alloc] initWithRecruit:self];
}

@end
