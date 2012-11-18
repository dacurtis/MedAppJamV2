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

@interface GenerableViewController ()

@end

@implementation GenerableViewController
@synthesize incident;
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
    NSMutableArray *formQuestions = [[CurrentIncident getIncident].currentIncident formQuestions];
    /***Tester questions***/
    [formQuestions addObject:[[FormQuestion alloc] initWithQuestion:@"textfield1" withType:@"textField"]];
    [formQuestions addObject:[[FormQuestion alloc] initWithQuestion:@"textfield2" withType:@"textField"]];
    //[formQuestions addObject:[[FormQuestion alloc] initWithQuestion:@"textfield1" withType:@"textField"]];
    [formQuestions addObject:[[FormQuestion alloc] initWithQuestion:@"textfield3" withType:@"textField"]];
    /**********************/
    NSLog(@"%@",[incident title]);
    for(int i =0; i < [formQuestions count]; i++){
        //FormField *form = [[FormField alloc] initWithType:[(FormQuestion *)[formQuestions objectAtIndex:i] type] andLabel:[(FormQuestion *)[formQuestions objectAtIndex:i] question]];
        NSLog(@"%@", @"in loop");
      //  [self.view addSubview:form];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
