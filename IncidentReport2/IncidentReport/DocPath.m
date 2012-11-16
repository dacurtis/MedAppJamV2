//
//  DocPath.m
//  IncidentReport
//
//  Created by App Jam on 11/14/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//


//This code copy/pasted from Stack Overflow, creates a global variable. http://stackoverflow.com/questions/6065965/how-to-define-a-global-variable-that-can-be-accessed-anywhere-in-my-application
#import "DocPath.h"

@implementation DocPath
@synthesize path, incidentQueue;
static DocPath *instance =nil;

+(DocPath *)getPath
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            
            instance= [DocPath alloc];
        }
    }
    return instance;
}

@end

/* 
 Access this like this
 DocPath *obj=[DocPath getPath];
 obj.path;
*/
