//
//  CurrentIncident.h
//  IncidentReport
//
//  Created by App Jam on 11/16/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Incident.h"
@interface CurrentIncident : NSObject{
    Incident *currentIncident;
}
@property(nonatomic,retain)Incident *currentIncident;
+(CurrentIncident*) getIncident;
@end
