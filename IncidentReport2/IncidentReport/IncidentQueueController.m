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

- (id)init {
    self = [super init];
    if (self != nil) {
        self.incidentList = [[NSMutableArray alloc] init];
        return self;
    }
    return nil;
}
- (void) addIncident:(NSString *)name atTime:(NSDate *)date{
    Incident *inc = [[Incident alloc] initWithName:name atTime:date];
    NSLog(@"adding incident");
    [self.incidentList addObject:inc];
}
- (void) addIncident: (Incident *) incident{
    [self.incidentList addObject:incident];
}
- (Incident *)getIndex:(NSUInteger)theIndex {
    return [self.incidentList objectAtIndex:theIndex];
}
- (void) removeIncident:(NSUInteger) theIndex {
    [self.incidentList removeObjectAtIndex:theIndex];
}
- (NSUInteger) size {
    NSLog(@"printing count:");
    return [self.incidentList count];
}
@end
