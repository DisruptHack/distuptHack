//
//  DetailViewController.h
//  DisruptNYC
//
//  Created by Emin on 5/3/14.
//  Copyright (c) 2014 Disrupt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MerchantBidCell.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id merchantBidOffer;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
