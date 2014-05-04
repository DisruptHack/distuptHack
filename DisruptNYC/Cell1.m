//
//  Cell1.m
//  iCNET News
//
//  Created by Joseph Nardone on 10/2/09.
//  Copyright 2009 Online Appliance. All rights reserved.
//

#import "Cell1.h"


@implementation Cell1
@synthesize price;
@synthesize time;
@synthesize name;
@synthesize acceptButton;
@synthesize denyButton;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // Initialization code
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	
    [super setSelected:selected animated:animated];
	
    // Configure the view for the selected state
}




@end
