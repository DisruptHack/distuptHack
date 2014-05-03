//
//  IncomingRequest.h
//  DisruptNYC
//
//  Created by Joseph Nardone on 5/3/14.
//  Copyright (c) 2014 Disrupt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IncomingRequest : NSObject {
    NSString *requestId;
    NSDate *requestCreationDate;
    NSDate *requestExpirationDate;
    NSDate *eventDate;
    NSArray *previousVisits;
    NSString *email;
    NSString *customerName;
    NSString *customerAddress;
}
@property (nonatomic, retain) NSString *requestId;
@property (nonatomic, retain) NSDate *requestCreationDate;
@property (nonatomic, retain) NSDate *requestExpirationDate;
@property (nonatomic, retain) NSDate *eventDate;
@property (nonatomic, retain) NSArray *previousVisits;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *customerName;
@property (nonatomic, retain) NSString *customerAddress;

@end
