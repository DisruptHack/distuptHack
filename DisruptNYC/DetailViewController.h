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

@property (weak) IBOutlet UILabel *mealDescription;
@property (weak) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIView *confirmationMessage;
- (IBAction)acceptButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *confirmationMessageButton;
@property (weak, nonatomic) IBOutlet UILabel *confirmationMessageLabel;


@end
