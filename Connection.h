//
//  Connection.h
//  DisruptNYC
//
//  Created by Lewis-Contractor, Douglas (CORP) on 5/3/14.
//  Copyright (c) 2014 Disrupt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MerchantP2PViewController.h"
#import "UserP2PViewController.h"

@interface Connection : NSObject < NSURLConnectionDelegate>
{
    NSURLConnection* connect;
    NSJSONSerialization* jsonParser;
    NSMutableDictionary* userProfile;
    NSString* limit;
    BOOL finishedRequest;
    UserP2PViewController* userSend;
    MerchantP2PViewController* merchantSend;
    
    
}

@property(nonatomic, retain)NSURLConnection* connect;
@property(nonatomic, retain)NSJSONSerialization* jsonParser;
@property(nonatomic, retain)NSMutableDictionary* userProfile;
@property(nonatomic, retain)NSString* limit;
@property(nonatomic, retain)NSString* name;
@property(nonatomic, retain)NSString* reportDate;
@property(nonatomic, assign)BOOL finishedRequest;
@property(nonatomic, retain)UserP2PViewController* userSend;
@property(nonatomic, retain)MerchantP2PViewController* merchantSend;

+ (Connection*)model;


-(void)testConnection;

-(NSNumber*)getOfferID:(NSMutableDictionary*)dict;


@end
