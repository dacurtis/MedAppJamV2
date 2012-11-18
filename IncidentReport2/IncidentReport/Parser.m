//
//  Parser.m
//  IncidentReport
//
//  Created by App Jam on 11/17/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import "Parser.h"
#import "CurrentIncident.h"
#import "FormQuestion.h"
#import "GlobalVars.h"

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
    //REGEXES
    NSRegularExpression *nameRegex= [NSRegularExpression regularExpressionWithPattern:@".*Name:" options:NSRegularExpressionCaseInsensitive error:NULL];
    

    NSArray * questions = [self.formString componentsSeparatedByString:@"~"];
    NSMutableArray *form = [[NSMutableArray alloc] init];
    NSDictionary *settings = [[NSDictionary alloc] initWithContentsOfFile:[GlobalVars getVar].path];
    NSArray * names = [[settings objectForKey:@"Name"] componentsSeparatedByString:@" "];
    for (NSString * question in questions){
        NSArray * qAndT = [question componentsSeparatedByString:@"|"];
        NSString * q = [qAndT objectAtIndex:0];
        FormQuestion *fq = [[FormQuestion alloc] initWithQuestion:q withType:[qAndT objectAtIndex:1]];
        [form addObject:fq];
        
        if ([nameRegex numberOfMatchesInString:q options:0 range:NSMakeRange(0, [q length])] > 0){
            
            
            if ([[q uppercaseString] isEqualToString:@"FIRST NAME:"]){
                [fq setAnswer:[names objectAtIndex:0]];
            }
            else if([[q uppercaseString] isEqualToString:@"LAST NAME:"]){
                [fq setAnswer:[names objectAtIndex:([names count]-1)]];
            }
            else
                [fq setAnswer:[settings objectForKey: @"Name"]];
                
        }
        else if ([settings objectForKey:q]){
            [fq setAnswer:[settings objectForKey:q]];
        }
    }
    
}
@end
