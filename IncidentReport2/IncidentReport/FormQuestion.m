//
//  FormQuestion.m
//  IncidentReport
//
//  Created by Matt Gardner on 11/18/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import "FormQuestion.h"

@implementation FormQuestion
@synthesize question, type, answer;

- (id)initWithQuestion:(NSString *)question withType:(NSString *)type {
    self = [super init];
    if (self != nil) {
        self.type = type;
        self.question = question;
        return self;
    }
    return nil;
}

@end
