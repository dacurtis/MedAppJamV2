//
//  IncidentQueueController.m
//  IncidentReport
//
//  Created by App Jam on 11/12/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import "IncidentQueueController.h"
#import "Incident.h"
@interface IncidentQueueController ()
- (void)initializeDefaultDataList;
@end
@implementation IncidentQueueController
- (void)initializeDefaultDataList {
    NSMutableArray *incidentList = [[NSMutableArray alloc] init];
    self.incidentList = incidentList;
    Incident *defaultIncident;
    NSDate *time = [NSDate date];
    defaultIncident= [[Incident alloc] initWithName:@"Incident" atTime:time];
    [self addIncident:defaultIncident];

}

- (id)init {
    if (self = [super init]) {
        return self;
    }
    return nil;
}
- (void) addIncident:(NSString *)name atTime:(NSDate *)date{
    Incident *inc = [[Incident alloc] initWithName:name atTime:date];
    [self.incidentList addObject:inc];
}
- (void) addIncident: (Incident *) incident{
    [self.incidentList addObject:incident];
}
- (Incident *)getIndex:(NSUInteger)theIndex {
    return [self.incidentList objectAtIndex:theIndex];
}
- (Incident *) removeIncident:(NSUInteger) theIndex {
    [self.incidentList removeObjectAtIndex:theIndex];
}
@end
