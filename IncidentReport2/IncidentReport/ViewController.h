//
//  ViewController.h
//  IncidentReport
//
//  Created by Matt Gardner on 11/12/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *incidentTable;
@property (strong, nonatomic) IBOutlet UIButton *reportLater;
- (IBAction)buttonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *settingsButton;

@end
