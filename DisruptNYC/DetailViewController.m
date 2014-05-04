//
//  DetailViewController.m
//  DisruptNYC
//
//  Created by Emin on 5/3/14.
//  Copyright (c) 2014 Disrupt. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setMerchantBidOffer:(id)newDetailItem
{
    if (_merchantBidOffer != newDetailItem) {
        _merchantBidOffer = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.merchantBidOffer) {
        self.mealDescription.text = [self.merchantBidOffer description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    //self.view.backgroundColor = [UIColor blueColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)acceptButton:(id)sender {
    
    [UIView animateWithDuration:1.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.confirmationMessage.alpha = .85;
        self.confirmationMessageButton.alpha = .85;
        self.confirmationMessageLabel.alpha = .85;
    } completion:^(BOOL finished) {
        self.confirmationMessage.alpha = .85;
        self.confirmationMessageButton.alpha = .85;
        self.confirmationMessageLabel.alpha = .85;
    }];
}
@end
