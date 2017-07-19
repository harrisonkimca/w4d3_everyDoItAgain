//
//  AddViewController.m
//  2w4d3_every.DoItAgain
//
//  Created by Seantastic31 on 19/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "AddViewController.h"
#import "ToDo+CoreDataClass.h"
#import "AppDelegate.h"

@interface AddViewController ()

@property (weak, nonatomic) IBOutlet UITextField *toDoTitle;
@property (weak, nonatomic) IBOutlet UITextField *toDoPriority;
@property (weak, nonatomic) IBOutlet UITextField *toDoDescription;

@property (weak, nonatomic) AppDelegate *appDelegate;
@property (strong, nonatomic) NSManagedObjectContext *context;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    self.context = self.appDelegate.context;
}

- (IBAction)saveTapped:(UIBarButtonItem *)sender
{
    [self saveData];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)saveData
{
    NSString *toDoTitle = self.toDoTitle.text;
    int16_t toDoPriority = [self.toDoPriority.text intValue];
    NSString *toDoDescription = self.toDoDescription.text;
    ToDo *toDo = [[ToDo alloc]initWithContext:self.context];
    toDo.title = toDoTitle;
    toDo.priority = toDoPriority;
    toDo.toDoDescription = toDoDescription;
    [self.appDelegate saveContext];
}

@end
