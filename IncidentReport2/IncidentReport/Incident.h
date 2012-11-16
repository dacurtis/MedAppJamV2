//
//  Incident.h
//  IncidentReport
//
//  Created by App Jam on 11/12/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Incident : NSObject
@property (copy, nonatomic) NSDate *time;
@property (copy, nonatomic) NSString *title;
- (id)initWithName:(NSString *)title atTime:(NSDate *) date;
@end
