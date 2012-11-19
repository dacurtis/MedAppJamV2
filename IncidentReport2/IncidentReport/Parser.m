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

@implementation Parser
@synthesize response;
@synthesize hospital,isDone,isCompleted;

- (Parser*) initWithHospital:(NSString *) hospital{
    self  = [super init];
    self.hospital = hospital;
    self.isCompleted = NO;
    /*
     CODE TO ACCESS ONLINE FORM AND PARSE IT GOES HERE
     SAVE THE RESULT TO self.formString
     */
    
    NSString *url = [@"http://108.66.96.158/gethospital.php?h=" stringByAppendingString:self.hospital];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];

    if(connection) {
        isCompleted = YES;
    }
    else {
        isCompleted = NO;
    }
    
    
    
    return self;
    
    
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    response = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"%@", response);
    [self initializeFormQuestionArray];
}


- (void) initializeFormQuestionArray{
    /*
     CODE TO TAKE THE CURRENT INCIDENT AND SET EACH VALUE IN ITS FORM QUESTION
     ARRAY TO THE VALUES FROM THE PARSE STRING GOES HERE
     */
    
    if(isCompleted) {
    NSArray * questions = [self.response componentsSeparatedByString:@"~"];
    NSMutableArray *arrayOfFormQuestions = [[NSMutableArray alloc] init];
    //NSLog(@"questions in questions array %d", [questions count]);
    //NSLog(response);
    Incident *incident = [CurrentIncident getIncident].currentIncident;
    [[incident formQuestions] addObject:@"work"];
    //NSLog(@"current incident in parser: %@", [incident title]);
    for (int i = 0; i < [questions count]; i++){
        NSArray *qAndT = [[NSArray alloc] initWithArray:[[questions objectAtIndex:i] componentsSeparatedByString:@"|"]];
        //NSLog(@"qandt count: %d", [qAndT count]);
        NSString * q = [qAndT objectAtIndex:0];
        //NSLog(q);
        FormQuestion *fq = [[FormQuestion alloc] initWithQuestion:q withType:[qAndT objectAtIndex:1]];
        //NSLog([fq question]);
        //NSLog([qAndT objectAtIndex:1]);
        [arrayOfFormQuestions addObject:fq];
        //NSLog(@"size of aofq: %d", [arrayOfFormQuestions count]);
        [incident setFormQuestions:arrayOfFormQuestions];
        //NSLog(@"question %d in current incident array is %@", i, [[[incident formQuestions] objectAtIndex:i] question]);
    }
    [[CurrentIncident getIncident].currentIncident setFormQuestions:[incident formQuestions]];
    NSLog(@"count %d", [[[CurrentIncident getIncident].currentIncident formQuestions] count]);
    }
    else{
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Hospital Not Found" message:@"No forms were found for that hospital." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [error show];
    }
}
@end
