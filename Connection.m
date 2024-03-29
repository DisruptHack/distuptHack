//
//  Connection.m
//  DisruptNYC
//
//  Created by Lewis-Contractor, Douglas (CORP) on 5/3/14.
//  Copyright (c) 2014 Disrupt. All rights reserved.
//

#import "Connection.h"

#define concurSecToken @"OAuth d5cwynwT6GDC9UOQDb0/gkpabWk="
#define concurToken2 @"OAuth qc1J2CVd7yi2ipD9rsToR8WBCT8="
#define contentType @"application/json"
#define auth @"https://www.concursolutions.com/api/travel/trip/v1.1/"
//#define concurProfile @"https://www.concursolutions.com/api/travelprofile/v1.0/profile"
#define concurReport @"https://www.concursolutions.com/api/v3.0/expense/reportdigests"
#define concurUserProfile  @"https://www.concursolutions.com/api/user/v1.0/User/"
#define concurAnyUserProfile @"https://www.concursolutions.com/api/user/v1.0/User/?loginID="
#define bookingURL  @"https://www.concursolutions.com/api/travel/booking/v1.1/"
//#define inteneryURL  @"https://www.concursolutions.com/api/travel/trip/v1.1/"
#define employeeForm @"https://www.concursolutions.com/api/user/v1.0/FormFields"
#define accountDetails @"https://www.concursolutions.com/api/expense/expensereport/v2.0/Reports/?loginid=user34@concurdisrupt.com"


static Connection *sharedPayModel = nil;


@implementation Connection


+ (Connection*)model {
    if (sharedPayModel == nil) {
        sharedPayModel = [[super allocWithZone:NULL] init];
        [self initialize];
    }
	
    return sharedPayModel;
}


@synthesize connect;
@synthesize jsonParser;
@synthesize userProfile;
@synthesize limit;
@synthesize name;
@synthesize reportDate;
@synthesize finishedRequest;



-(void)initialize
{
    connect = [[NSURLConnection alloc]init];
    jsonParser = [[NSJSONSerialization alloc]init];
    self.finishedRequest = NO;
    userSend = [[UserP2PViewController alloc]init];
}

-(void)setupConnectionToServer
{
    
}

-(void)getRequestFromURL:(NSString*)url
{
    
}

-(void)testConnection
{
    NSString* url = @"https://www.concursolutions.com/api/expense/v2.0/attendees";
    NSString* tempURL = @"https://www.concursolutions.com/api/user/v1.0/User/";
    NSString* loginURL = @"https://www.concursolutions.com/api/user/v1.0/User/?loginID=";
    NSString* login = @"user34@concurdisrupt.com";
    NSString* aURL = bookingURL;
    NSString* tripID = @"https://www.concursolutions.com/api/travel/trip/v1.1/nHysU$p8YFtPNbhQHivBHdQSABqk7FrfnTAXy1SQ";
    NSString* sampleRequest = @"https://www.concursolutions.com/api/expense/expensereport/v2.0/Reports/?status=PROCESSING";
  //  NSString* accountInfo = @"https://www.concursolutions.com/api/expense/expensereport/v2.0/Reports/?loginid=user34@concurdisrupt.com";
   // NSString* lala = @"https://www.concursolutions.com/api/platform/notifications/v1.0/notification?status=FAILED";
    //loginURL = [idk stringByAppendingString:login];
    //NSString* blah = concurProfile;
    
    NSString* lala = @"https://www.concursolutions.com/api/v3.0/expense/reportdigests/87D66ED18B8E40EE8011";
    NSString* idItenary = @"https://www.concursolutions.com/api/travel/trip/v1.1/nHysU$p8YFtPNbhQHivBHdQSABqk7FrfnTAXy1SQ";
    [self getRequestFromURLForUser:accountDetails];
    //[self acceptMealOffer];
    
    
   // [self sendRequestToURL:url];
}

-(NSString*)getReportDetails
{
    NSString* reportDetails = @"https://www.concursolutions.com/api/expense/expensereport/v2.0/report/87D66ED18B8E40EE8011";

    
    
    return reportDetails;
}

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


-(NSMutableDictionary*)acceptMealOffer
{
    NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
    
    NSNumber* requestID = [NSNumber numberWithInt:234];
    NSNumber* offerID = [NSNumber numberWithInt:111];
    
    
    NSMutableDictionary* uProfile = [[NSMutableDictionary alloc]init];
    [uProfile setObject:requestID forKey:@"requestID"];
    [uProfile setObject:offerID forKey:@"offerID"];
    
    NSMutableDictionary* suppressionUserProfile = [[NSMutableDictionary alloc]init];
    [suppressionUserProfile setObject:uProfile forKey:@"acceptOffer"];
    
    //[self getOfferID:suppressionUserProfile];
    
    
    return uProfile;
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
    [self setLimitAmount:jsonArray];
    if (error != nil) {
        NSLog(@"Error parsing JSON.");
    }
    else {
        self.finishedRequest = YES;
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"TestNotification"
         object:self];
        
        NSLog(@"Array: %@", jsonArray);
    }
    
    
    
    
}

-(void)setLimitAmount:(NSArray*)expenseAccount
{
   
    
    NSDictionary* expense = [expenseAccount objectAtIndex:0];
    NSString* mLimit = [expense objectForKey:@"ReportTotal"];
    NSString* mName = [expense objectForKey:@"EmployeeName"];
    NSString* mReportDate = [expense objectForKey:@"ReportDate"];
    
    self.limit = mLimit;
    self.name = mName;
    self.reportDate = mReportDate;
    
    return;
}



-(NSNumber*)getOfferID:(NSMutableDictionary*)dict
{
    NSDictionary* userDict = [dict objectForKey:@"acceptOffer"];
    NSNumber* offerID = [userDict objectForKey:@"offerID"];
    
    return offerID;
}

//- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
//- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
}

-(void)sendUserRequestToMerchant
{
    
}

-(void)sendMerchantRequestToUser
{
    
}

@end
