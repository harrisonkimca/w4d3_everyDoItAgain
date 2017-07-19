//
//  DetailViewController.m
//  2w4d3_every.DoItAgain
//
//  Created by Seantastic31 on 19/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"
#import "ToDo+CoreDataClass.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.detailLabel.text = self.myTodo.toDoDescription;
}


@end
