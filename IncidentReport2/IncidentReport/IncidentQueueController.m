//
//  IncidentQueueController.m
//  IncidentReport
//
//  Created by App Jam on 11/12/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import "IncidentQueueController.h"
#import "Incident.h"
@implementation IncidentQueueController
@synthesize countOfList;
- (void)initializeDefaultDataList {
    NSMutableArray *incidentList = [[NSMutableArray alloc] init];
}

- (id)init {
    if (self = [super init]) {
        countOfList = 0;
        return self;
    }
    return nil;
}
- (void) addIncident:(NSString *)name atTime:(NSDate *)date{
    Incident *inc = [[Incident alloc] initWithName:name atTime:date];
    [self.incidentList addObject:inc];
    self.countOfList++;
}
- (void) addIncident: (Incident *) incident{
    [self.incidentList addObject:incident];
    self.countOfList++;
}
- (Incident *)getIndex:(NSUInteger)theIndex {
    return [self.incidentList objectAtIndex:theIndex];
}
- (void) removeIncident:(NSUInteger) theIndex {
    [self.incidentList removeObjectAtIndex:theIndex];
    self.countOfList--;
}
@end
