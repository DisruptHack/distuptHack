//
//  MealTableViewCell.h
//  DisruptNYC
//
//  Created by Joseph Nardone on 5/3/14.
//  Copyright (c) 2014 Disrupt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MealTableViewCell : UITableViewCell {
    UILabel *title;
    UIImageView *mealImageView;
    UILabel *price;
    UIButton *selectButton;
}
@property (nonatomic, retain) IBOutlet UILabel *title;
@property (nonatomic, retain) IBOutlet UIImageView *mealImageView;
@property (nonatomic, retain) IBOutlet UILabel *price;
@property (nonatomic, retain) IBOutlet UIButton *selectButton;


@end
