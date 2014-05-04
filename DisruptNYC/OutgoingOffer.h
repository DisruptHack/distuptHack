//
//  OutgoingOffer.h
//  DisruptNYC
//
//  Created by Joseph Nardone on 5/3/14.
//  Copyright (c) 2014 Disrupt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OutgoingOffer : NSObject

{
    NSString *offerId;
    NSString *mealDescription;
    NSString *mealName;
    UIImage *offerImage;
    NSDate *offerExpirationDate;
    NSString *mealDate;
    NSString *associatedRequestId;
    int state; //1=Accepted 2=Pending 3=Accepted 4=Refused
    NSString *price;
    NSString *customerName;
}

@property (nonatomic, retain) NSString *offerId;
@property (nonatomic, retain) NSString *mealDescription;
@property (nonatomic, retain) NSString *mealName;
@property (nonatomic, retain) UIImage *offerImage;
@property (nonatomic, retain) NSDate *offerExpirationDate;
@property (nonatomic, retain) NSString *mealDate;
@property (nonatomic, retain) NSString *associatedRequestId;
@property (nonatomic, retain) NSString *price;
@property (nonatomic, retain) NSString *customerName;
@property (nonatomic, assign) int state;

@end
