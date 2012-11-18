//
//  FormQuestion.m
//  IncidentReport
//
//  Created by Matt Gardner on 11/17/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import "FormQuestion.h"

@implementation FormQuestion
@synthesize type, question, answer;

- (id) initWithQuestion:(NSString *)type withType:(NSString *)type {
    self = [super init];
    if(self){
        self.type = type;
        self.question = question;
        return self;
    }
    return nil;
}

@end
