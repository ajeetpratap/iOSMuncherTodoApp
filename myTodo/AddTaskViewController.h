//
//  AddTaskViewController.h
//  myTodo
//
//  Created by Ajeet Maurya on 08/12/12.
//  Copyright (c) 2012 devmuncher. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AddTaskViewControllerDelegate;

@interface AddTaskViewController : UIViewController<UITextFieldDelegate>

@property(weak,nonatomic)id<AddTaskViewControllerDelegate >delegate;

@property (strong, nonatomic) IBOutlet UITextField *AddTaskTextField;
@property(nonatomic,strong)NSString *taskAdded;

@property (weak, nonatomic) IBOutlet UIView *addView;

- (IBAction)closeModal:(id)sender;
@end

@protocol AddTaskViewControllerDelegate <NSObject>;

-(void)AddTaskViewControllerDidDone: (AddTaskViewController *) controller taskAdded:(NSString *)task;
@end