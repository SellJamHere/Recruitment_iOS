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
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

- (SJHRecruit *)newRecruit;                                 //Returns fresh managed recruit
- (BOOL)recruitAlreadyStoredForEmail:(NSString *)email;     //Checks if recruit has been stored locally
- (NSArray *)getRecruits;                                   //Returns SJHRecruit array
- (NSArray *)getRecruitsNotUploaded;                        //Returns SJHRecruit array
- (NSArray *)getRecruitsUploaded;                           //Returns SJHRecruit array

//Recruit Stats Queries
//- (NSInteger)countMaleRecruits;
//- (NSInteger)countFemaleRecruits;

@end
