//
//  CellOwner.h
//  iCNET News
//
//  Created by Joseph Nardone on 10/2/09.
//  Copyright 2009 Online Appliance. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CellOwner : NSObject {
	UITableViewCell *cell;
}

@property (nonatomic, retain) IBOutlet UITableViewCell *cell;

- (BOOL)loadMyNibFile:(NSString *)nibName;

@end
