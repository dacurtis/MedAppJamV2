//
//  Parser.h
//  IncidentReport
//
//  Created by App Jam on 11/17/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Parser : NSObject
@property (weak, nonatomic)NSString *hospital;
@property (weak, nonatomic)NSString *formString;
@property (nonatomic, retain) NSString *response;
- (Parser*) initWithHospital:(NSString *) hospital;
- (void) initializeFormQuestionArray;
@end
