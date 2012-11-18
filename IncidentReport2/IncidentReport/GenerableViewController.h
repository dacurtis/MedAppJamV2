//
//  GenerableViewController.h
//  IncidentReport
//
//  Created by App Jam on 11/16/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FormField.h"
#import "Incident.h"

@interface GenerableViewController : UIViewController <UITextFieldDelegate>
@property (nonatomic, retain) FormField *field;
@property (nonatomic, retain) Incident *incident;
@property (nonatomic, retain) NSMutableArray *formFields;
@property (nonatomic, retain) UIView *view;
@end
