//
//  ReminderViewController.m
//  IncidentReport
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import "ReminderViewController.h"
#import "DocPath.h"
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
        IncidentQueueController *incidentQueue = [DocPath getPath].incidentQueue;
        [incidentQueue initializeDefaultDataList];
        //Incident *incident = [[Incident alloc] initWithReportLater:self.description atTime:[NSDate date] withReminderPeriod:self.reminderPeriod];
        //[incidentQueue addIncident:incident];
        //incident = [incidentQueue getIndex:*(incidentQueue.countOfList)];
        //NSLog([[NSString alloc] initWithFormat:@"%@   %d",incident.description, incident.reminderPeriod]);
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else if (false); //for other buttons
}
@end
