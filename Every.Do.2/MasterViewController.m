//
//  MasterViewController.m
//  Every.Do.2
//
//  Created by Chris Eloranta on 2018-02-27.
//  Copyright © 2018 Christopher Eloranta. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDo.h"
#import "CLETableViewCell.h"
@interface MasterViewController ()

@property (nonatomic) NSMutableArray *objects;





@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // THE BELOW IS BOILERPLATE FROM TEMPLATE
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    // THE BELOW IS CHRIS'S CODE
    
    NSMutableArray *objects = [[NSMutableArray alloc]init];
    self.objects = objects;
    
    for(int i = 0; i < 10; i++)
    {
    ToDo *newToDo = [[ToDo alloc]init];
        newToDo.toDoTitle = @"New To Do";
        newToDo.toDoDescription = @"New To Do";
        newToDo.toDoPriority = i;
        newToDo.toDoPriorityString = [NSString stringWithFormat:@"%d",newToDo.toDoPriority ];
        newToDo.toDoIsComplete = NO;
     [self.objects addObject:newToDo];

    }
}


- (void)viewWillAppear:(BOOL)animated {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:object];
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    //OK.  One section sounds right.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Sounds good:  number of rows in section is to equal toDo's in objects array
    return self.objects.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CLETableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"toDoCell" forIndexPath:indexPath];

    // CLE update this to return each object (toDO object) from the object array, and set the labels equal to the values.
    ToDo *object = self.objects[indexPath.row];

    cell.toDoCell.text =  object.toDoTitle ;
    cell.toDoCellDescriptionLabel.text = object.toDoDescription;
    int priority = object.toDoPriority;
    cell.toDoCellPriorityLabel.text = [NSMutableString stringWithFormat:@"%d",priority];

    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


@end
