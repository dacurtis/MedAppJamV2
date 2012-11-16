//
//  Incident.m
//  IncidentReport
//
//  Created by App Jam on 11/12/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import "Incident.h"

@implementation Incident
@synthesize time,title;
- (id) initWithName:(NSString *)name atTime:(NSDate *) date{
    self = [super init];
    if (self){
        title = name;
        time = date;
        return self;
    }
    return nil;
}
@end
