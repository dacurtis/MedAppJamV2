//
//  SettingsViewController.m
//  IncidentReport
//
//  Created by App Jam on 11/14/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import "SettingsViewController.h"
#import "GlobalVars.h"
#import "NSBoolean.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController
@synthesize nameField;
@synthesize hospitalField;
@synthesize phoneField;
@synthesize emailField;
@synthesize roleField;
@synthesize EmailSwitch;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView {
    [super loadView];
    NSString *path = [GlobalVars getVar].path;
    NSLog(@"%@",path);
    dict = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    [nameField setText:[dict valueForKey:@"Name"]];
    [emailField setText:[dict valueForKey:@"Email"]];
    [phoneField setText:[dict valueForKey:@"Phone #"]];
    [hospitalField setText:[dict valueForKey:@"Hospital"]];
    [roleField setText:[dict valueForKey:@"Role"]];
    if([dict valueForKey:@"EmailNotification"])
        [EmailSwitch setOn:[(NSBoolean *)[dict valueForKey:@"EmailNotification"] isTrue]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)fieldChanged:(id)sender {
    
    if([sender tag] == 1)
        [dict setValue:nameField.text forKey:@"Name"];
    if([sender tag] == 2)
        [dict setValue:emailField.text forKey:@"Email"];
    if([sender tag] == 3)
        [dict setValue:phoneField.text forKey:@"Phone #"];
    if([sender tag] == 4)
        [dict setValue:hospitalField.text forKey:@"Hospital"];
    if([sender tag] == 5)
        [dict setValue:roleField.text forKey:@"Role"];
    if([sender tag] == 6){
        NSBoolean * boole = [[NSBoolean alloc] init];
        [boole setIsTrue:[EmailSwitch isOn]];
        [dict setValue:boole forKey:@"EmailNotifications"];
    }
    
    NSString *docPath = [GlobalVars getVar].path;
    
    [dict writeToFile:docPath atomically:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    [theTextField resignFirstResponder];
    return YES;
}

//Field selecting starts here.

#define kOFFSET_FOR_KEYBOARD 80.0

-(void)keyboardWillShow {
    // Animate the current view out of the way
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)keyboardWillHide {
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)sender
{
    //move the main view, so that the keyboard does not hide it.
    if  (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    
}

//method to move the view up/down whenever the keyboard is shown/dismissed
-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}


- (void)viewWillAppear:(BOOL)animated
{
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

@end
