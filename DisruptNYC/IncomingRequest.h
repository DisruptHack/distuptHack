//
//  IncomingRequest.h
//  DisruptNYC
//
//  Created by Joseph Nardone on 5/3/14.
//  Copyright (c) 2014 Disrupt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IncomingRequest : NSObject {
    NSDate *bidCreationDate;
    NSDate *bidExpirationDate;
    NSDate *eventDate;
    NSArray *previousVisits;
    NSString *email;
    NSString *customerName;
    NSString *customerAddress;
}
@property (nonatomic, retain) NSDate *bidCreationDate;
@property (nonatomic, retain) NSDate *bidExpirationDate;
@property (nonatomic, retain) NSDate *eventDate;
@property (nonatomic, retain) NSArray *previousVisits;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *customerName;
@property (nonatomic, retain) NSString *customerAddress;

@end
