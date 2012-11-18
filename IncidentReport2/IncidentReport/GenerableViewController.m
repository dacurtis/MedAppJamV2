//
//  GenerableViewController.m
//  IncidentReport
//
//  Created by App Jam on 11/16/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import "GenerableViewController.h"
#import "CurrentIncident.h"

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
    [super viewDidLoad]; //work on this
	/*incident = [CurrentIncident getIncident].currentIncident;
    NSLog(@"%d",[incident]);
    FormField *form = [[FormField alloc] initWithType:@"textfield" andLabel:@"Test"];
    [self.view addSubview:form];
    for(int i =0; i < [[incident form] count]; i++){
        NSLog(@"%@",@"in loop");
        FormField *form = [[FormField alloc] initWithType:@"textfield" andLabel:@"Tester"];
        [self.view addSubview:form];
    }*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
