//
//  Connection.m
//  DisruptNYC
//
//  Created by Lewis-Contractor, Douglas (CORP) on 5/3/14.
//  Copyright (c) 2014 Disrupt. All rights reserved.
//

#import "Connection.h"

#define concurSecToken @"OAuth d5cwynwT6GDC9UOQDb0/gkpabWk="
#define contentType @"application/json"
#define auth @"https://www.concursolutions.com/api/travel/trip/v1.1/"
#define concurProfile @"https://www.concursolutions.com/api/travelprofile/v1.0/profile"
#define concurReport @"https://www.concursolutions.com/api/v3.0/expense/reportdigests"

@implementation Connection

@synthesize connect;
@synthesize jsonParser;


-(void)initialize
{
    connect = [[NSURLConnection alloc]init];
    jsonParser = [[NSJSONSerialization alloc]init];
}

-(void)setupConnectionToServer
{
    
}

-(void)getRequestFromURL:(NSString*)url
{
    
}

-(void)testConnection
{
    NSString* url = @"https://www.concursolutions.com/api/v3.0/expense/reportdigests";
    
    NSString* blah = concurProfile;
    [self getRequestFromURLForUser:blah];
    
    
   // [self sendRequestToURL:url];
}

//-(void)tryThis
//{
//    NSString* url = @"https://www.concursolutions.com/api/v3.0/expense/reportdigests";
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
//
//    
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        if (!data) {
//            NSLog(@"%s: sendAynchronousRequest error: %@", __FUNCTION__, connectionError);
//            return;
//        } else if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
//            NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
//            if (statusCode != 200) {
//                NSLog(@"%s: sendAsynchronousRequest status code != 200: response = %@", __FUNCTION__, response);
//                return;
//            }
//        }
//        
//        NSError *parseError = nil;
//        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
//        if (!dictionary) {
//            NSLog(@"%s: JSONObjectWithData error: %@; data = %@", __FUNCTION__, parseError, [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
//            return
//        }
//        
//        // now you can use your `dictionary` object
//    }];
//
//}

-(void)sendRequestToURL:(NSString*)url
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    //[request setValue:VALUE forHTTPHeaderField:@"Field You Want To Set"];
    [request setHTTPMethod:@"POST"];
    // [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:contentType forHTTPHeaderField:@"Accept:"];
    [request setValue:concurSecToken forHTTPHeaderField:@"Authorization"];//change this according to your need.
    //[request setHTTPBody:postData];
    
    
    
    [[NSURLConnection alloc] initWithRequest:request delegate:self] ;
}

-(void)getRequestFromURLForUser:(NSString*)url
{
    
    NSString* blah = auth;

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    //[request setValue:VALUE forHTTPHeaderField:@"Field You Want To Set"];
    [request setHTTPMethod:@"GET"];
   // [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:contentType forHTTPHeaderField:@"Accept"];
    [request setValue:concurSecToken forHTTPHeaderField:@"Authorization"];//change this according to your need.
    //[request setHTTPBody:postData];
    
    //https://www.concursolutions.com/api/travel/trip/v1.1/
    /*
     curl https://www.concursolutions.com/api/v3.0/expense/reportdigests
     -H "Authorization: OAuth <insert your access token here>"
     -H "Accept: application/json"
     
     sPVSKoHJAnlOiijPN4W5k9
     
     */
    
    [[NSURLConnection alloc] initWithRequest:request delegate:self] ;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    
  //  NSDictionary dict = [jsonParser
//                         
//                         NSError *jsonParsingError = nil;
//                         id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
//
//    if (jsonParsingError) {
//        NSLog(@"JSON ERROR: %@", [jsonParsingError localizedDescription]);
//    } else {
//        NSLog(@"OBJECT: %@", [object class]);
//    }
//    
    
    NSError *error = nil;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    if (error != nil) {
        NSLog(@"Error parsing JSON.");
    }
    else {
        NSLog(@"Array: %@", jsonArray);
    }
    
    
    
    
}


//- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
//- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
}

@end
