//
//  FinishTaskViewController.h
//  myTodo
//
//  Created by Ajeet Maurya on 08/12/12.
//  Copyright (c) 2012 devmuncher. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DMAppDelegate;
@protocol finishTaskViewController;
@interface FinishTaskViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *finishTask;
    DMAppDelegate *appDelegate;
}

@property (strong, nonatomic) IBOutlet UITableView *FinishTaskTable;
@property (strong, nonatomic) NSMutableArray *finishTask;
@property (nonatomic, weak) id<finishTaskViewController> delegate;
- (void)AddFinishTask:(NSString *)myTask;
//- (id)initWithDoneTaskArray:(NSMutableArray *)array;
@end

@protocol finishTaskViewController <NSObject>

-(NSMutableArray *)doneTask;
@end