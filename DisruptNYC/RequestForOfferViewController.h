//
//  RequestForOfferViewController.h
//  DisruptNYC
//
//  Created by Emin on 5/3/14.
//  Copyright (c) 2014 Disrupt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ANPopoverSlider.h"
#import "ANPopoverView.h"

@interface RequestForOfferViewController : UIViewController

@property (weak, nonatomic) IBOutlet ANPopoverSlider *distanceSlider;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;


@end
