//
//  MerchantBidCell.m
//  DisruptNYC
//
//  Created by Emin on 5/3/14.
//  Copyright (c) 2014 Disrupt. All rights reserved.
//

#import "MerchantBidCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation MerchantBidCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.expirationLabel.layer.shadowColor = [UIColor whiteColor].CGColor;
        self.expirationLabel.layer.shadowRadius = 5.0;
        self.expirationLabel.layer.shadowOpacity = 1;
        self.expirationLabel.layer.shadowOffset = CGSizeMake(3, 3);
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
