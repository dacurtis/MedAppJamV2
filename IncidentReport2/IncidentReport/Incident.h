//
//  Incident.h
//  IncidentReport
//
//  Created by App Jam on 11/12/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Incident : NSObject <NSCoding>
@property (copy, nonatomic) NSDate *time;
@property (copy, nonatomic) NSString *title;
@property (nonatomic) NSUInteger reminderPeriod;
@property (nonatomic) BOOL gradualNotification;
- (id)initWithName:(NSString *)title atTime:(NSDate *) date;
- (id)initWithReportLater:(NSString *)title atTime:(NSDate *)date withReminderPeriod:(NSUInteger)reminderPeriod;
@property (nonatomic, retain) NSMutableArray *formQuestions;
@end
