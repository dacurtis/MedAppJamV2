//
//  FormField.m
//  IncidentReport
//
//  Created by App Jam on 11/15/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import "FormField.h"

@implementation FormField
@synthesize isDropDown,isTextField,properties,count,isSwitch,isCounter;

-(FormField *)initWithType:(NSString *) formType andLabel:(NSString *)description{
    self = [super initWithFrame:CGRectMake(10, 10, 300, 300)];
    if (self == nil){
        return nil;
    }
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 250, 20)];
    [self.label setText:description];
    [self addSubview:self.label];
    if ([formType isEqual:@"textfield"]){
        self.isTextField = YES;
        self.field = [[UITextField alloc] initWithFrame:CGRectMake(30, 40, 250, 30)];
        ((UITextField*)self.field).borderStyle = UITextBorderStyleRoundedRect;
    }
    else if ([formType isEqual:@"dropdown"]){
        self.isDropDown = YES;
        self.properties = [[NSMutableArray alloc] init];
        self.field = [[UIPickerView alloc] initWithFrame:CGRectMake(30, 40, 250, 250)];
    }
    else if ([formType isEqual:@"counter"]){
        self.isCounter = YES;
        
    }
    else if ([formType isEqual:@"switch"]){
        self.isSwitch = YES;
        self.field = [[UISwitch alloc] initWithFrame:CGRectMake(30, 40, 30, 30)];
    }
    [self insertSubview:self.field belowSubview:self.label];
    return self;
}

-(void) addProperty:(NSString *) propertyName{
    [properties addObject:propertyName];
}

@end
