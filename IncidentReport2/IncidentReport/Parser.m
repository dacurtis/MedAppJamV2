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
@synthesize response;
@synthesize hospital;

- (Parser*) initWithHospital:(NSString *) hospital{
    self  = [super init];
    self.hospital = hospital;
    
    /*
     CODE TO ACCESS ONLINE FORM AND PARSE IT GOES HERE
     SAVE THE RESULT TO self.formString
     */
    
    NSString *url = [@"http://108.66.96.158/gethospital.php?h=" stringByAppendingString:self.hospital];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if(connection)
    {
        
    }
    else{
        
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
    NSArray * questions = [self.formString componentsSeparatedByString:@"~"];
    for (NSString * question in questions){
        
    }
    
}
@end
