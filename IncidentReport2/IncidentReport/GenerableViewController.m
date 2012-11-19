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
    NSLog(answer);
}
- (IBAction)submitPressed:(id)sender {
}
@end
