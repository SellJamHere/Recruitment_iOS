//
//  SJHApiClient.h
//  RecruitmentApp
//
//  Created by James Heller on 8/11/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@class SJHRecruit;

@interface SJHApiClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

- (NSURLSessionTask *)recruitsGETSuccess:(void ( ^ ) ( NSURLSessionDataTask *task , id responseObject ))success failure:(void ( ^ ) ( NSURLSessionDataTask *task , NSError *error ))failure;

- (NSURLSessionTask *)recruitPOST:(SJHRecruit *)recruit success:(void ( ^ ) ( NSURLSessionDataTask *task , id responseObject ))success failure:(void ( ^ ) ( NSURLSessionDataTask *task , NSError *error ))failure;

@end
