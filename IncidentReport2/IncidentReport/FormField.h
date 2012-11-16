//
//  FormField.h
//  IncidentReport
//
//  Created by App Jam on 11/15/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FormField : NSObject
@property (nonatomic) BOOL isTextField;
@property (nonatomic) BOOL isRadioButton;
@property (nonatomic) BOOL isDropDown;
@property (nonatomic) BOOL isSubmitButton;
@property (nonatomic) BOOL isCounter;
@property (nonatomic) BOOL isCheckBox;
//Each Option
@property (weak, nonatomic) NSMutableArray *properties;
//How many lines is the text field?
@property (nonatomic) NSUInteger count;
//initialize with a string of all lowercase letters, either textfield, radio, counter,checkbox
-(FormField *) initWithType:(NSString *) formType;
@end
