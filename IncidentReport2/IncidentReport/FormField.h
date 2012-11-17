//
//  FormField.h
//  IncidentReport
//
//  Created by App Jam on 11/15/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FormField : UIView;
@property (nonatomic) BOOL isTextField;
@property (nonatomic) BOOL isDropDown;
@property (nonatomic) BOOL isCounter;
@property (nonatomic) BOOL isSwitch;
@property (nonatomic, retain) UITextView *label;
@property (nonatomic, retain) UIView *field;
//Each Option
@property (weak, nonatomic) NSMutableArray *properties;
//How many lines is the text field?
@property (nonatomic) NSUInteger count;
//initialize with a string of all lowercase letters, either textfield, radio, counter,checkbox
-(FormField *) initWithType:(NSString *) formType andLabel:(NSString *) label;
@end
