//
//  GlobalVars.h
//  IncidentReport
//
//  Created by Matt Gardner on 11/18/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IncidentQueueController.h"
#import "CurrentIncident.h"

@interface GlobalVars : NSObject{
    NSString *path;
    IncidentQueueController *incidentQueue;
}
@property(nonatomic,retain)NSString *path;
@property(nonatomic,retain)IncidentQueueController *incidentQueue;
@property(nonatomic,retain)CurrentIncident *currentIncident;
+(GlobalVars*) getVar;
@end
