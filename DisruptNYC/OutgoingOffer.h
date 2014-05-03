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
    NSString *description;
    UIImage *offerImage;
    NSDate *offerExpirationDate;
    NSString *associatedBidId;
}

@property (nonatomic, retain) NSString *offerId;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) UIImage *offerImage;
@property (nonatomic, retain) NSDate *offerExpirationDate;
@property (nonatomic, retain) NSString *associatedBidId;

@end
