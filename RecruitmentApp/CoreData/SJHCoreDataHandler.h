//
//  SJHCoreDataHandler.h
//  RecruitmentApp
//
//  Created by James Heller on 8/12/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SJHRecruit;

@interface SJHCoreDataHandler : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (instancetype)dataHandler;

- (NSArray *)getRecruits;    //Returns SJHRecruit array
- (void)saveRecruit:(SJHRecruit *)recruit;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
