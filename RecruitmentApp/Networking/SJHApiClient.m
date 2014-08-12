//
//  SJHApiClient.m
//  RecruitmentApp
//
//  Created by James Heller on 8/11/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import "SJHApiClient.h"

@implementation SJHApiClient

static NSString * const kBaseUrlString = @"http://uci-sailing-recruitment.appspot.com";

+ (instancetype)sharedClient {
    static SJHApiClient *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] initWithBaseURL:[NSURL URLWithString:kBaseUrlString]];
    });
    
    return sharedInstance;
}


- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        [self.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusReachableViaWiFi:
                case AFNetworkReachabilityStatusReachableViaWWAN:
                    //Upload stored recruits
                    break;
                case AFNetworkReachabilityStatusNotReachable:
                    
                    break;
                default:
                    break;
            }
        }];
    }
    return self;
}

@end
