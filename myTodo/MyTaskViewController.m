//
//  MyTaskViewController.m
//  myTodo
//
//  Created by Ajeet Maurya on 08/12/12.
//  Copyright (c) 2012 devmuncher. All rights reserved.
//

#import "MyTaskViewController.h"
#import "FinishTaskViewController.h"
#import "DMAppDelegate.h"
@interface MyTaskViewController ()

@end

@implementation MyTaskViewController

int currentRow;

@synthesize MyTaskList,myFinishTask;
@synthesize TaskListTable;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    MyTaskList = [NSMutableArray array];
    myFinishTask = [NSMutableArray array];
    FTVC = [[FinishTaskViewController alloc]initWithNibName:@"FinishTaskViewController" bundle:[NSBundle mainBundle]];
    appDelegate = [[UIApplication sharedApplication]delegate];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"AddTask"]) {
        
        [[segue destinationViewController] setDelegate:self];
       
    }

}

-(NSMutableArray *)doneTask {
    NSLog(@"done task %@",self.myFinishTask);
    return self.myFinishTask ;
}

#pragma mark ------------- <UITableViewDelegate> Methods------------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.MyTaskList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *task = [self.MyTaskList objectAtIndex:indexPath.row];
	cell.textLabel.text = [NSString stringWithFormat:@"%@",task];
	
    return cell;
    
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (editingStyle == UITableViewCellEditingStyleDelete)
	{
		[self.MyTaskList removeObjectAtIndex:indexPath.row];
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
	}
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView *confirmTaskDone = [[UIAlertView alloc]initWithTitle:[self.MyTaskList objectAtIndex:indexPath.row] message:@"Choose Action" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Done", nil];
    currentRow = indexPath.row;
    [confirmTaskDone show];
    
}


#pragma mark ---------------- <UIAlertViewDelegate> Methods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"Done"])
    {
        //[self.myFinishTask addObject:[self.MyTaskList objectAtIndex:currentRow]];
        //FTVC.finishTask = myFinishTask;
        [appDelegate.finishTask addObject:[self.MyTaskList objectAtIndex:currentRow]];
         NSLog(@"app delegate finish task %@",appDelegate.finishTask);
        [self.MyTaskList removeObjectAtIndex:currentRow];
        [self.TaskListTable reloadData];

        
    }
    
}

#pragma mark ---------------- <AddTaskViewControllerDelegate> Methods

- (void)AddTaskViewControllerDidDone:(AddTaskViewController *)controller taskAdded:(NSString *)task
{
    [self.MyTaskList addObject:task];
    [self resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.TaskListTable reloadData];
    
}




@end
