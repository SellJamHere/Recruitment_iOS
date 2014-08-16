//
//  SJHRecruitJSONModel.h
//  RecruitmentApp
//
//  Created by James Heller on 8/12/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import "JSONModel.h"

@class SJHRecruit;

@interface SJHRecruitJSONModel : JSONModel

@property (strong, nonatomic) NSString <Optional> *key;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSNumber <Optional> *year;
@property (strong, nonatomic) NSString <Optional> *major;
@property (strong, nonatomic) NSNumber <Optional> *isMale;

- (instancetype)initWithRecruit:(SJHRecruit *)recruit;

@end
