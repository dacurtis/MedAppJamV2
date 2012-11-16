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
@synthesize unreportedIncidents;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    unreportedIncidents = [[NSMutableArray alloc] initWithObjects:@"    ", nil];
    IncidentQueueController *incidentQueue = [DocPath getPath].incidentQueue;
    for(int i = 0; i < [incidentQueue size]; i++) {
        [self.unreportedIncidents addObject:[[incidentQueue getIndex:i] title] ];
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
    return [self.unreportedIncidents objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.unreportedIncidents count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    // Configure the cell...
    NSString *title = [self.unreportedIncidents objectAtIndex:indexPath.row];
    
    cell.textLabel.text = title;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
@end
