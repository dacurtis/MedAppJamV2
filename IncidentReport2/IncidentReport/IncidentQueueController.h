//
//  IncidentQueueController.h
//  IncidentReport
//
//  Created by App Jam on 11/12/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Incident;

@interface IncidentQueueController : NSObject
@property (copy, nonatomic) NSMutableArray *incidentList;
-(void) addIncident:(NSString *)name  atTime:(NSDate *)date;
- (NSUInteger)countOfList;
- (Incident *)getIndex:(NSUInteger)theIndex;
@end
