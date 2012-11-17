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
#import "DocPath.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize incidentTitles, incidentDates;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    incidentTitles = [[NSMutableArray alloc] initWithObjects:@"Description of Unreported Incident", nil];
    incidentDates = [[NSMutableArray alloc] initWithObjects:@"Date Reported", nil];
    IncidentQueueController *incidentQueue = [DocPath getPath].incidentQueue;
    for(int i = 0; i < [incidentQueue size]; i++) {
        [self.incidentTitles addObject:[[incidentQueue getIndex:i] title] ];
        [self.incidentDates addObject:[[incidentQueue getIndex:i].time description]];
    }
[self.incidentTable reloadData];
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
    return [self.incidentTitles objectAtIndex:section];
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
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
@end
