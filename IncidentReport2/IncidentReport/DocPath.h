//
//  DocPath.h
//  IncidentReport
//
//  Created by App Jam on 11/14/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IncidentQueueController.h"

@interface DocPath : NSObject{
    
    NSString *path;
    IncidentQueueController *incidentQueue;
    
}
@property(nonatomic,retain)NSString *path;
@property(nonatomic,retain)IncidentQueueController *incidentQueue;
+(DocPath*) getPath;
@end
