//
//  Cell1.h
//  iCNET News
//
//  Created by Joseph Nardone on 10/2/09.
//  Copyright 2009 Online Appliance. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Cell1 : UITableViewCell {
	UILabel *price;
	UILabel *time;
	UILabel *name;
    UIButton *acceptButton;
    UIButton *denyButton;
}

@property (nonatomic, retain) IBOutlet UILabel *price;
@property (nonatomic, retain) IBOutlet UILabel *time;
@property (nonatomic, retain) IBOutlet UILabel *name;
@property (nonatomic, retain) IBOutlet UIButton *acceptButton;
@property (nonatomic, retain) IBOutlet UIButton *denyButton;


@end
