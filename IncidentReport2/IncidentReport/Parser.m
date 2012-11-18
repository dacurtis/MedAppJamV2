//
//  Parser.m
//  IncidentReport
//
//  Created by App Jam on 11/17/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import "Parser.h"
#import "CurrentIncident.h"

@implementation Parser
@synthesize hospital;
NSString * ip = @"RYAN'S SERVER'S IP ADDRESS GOES HERE";
- (Parser*) initWithHospital:(NSString *) hospital{
    self  = [super init];
    self.hospital = hospital;
    
    /*
     CODE TO ACCESS ONLINE FORM AND PARSE IT GOES HERE
     SAVE THE RESULT TO self.formString
     */
     
}
- (void) initializeFormQuestionArray{
    /*
     CODE TO TAKE THE CURRENT INCIDENT AND SET EACH VALUE IN ITS FORM QUESTION
     ARRAY TO THE VALUES FROM THE PARSE STRING GOES HERE
     */
    NSArray * questions = [self.formString componentsSeparatedByString:@"~"];
    for (NSString * question in questions){
        
    }
    
}
@end
