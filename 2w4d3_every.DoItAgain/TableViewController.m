//
//  TableViewController.m
//  2w4d3_every.DoItAgain
//
//  Created by Seantastic31 on 19/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "TableViewController.h"
#import "ToDo+CoreDataClass.h"
#import "TableViewCell.h"
#import "DetailViewController.h"
#import "AppDelegate.h"

@interface TableViewController ()<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray<ToDo*>*todos;
@property (weak, nonatomic) AppDelegate *appDelegate;
@property (strong, nonatomic) NSManagedObjectContext *context;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.appDelegate = (AppDelegate*) [[UIApplication sharedApplication]delegate];
    self.context = self.appDelegate.context;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self fetchWithSort];
}

- (void)setTodos:(NSArray<ToDo *> *)todos
{
    _todos = todos;
    [self.tableView reloadData];
}

- (void)fetchWithSort
{
    NSSortDescriptor  *prioritySort = [NSSortDescriptor sortDescriptorWithKey:@"priority" ascending:NO];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"ToDo"];
    request.sortDescriptors = @[prioritySort];
    NSArray <ToDo*>*result = [self.context  executeFetchRequest:request error:nil];
    self.todos = result;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.todos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    ToDo *myTodo = self.todos[indexPath.row];
    
    cell.titleLabel.text = myTodo.title;
    cell.priorityLabel.text = [NSString stringWithFormat:@"%i", myTodo.priority];
    cell.descriptionLabel.text = myTodo.toDoDescription;

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"DetailViewController"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        ToDo *myTodo = self.todos[indexPath.row];
        DetailViewController *dvc = segue.destinationViewController;
        dvc.myTodo = myTodo;
    }
}

@end
