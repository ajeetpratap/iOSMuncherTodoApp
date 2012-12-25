//
//  AddTaskViewController.m
//  myTodo
//
//  Created by Ajeet Maurya on 08/12/12.
//  Copyright (c) 2012 devmuncher. All rights reserved.
//

#import "AddTaskViewController.h"

@interface AddTaskViewController ()

@end

@implementation AddTaskViewController
@synthesize  taskAdded;
@synthesize delegate;
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
    [self.AddTaskTextField becomeFirstResponder];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
- (void) viewDidAppear:(BOOL)animated
{
    //self.addView.frame = CGRectMake(10, 10, 200, 400);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)closeModal:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark ---- <UITextFieldDelegate> Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	// the user pressed the return, so dismiss the keyboard
    self.taskAdded = textField.text;
    [self.delegate AddTaskViewControllerDidDone:self taskAdded:taskAdded];
	[textField resignFirstResponder];
	return YES;
}


@end
