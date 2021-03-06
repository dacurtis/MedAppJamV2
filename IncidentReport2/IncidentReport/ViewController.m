//
//  ViewController.m
//  IncidentReport
//
//  Created by Matt Gardner on 11/12/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import "ViewController.h"
#import "IncidentQueueController.h"
#import "Incident.h"
#import "GlobalVars.h"
#import "CurrentIncident.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize incidentTitles, incidentDates;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:[[GlobalVars getVar].incidentQueue size]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    incidentTitles = [[NSMutableArray alloc] initWithObjects:@"Description", nil];
    incidentDates = [[NSMutableArray alloc] initWithObjects:@"Date Reported", nil];
    IncidentQueueController *incidentQueue = [GlobalVars getVar].incidentQueue;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"EEE, MMM d 'at' HH:mm"];
    for(int i = 0; i < [incidentQueue size]; i++) {
        [self.incidentTitles addObject:[[incidentQueue getIndex:i] title] ];
        NSDate *date = [incidentQueue getIndex:i].time;
        NSString *theDate = [dateFormat stringFromDate:date];
        [self.incidentDates addObject:theDate];
        //[[incidentQueue getIndex:i].time descriptionWithLocale:[NSLocale currentLocale]]
    }
[self.incidentTable reloadData];
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:[[GlobalVars getVar].incidentQueue size]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
	
#pragma mark -
#pragma mark IncidentTable DateSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Unreported Incidents:";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.incidentTitles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"incidentCell"];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"incidentCell"];
    }
    
    // Configure the cell...
    NSString *title = [self.incidentTitles objectAtIndex:indexPath.row];
    NSString *date = [self.incidentDates objectAtIndex:indexPath.row];
    
    cell.textLabel.text = title;
    cell.detailTextLabel.text = date;
    
    if([indexPath item] != 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    else {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    if ([indexPath row] != 0)
        return YES;
    else
        return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog([[NSString alloc] initWithFormat:@"%@", [[[GlobalVars getVar].incidentQueue getIndex:([indexPath row] - 1)] title]]);
        [[GlobalVars getVar].incidentQueue removeIncident:([indexPath row] - 1)];
        [self viewWillAppear:YES];
    }
}

#pragma mark -
#pragma mark IncidentTable Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if([indexPath item] != 0) {
        if([[[[GlobalVars getVar].incidentQueue getIndex:([indexPath row] - 1)] formQuestions] count] > 0 ){
            [self performSegueWithIdentifier:@"reportForm" sender:[[GlobalVars getVar].incidentQueue getIndex:([indexPath row] - 1)]];
        } else {
            [self performSegueWithIdentifier:@"reportNow" sender:[[GlobalVars getVar].incidentQueue getIndex:([indexPath row] - 1)]];
        }
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    /*if ([indexPath row] == 0)
        cell.backgroundColor = [UIColor colorWithRed:0.72225 green:0.72225 blue:0.72225 alpha:1];*/
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(Incident *)sender {
    [CurrentIncident getIncident].currentIncident = sender;
}
- (IBAction)reportNow:(Incident *)sender {
    Incident *incident = [[Incident alloc] initWithName:@"Near Miss" atTime:[NSDate date]];
    [CurrentIncident getIncident].currentIncident = incident;
    [self performSegueWithIdentifier:@"reportNow" sender:[CurrentIncident getIncident].currentIncident];
}
@end
