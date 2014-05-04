//
//  MerchantBidCell.h
//  DisruptNYC
//
//  Created by Emin on 5/3/14.
//  Copyright (c) 2014 Disrupt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MerchantBidCell : UITableViewCell

@property (weak) IBOutlet UIImageView *merchantCellImage;
@property (weak) IBOutlet UILabel *merchantOfferLabel;

@property (weak) IBOutlet UIImageView *merchantYelpRatingImage;
@property (weak) IBOutlet UILabel *expirationLabel;
@property (weak, nonatomic) IBOutlet UIView *merchantOfferLabelBackground;

@end
