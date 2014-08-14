//
//  SJHRegistrationHelper.m
//  RecruitmentApp
//
//  Created by James Heller on 8/14/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import "SJHRegistrationHelper.h"

@implementation SJHRegistrationHelper

+ (BOOL)isValidEmailAddress:(NSString *)emailAddress {
    if([emailAddress length] != 0){
        NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
        return [emailTest evaluateWithObject:emailAddress];
    }
    return NO;
}

@end
