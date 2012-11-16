//
//  FormField.m
//  IncidentReport
//
//  Created by App Jam on 11/15/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import "FormField.h"

@implementation FormField
@synthesize isDropDown,isRadioButton,isSubmitButton,isTextField,properties,count,isCheckBox,isCounter;

-(FormField *)initWithType:(NSString *) formType{
    self = [super init];
    if (self == nil){
        return nil;
    }
    if ([formType isEqual:@"textfield"]){
        self.isTextField = YES;
    }
    else if ([formType isEqual:@"radio"]){
        self.isRadioButton = YES;
        self.properties = [[NSMutableArray alloc] init];
    }
    else if ([formType isEqual:@"dropdown"]){
        self.isDropDown = YES;
        self.properties = [[NSMutableArray alloc] init];
    }
    else if ([formType isEqual:@"counter"]){
        self.isCounter = YES;
    }
    else if ([formType isEqual:@"checkbox"]){
        self.isCheckBox = YES;
        self.properties = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void) addProperty:(NSString *) propertyName{
    [properties addObject:propertyName];
}

@end
