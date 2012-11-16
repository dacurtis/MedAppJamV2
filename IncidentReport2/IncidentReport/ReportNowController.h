//
//  ReportNowController.h
//  IncidentReport
//
//  Created by App Jam on 11/16/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FormField.h"
//#import "FormView.xib"

@interface ReportNowController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *hospitalField;
@property (nonatomic, retain) UIView *subView;
@property (weak, nonatomic) IBOutlet UIButton *goButton;
- (IBAction)searchForForm:(id)sender;
@property (nonatomic, retain) UITextField *tv;
@end
