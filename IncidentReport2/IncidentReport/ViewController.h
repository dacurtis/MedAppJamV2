//
//  ViewController.h
//  IncidentReport
//
//  Created by Matt Gardner on 11/12/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *incidentTable;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *settingsButton;
@property (strong, nonatomic) NSMutableArray *incidentTitles;
@property (strong, nonatomic) NSMutableArray *incidentDates;
- (NSString *) parseDateString:(NSString *)dateString;
- (IBAction)reportNow:(id)sender;

@end
