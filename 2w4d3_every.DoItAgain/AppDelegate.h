//
//  AppDelegate.h
//  2w4d3_every.DoItAgain
//
//  Created by Seantastic31 on 19/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

@property (nonatomic, readonly) NSManagedObjectContext *context;

- (void)saveContext;


@end

