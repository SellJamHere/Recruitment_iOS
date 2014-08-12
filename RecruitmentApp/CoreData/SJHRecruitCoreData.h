//
//  Recruit.h
//  RecruitmentApp
//
//  Created by James Heller on 8/12/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SJHRecruit;

@interface SJHRecruitCoreData : NSManagedObject

@property (nonatomic, retain) NSString * key;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSNumber * year;
@property (nonatomic, retain) NSString * major;

- (SJHRecruit *)JSONRecruit;

@end