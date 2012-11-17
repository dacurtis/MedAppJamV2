

#import "CurrentIncident.h"
/*
  This class stores the CurrentIncident global variable
 
 */

@implementation CurrentIncident
@synthesize currentIncident;
static CurrentIncident *instance =nil;

+(CurrentIncident *)getIncident
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            
            instance= [CurrentIncident alloc];
        }
    }
    return instance;
}
@end
