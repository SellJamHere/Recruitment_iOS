//
//  SJHCoreDataHandler.m
//  RecruitmentApp
//
//  Created by James Heller on 8/12/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import "SJHCoreDataHandler.h"

#import "SJHApiClient.h"

#import "SJHRecruit.h"
#import "SJHRecruitJSONModel.h"

@implementation SJHCoreDataHandler

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

+ (instancetype)dataHandler {
    static SJHCoreDataHandler *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        [sharedInstance managedObjectContext];
        
        //Set Reachability
        [[[SJHApiClient sharedClient] reachabilityManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusReachableViaWiFi:
                case AFNetworkReachabilityStatusReachableViaWWAN:
                    
                    //Upload stored recruits
                    [sharedInstance uploadRecruits];
                    
                    break;
                case AFNetworkReachabilityStatusNotReachable:
                    
                    

                    break;
                default:
                    break;
            }
        }];
        [[[SJHApiClient sharedClient] reachabilityManager] startMonitoring];
    });
    
    return sharedInstance;
}

#pragma mark - Data Access

- (SJHRecruit *)newRecruit {
    return [NSEntityDescription insertNewObjectForEntityForName:@"SJHRecruit" inManagedObjectContext:[self managedObjectContext]];
}

- (NSArray *)getRecruits {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"SJHRecruit"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"Couldn't retrieve recruits: %@", error);
        return nil;
    }
    
    return fetchedObjects;
}

- (BOOL)recruitAlreadyStoredForEmail:(NSString *)email {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"SJHRecruit"
                                              inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"email LIKE \"%@\"", email]];
    
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:predicate];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"Couldn't retrieve recruit: %@", error);
        return YES;
    }
    
    return [fetchedObjects count] > 0;
}

- (NSArray *)getRecruitsNotUploaded {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"SJHRecruit"
                                              inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isUploaded = NO"];
    
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:predicate];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"Couldn't retrieve recruits: %@", error);
        return nil;
    }
    
    return fetchedObjects;
}

- (NSArray *)getRecruitsUploaded {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"SJHRecruit"
                                              inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isUploaded = YES"];
    
    [fetchRequest setEntity:entity];
    [fetchRequest setPredicate:predicate];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"Couldn't retrieve recruits: %@", error);
        return nil;
    }
    
    return fetchedObjects;
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"SJHRecruitmentApp" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"coredata_test.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Save Context

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

#pragma mark - Reachability

- (void)uploadRecruits {
    NSArray *recruits = [self getRecruitsNotUploaded];
    if ([recruits count] > 0) {
        [self uploadRecruitsRecursively:recruits index:0 retry:NO];
    }
}

//Retry is used to allow one retry in the event of the failure
- (void)uploadRecruitsRecursively:(NSArray *)recruits index:(NSInteger)index retry:(BOOL)retry {
    //base case
    if (index == [recruits count]) {
        return;
    }
    
    SJHRecruit *recruit = recruits[index];
    //upload recruit at index
    [[SJHApiClient sharedClient] recruitPOST:recruit success:^(NSURLSessionDataTask *task, id responseObject) {
        recruit.isUploaded = [NSNumber numberWithBool:YES];
        [self saveContext];
        [self uploadRecruitsRecursively:recruits index:index + 1 retry:NO];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        if (response.statusCode == 499) {
            recruit.isUploaded = [NSNumber numberWithBool:YES];
            [self saveContext];
            [self uploadRecruitsRecursively:recruits index:index + 1 retry:NO];
        }
        else {
            if (!retry) {
                [self uploadRecruitsRecursively:recruits index:index retry:YES];
            }
        }
    }];
}

@end
