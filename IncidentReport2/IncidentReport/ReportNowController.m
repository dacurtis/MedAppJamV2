//
//  ReportNowController.m
//  IncidentReport
//
//  Created by App Jam on 11/16/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import "ReportNowController.h"
#import "DocPath.h"
#import "FormField.h"

@interface ReportNowController ()

@end

@implementation ReportNowController
@synthesize subView,tv;

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
    NSString * path = [DocPath getPath].path;
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.hospitalField.text = [dict objectForKey:@"Hospital"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.hospitalField resignFirstResponder];
    [self searchForForm: self.goButton];
    return NO;
}

- (IBAction)searchForForm:(id)sender {
    /**
     CALL SOMETHING THAT SENDS THE HTTPREQUEST
     
     */
}
@end
