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
	incident = [CurrentIncident getIncident].currentIncident;
    formFields = [[NSMutableArray alloc] init];
    NSMutableArray *formQuestions = [[NSMutableArray alloc] initWithArray:[[CurrentIncident getIncident].currentIncident formQuestions]];
    /***Tester questions***
    [formQuestions addObject:[[FormQuestion alloc] initWithQuestion:@"12345678901234567890 1234567890" withType:@"textfield"]];
    [formQuestions addObject:[[FormQuestion alloc] initWithQuestion:@"textfield2 123213 123123 12312 3123 123 12312 3123 123123 123 123 123 12 3 123 123 12 3 123 12 3 123 12 3 123 " withType:@"textfield"]];
    [formQuestions addObject:[[FormQuestion alloc] initWithQuestion:@"textfield3 123 12 3 12 3 12 3 123 1 23123 123 1 23 12 3 123 1 31 23 12  12312 " withType:@"textfield"]];
    [formQuestions addObject:[[FormQuestion alloc] initWithQuestion:@"textfield3 123 12 3 12 3 12 3 123 1 23123 123 1 23 12 3 123 1 31 23 12  12312 " withType:@"textfield"]];
    [formQuestions addObject:[[FormQuestion alloc] initWithQuestion:@"textfield3 123 12 3 12 3 12 3 123 1 23123 123 1 23 12 3 123 1 31 23 12  12312 " withType:@"textfield"]];
    [formQuestions addObject:[[FormQuestion alloc] initWithQuestion:@"textfield3 123 12 3 12 3 12 3 123 1 23123 123 1 23 12 3 123 1 31 23 12  12312 " withType:@"textfield"]];
    [formQuestions addObject:[[FormQuestion alloc] initWithQuestion:@"textfield3 123 12 3 12 3 12 3 123 1 23123 123 1 23 12 3 123 1 31 23 12  12312 " withType:@"textfield"]];
    /**********************/
    NSLog(@"%@",[incident title]);
    float height = 0;
    for(int i = 0; i < [formQuestions count]; i++){
        NSString * text = [[formQuestions objectAtIndex:i] question];
        FormField *form = nil;
        NSLog([[formQuestions objectAtIndex:i] question]);
        int numLines = 0;
        if((text.length % 20) > 0){
            numLines = text.length/20 +1;
            
        }
        else{
            numLines = text.length/20;
            
        }
        NSLog(@"%d", numLines);
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
@end
