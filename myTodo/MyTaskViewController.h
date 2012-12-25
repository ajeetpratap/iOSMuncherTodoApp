//
//  MyTaskViewController.h
//  myTodo
//
//  Created by Ajeet Maurya on 08/12/12.
//  Copyright (c) 2012 devmuncher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddTaskViewController.h"
@class DMAppDelegate;
@class FinishTaskViewController;

@interface MyTaskViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,AddTaskViewControllerDelegate,UIAlertViewDelegate>
{
    FinishTaskViewController *FTVC;
    DMAppDelegate *appDelegate;
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *AddTask;

@property (strong, nonatomic) IBOutlet UITableView *TaskListTable;
@property (nonatomic, strong) NSMutableArray *MyTaskList;
@property (nonatomic, retain) NSMutableArray *myFinishTask;

@end

