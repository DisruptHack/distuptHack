//
//  MerchantViewController.h
//  DisruptNYC
//
//  Created by Joseph Nardone on 5/3/14.
//  Copyright (c) 2014 Disrupt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IncomingRequest.h"

@interface MerchantViewController : UIViewController {
    NSMutableArray *incomingRequests;
}

@property (nonatomic, retain) NSMutableArray *incomingRequests;

@end
