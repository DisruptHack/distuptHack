//
//  Merchant.h
//  DisruptNYC
//
//  Created by Joseph Nardone on 5/3/14.
//  Copyright (c) 2014 Disrupt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Merchant : NSObject {
    NSString *merchantID;
    NSString *name;
    NSString *address;
    NSString *city;
    NSString *state;
    NSString *zip;
    NSString *phone;
    NSString *websiteUrl;
    NSString *yelpUrl;
    NSString *description;
    NSString *profilePictureUrl;
}

@property (nonatomic, retain) NSString *merchantID;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSString *city;
@property (nonatomic, retain) NSString *state;
@property (nonatomic, retain) NSString *zip;
@property (nonatomic, retain) NSString *phone;
@property (nonatomic, retain) NSString *websiteUrl;
@property (nonatomic, retain) NSString *yelpUrl;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *profilePictureUrl;

@end
