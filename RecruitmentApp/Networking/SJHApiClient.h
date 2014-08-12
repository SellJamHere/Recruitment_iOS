//
//  SJHApiClient.h
//  RecruitmentApp
//
//  Created by James Heller on 8/11/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface SJHApiClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
