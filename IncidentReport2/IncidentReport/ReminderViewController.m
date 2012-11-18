//
//  ReminderViewController.m
//  IncidentReport
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import "ReminderViewController.h"
#import "GlobalVars.h"
#import "IncidentQueueController.h"
#import "Incident.h"

@interface ReminderViewController ()

@end

@implementation ReminderViewController
@synthesize reminderPicker, reminderOptions;
@synthesize descriptionField, reminderPeriod;

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
    self.reminderOptions = [[NSArray alloc] initWithObjects:
                            @"Gradually (4, 8, 12, 48 Hours)", @"30 Minutes", @"1 Hour", @"2 Hours", @"4 Hours",
                            @"8 Hours", @"12 Hours", @"24 Hours", @"48 Hours", nil];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    [theTextField resignFirstResponder];
    return YES;
}

#pragma mark -
#pragma mark PickerView DataSource
- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return [reminderOptions count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return [reminderOptions objectAtIndex:row];
}

#pragma mark -
#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    self.reminderPeriod = row;
}

- (IBAction)buttonPressed:(id)sender {
    if([sender tag] == [_doneButton tag]) {
        switch (reminderPeriod) {
            case 0:
                reminderPeriod = 0;
                break;
            case 1:
                reminderPeriod = 5;
                break;
            case 2:
                reminderPeriod = 1;
                break;
            case 3:
                reminderPeriod = 2;
                break;
            case 4:
                reminderPeriod = 4;
                break;
            case 5:
                reminderPeriod = 8;
                break;
            case 6:
                reminderPeriod = 12;
                break;
            case 7:
                reminderPeriod = 24;
                break;
            case 8:
                reminderPeriod = 48;
                break;
            default:
                break;
        }
        NSString *desc = [descriptionField text];
        Incident *incident = [[Incident alloc] initWithName:desc atTime:[NSDate date]];
        [[GlobalVars getVar].incidentQueue addIncident:incident];
        NSLog(@"%d", [[GlobalVars getVar].incidentQueue size]);
        
        UILocalNotification *notification = [[UILocalNotification alloc] init];
        [notification setFireDate: [NSDate dateWithTimeIntervalSinceNow: 5]];
        [notification setAlertAction:@"Launch"];
        
        [notification setAlertBody: desc];
        [notification setHasAction: YES];
        //[notification setApplicationIconBadgeNumber:[[UIApplication sharedApplication] applicationIconBadgeNumber]+1];
        [notification setApplicationIconBadgeNumber:[[GlobalVars getVar].incidentQueue size]];
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        [self email];
    }
    else if (false); //for other buttons
}
//Following code derived from mailing tutorial at www.geekylemon.com
-(void)email {
    
    MFMailComposeViewController *composer = [[MFMailComposeViewController alloc] init];
    
    [composer setMailComposeDelegate:self];
    NSLog(@"%@",@"EMAIL");
    if ([MFMailComposeViewController canSendMail]) {
        NSString * emailAddress = [[[NSDictionary alloc] initWithContentsOfFile:[GlobalVars getVar].path] objectForKey:@"Email"];
        NSLog(@"%@",@"Can send mail");
        [composer setToRecipients:[NSArray arrayWithObjects:emailAddress, nil]];
        NSLog(@"%@",emailAddress);
        Incident * curInc = [CurrentIncident getIncident].currentIncident;
        [composer setSubject:@"Reminder to fill out Near Miss Form"];
        NSString * messageBody = [NSString stringWithFormat:@"This is a reminder for you to fill out a near miss form for the incident: %@ that happened at %@", [curInc description],[curInc time]];
        
        [composer setMessageBody:messageBody isHTML:NO];
        
        [composer setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        
        [self presentModalViewController:composer animated:YES];
    }
    
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    if (error) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"error" message:[NSString stringWithFormat:@"Unable to send message %@", [error description]]
                              
                                                       delegate:nil cancelButtonTitle:@"dismiss" otherButtonTitles:nil, nil];
        
        [alert show];
        
        [self dismissModalViewControllerAnimated:YES];
        
    }
    
    else {
        
        [self dismissModalViewControllerAnimated:YES];
        
    }
    
}
@end
