//
//  SJHAppDelegate.h
//  RecruitmentApp
//
//  Created by James Heller on 8/5/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SJHAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
