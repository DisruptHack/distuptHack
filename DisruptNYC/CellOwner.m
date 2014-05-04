//
//  CellOwner.m
//  iCNET News
//
//  Created by Joseph Nardone on 10/2/09.
//  Copyright 2009 Online Appliance. All rights reserved.
//

#import "CellOwner.h"


@implementation CellOwner

@synthesize cell;

- (BOOL)loadMyNibFile:(NSString *)nibName {
    // The myNib file must be in the bundle that defines self's class.
    if ([[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil] == nil)
    {
        //NSLog(@"Warning! Could not load %@ file.\n", nibName);
        return NO;
    }
    return YES;
}

@end
