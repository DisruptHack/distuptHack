//
//  DetailViewController.h
//  DisruptNYC
//
//  Created by Emin on 5/3/14.
//  Copyright (c) 2014 Disrupt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
