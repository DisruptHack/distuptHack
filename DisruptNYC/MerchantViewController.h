//
//  MerchantViewController.h
//  DisruptNYC
//
//  Created by Joseph Nardone on 5/3/14.
//  Copyright (c) 2014 Disrupt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IncomingRequest.h"
#import "CellOwner.h"
@import MultipeerConnectivity;


@interface MerchantViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, MCSessionDelegate, MCBrowserViewControllerDelegate>{
    NSMutableArray *incomingRequests;
    NSMutableArray *acceptedOffers;
    NSMutableArray *pendingOffers;
    NSMutableArray *expiredOffers;
    NSMutableArray *rejectedOffers;
    NSMutableArray *requests;
    NSMutableArray *meals;
    CellOwner *cellOwner;
    UITableView *mealsTableView;
    UIView *mealsView;
}

@property (nonatomic, retain) NSMutableArray *incomingRequests;
@property (nonatomic, retain) NSMutableArray *acceptedOffers;
@property (nonatomic, retain) NSMutableArray *pendingOffers;
@property (nonatomic, retain) NSMutableArray *expiredOffers;
@property (nonatomic, retain) NSMutableArray *rejectedOffers;
@property (nonatomic, retain) IBOutlet CellOwner *cellOwner;

@end
