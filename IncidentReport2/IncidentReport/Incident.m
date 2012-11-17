//
//  Incident.m
//  IncidentReport
//
//  Created by App Jam on 11/12/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import "Incident.h"

@implementation Incident
@synthesize time, gradualNotification,form;

- (id) initWithName:(NSString *)name atTime:(NSDate *) date{
    self = [super init];
    if (self){
        self.title = name;
        self.gradualNotification = NO;
        time = date;
        NSLog(@"creating incident");
        return self;
    }
    return nil;
}

- (id)initWithReportLater:(NSString *)title atTime:(NSDate *)date withReminderPeriod:(NSUInteger)reminderPeriod {
    self = [super init];
    if (self) {
        self.title = title;
        self.time = date;
        self.gradualNotification = NO;
        if (reminderPeriod == 0) {
            self.gradualNotification = YES;
            //self.reminderPeriod = 1;
        }
        else
            ;//self.reminderPeriod = reminderPeriod;
    }
    return nil;
}

@end
