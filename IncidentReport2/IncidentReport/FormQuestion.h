//
//  FormQuestion.h
//  IncidentReport
//
//  Created by Matt Gardner on 11/17/12.
//  Copyright (c) 2012 MedAppJam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FormQuestion : NSObject
@property (strong, nonatomic) NSString *question;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *answer;

@end
