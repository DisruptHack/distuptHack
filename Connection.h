//
//  Connection.h
//  DisruptNYC
//
//  Created by Lewis-Contractor, Douglas (CORP) on 5/3/14.
//  Copyright (c) 2014 Disrupt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Connection : NSObject < NSURLConnectionDelegate>
{
    NSURLConnection* connect;
    NSJSONSerialization* jsonParser;
    
    
}

@property(nonatomic, retain)NSURLConnection* connect;
@property(nonatomic, retain)NSJSONSerialization* jsonParser;



-(void)testConnection;

@end