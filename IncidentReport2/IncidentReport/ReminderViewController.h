//
//  ReminderViewController.h
//  IncidentReport
//
//  Created by App Jam on 11/13/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReminderViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *descriptionField;
@property (strong, nonatomic) IBOutlet UIDatePicker *reminderTime;

@end
