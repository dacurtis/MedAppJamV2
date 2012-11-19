//
//  GenerableViewController.m
//  IncidentReport
//
//  Created by App Jam on 11/16/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import "GenerableViewController.h"
#import "CurrentIncident.h"
#import "FormQuestion.h"
#import "FormField.h"
#import "GlobalVars.h"

@interface GenerableViewController ()

@end

@implementation GenerableViewController
@synthesize incident, formFields;
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
    [super viewDidLoad];

    NSLog(@"generable loaded");
	incident = [CurrentIncident getIncident].currentIncident;
    formFields = [[NSMutableArray alloc] init];
    NSMutableArray *formQuestions = [incident formQuestions];
    NSLog(@"size of form questions: %d", [[incident formQuestions] count]);
    for (int i = 0; i < [[[CurrentIncident getIncident].currentIncident formQuestions] count]; i++) {
        NSLog(@"array in generable has %@", [[[[CurrentIncident getIncident].currentIncident formQuestions] objectAtIndex:i] question]);
    }

    float height = 0;
    if ([formQuestions count] == 0) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, 250, 20)];
        [label setText:@"Form not found for hospital"];
        [self.view addSubview:label];
    }
    for(int i = 0; i < [formQuestions count]; i++){
        NSString * text = [[formQuestions objectAtIndex:i] question];
        FormField *form = nil;
        int numLines = 0;
        if((text.length % 20) > 0){
            numLines = text.length/20 +1;
            
        }
        else{
            numLines = text.length/20;
            
        }
        //NSLog(@"%d", numLines);
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 20 + (height), 250, 20*numLines)];
        [label setNumberOfLines:numLines];
        [label setLineBreakMode:NSLineBreakByWordWrapping];
        height = height + 20*[label numberOfLines];
        height = height +10;
        [label setText:text];
        UITextField *field = [[UITextField alloc] initWithFrame:CGRectMake(30, 20+ (height), 250, 30)];
        height = height + 30;
        field.borderStyle = UITextBorderStyleRoundedRect;
        field.delegate = self;
        [field setText:[[[incident formQuestions] objectAtIndex:i] answer]];
        [field setTag:i];
        [self.view addSubview:label];
        [self.view addSubview:field];
        [formFields addObject:field];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    NSLog(@"textField tag: %d", theTextField.tag);
    [theTextField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSString *answer = ([[formFields objectAtIndex:[textField tag]] text]);
    [[[incident formQuestions] objectAtIndex:[textField tag]] setAnswer:answer];
    
}
- (IBAction)submitPressed:(id)sender {
    for (int i = 0; i < [[[GlobalVars getVar].incidentQueue incidentList] count]; i++) {
        if ([[[[[GlobalVars getVar].incidentQueue incidentList] objectAtIndex:i] time] isEqualToDate:[[CurrentIncident getIncident].currentIncident time ]]) {
            [[GlobalVars getVar].incidentQueue removeIncident:i];
        }
    }
    [self.navigationController popToViewController:[[self.navigationController viewControllers] objectAtIndex:0] animated:YES];
}

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
