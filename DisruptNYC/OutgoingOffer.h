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
    UIImage *userImage;
    NSDate *offerExpirationDate;
    NSString *mealDate;
    NSString *associatedRequestId;
    int status; //1=Accepted 2=Pending 3=Refused
    NSString *price;
    NSString *customerName;
}

@property (nonatomic, retain) NSString *offerId;
@property (nonatomic, retain) NSString *mealDescription;
@property (nonatomic, retain) NSString *mealName;
@property (nonatomic, retain) UIImage *offerImage;
@property (nonatomic, retain) UIImage *userImage;
@property (nonatomic, retain) NSDate *offerExpirationDate;
@property (nonatomic, retain) NSString *mealDate;
@property (nonatomic, retain) NSString *associatedRequestId;
@property (nonatomic, retain) NSString *price;
@property (nonatomic, retain) NSString *customerName;
@property (nonatomic, assign) int status;

@end
