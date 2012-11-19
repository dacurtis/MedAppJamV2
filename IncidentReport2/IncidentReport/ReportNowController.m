//
//  ReportNowController.m
//  IncidentReport
//
//  Created by App Jam on 11/16/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import "ReportNowController.h"
#import "GlobalVars.h"
#import "FormField.h"
#import "Parser.h"

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
    NSString * path = [GlobalVars getVar].path;
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.hospitalField.text = [dict objectForKey:@"Hospital"];
    Parser * parser = [[Parser alloc] initWithHospital:self.hospitalField.text];
    NSLog(@"current incident: %@", [[CurrentIncident getIncident].currentIncident title]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)textFieldDidEndEditing:(UITextField *)theTextField {
    Parser * parser = [[Parser alloc] initWithHospital:self.hospitalField.text];
    [self performSegueWithIdentifier:@"goToForm" sender:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    [theTextField resignFirstResponder];
    //Parser * parser = [[Parser alloc] initWithHospital:self.hospitalField.text];

    //[self performSegueWithIdentifier:@"goToForm" sender:nil];
    return YES;
}

- (IBAction)searchForForm:(id)sender {
    //Parser * parser = [[Parser alloc] initWithHospital:self.hospitalField.text];
    [self performSegueWithIdentifier:@"goToForm" sender:sender];
}
@end
