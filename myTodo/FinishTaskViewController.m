//
//  FinishTaskViewController.m
//  myTodo
//
//  Created by Ajeet Maurya on 08/12/12.
//  Copyright (c) 2012 devmuncher. All rights reserved.
//

#import "FinishTaskViewController.h"
#import "MyTaskViewController.h"
#import "DMAppDelegate.h"
@interface FinishTaskViewController ()

@end

@implementation FinishTaskViewController

@synthesize finishTask, delegate;

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
   
    //finishTask = [NSMutableArray array];
    
    

    [super viewDidLoad];
    
    
	// Do any additional setup after loading the view.
}
- (void)viewDidAppear:(BOOL)animated
{
    
    appDelegate = [[UIApplication sharedApplication]delegate];
    NSLog(@"app delegate finish task win %@",appDelegate.finishTask);
    finishTask = [NSMutableArray arrayWithArray:appDelegate.finishTask];
    NSLog(@"finish task win %@",finishTask);
    [self.FinishTaskTable reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ------------- <UITableViewDelegate> Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"done Task %@",[self.delegate doneTask]);
    return [self.finishTask count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.FinishTaskTable = tableView;
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *task = [self.finishTask objectAtIndex:indexPath.row];
	cell.textLabel.text = [NSString stringWithFormat:@"%@",task];
    cell.textLabel.textColor = [UIColor greenColor];
    
    return cell;
}

- (void)AddFinishTask:(NSString *)myTask
{
    [self.finishTask addObject:myTask];
    NSLog(@"finish task %@",self.finishTask);
    [self.FinishTaskTable reloadData];

}


@end
