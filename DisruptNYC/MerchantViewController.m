//
//  MerchantViewController.m
//  DisruptNYC
//
//  Created by Joseph Nardone on 5/3/14.
//  Copyright (c) 2014 Disrupt. All rights reserved.
//

#import "MerchantViewController.h"
#import "OfferBuilderViewController.h"
#import "Cell1.h"
#import "MealTableViewCell.h"
#import "OutgoingOffer.h"

@interface MerchantViewController ()

@end

@implementation MerchantViewController

@synthesize incomingRequests;
@synthesize acceptedOffers;
@synthesize pendingOffers;
@synthesize expiredOffers;
@synthesize rejectedOffers;
@synthesize cellOwner;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor grayColor];
    UITableView *offerTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,40,320,488)];
    offerTableView.delegate = self;
    offerTableView.dataSource = self;
    offerTableView.tag = 1;
    [self.view addSubview:offerTableView];
    
    //add button to go to meal builder
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(gotoOfferBuilder)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Edit Offers" forState:UIControlStateNormal];
    button.frame = CGRectMake(40.0, 528, 100, 40.0);
    [self.view addSubview:button];

}

- (IBAction)acceptRequest:(id)sender {
    
    NSLog(@"Accepted, Row %i", ((UIButton *)sender).tag);
    //open meals view
    mealsView = [[UIView alloc] initWithFrame:CGRectMake(30,30,260,260)];
    mealsView.backgroundColor = [UIColor lightGrayColor];
    mealsTableView = [[UITableView alloc] initWithFrame:CGRectMake(1,1,mealsView.frame.size.width-2, mealsView.frame.size.height-50)];
    mealsTableView.delegate = self;
    mealsTableView.dataSource = self;
    mealsTableView.tag = 2;
    [mealsView addSubview:mealsTableView];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(dismissMealsView)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Cancel" forState:UIControlStateNormal];
    button.frame = CGRectMake(40.0, mealsView.frame.size.height-45, 100, 40.0);
    [mealsView addSubview:button];
    [self.view addSubview:mealsView];
    
}

- (IBAction)refuseRequest:(id)sender {
    NSLog(@"Refused, Row %i", ((UIButton *)sender).tag);
    
}

-(void)dismissMealsView {
    [mealsView removeFromSuperview];
}

-(void)gotoOfferBuilder {
    OfferBuilderViewController *dvController = [[OfferBuilderViewController alloc] initWithNibName:@"OfferBuilderView" bundle:nil];
    [self presentViewController:dvController animated:YES completion:nil];

}

#pragma mark
#pragma mark Table View Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	//NSLog(@"rows in section);
	return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	NSUInteger row = [indexPath row];
	NSLog(@"Setting up cell %i", row);
		
	
	//NSLog(@"aNewslink.linkTitle is %@", aNewsLink.linkTitle);
	
		
	// init the return value to nil
	UITableViewCell *cell = nil;
	
	Cell1 *cell1;
    MealTableViewCell *cell2;
	
	if (tableView.tag == 1) {
	
		NSString *nibName = @"Cell1";
		[cellOwner loadMyNibFile:nibName];
		// get a pointer to the loaded cell from the cellOwner and cast it to the appropriate type
		cell1 = (Cell1 *)cellOwner.cell;
		//NSLog(@"Loading cell from nib %@", nibName);
        [cell1.acceptButton addTarget:self action:@selector(acceptRequest:) forControlEvents:UIControlEventTouchUpInside];
        cell1.acceptButton.tag = row;
        [cell1.denyButton addTarget:self action:@selector(refuseRequest:) forControlEvents:UIControlEventTouchUpInside];
        cell1.denyButton.tag = row;
		cell = cell1;
    }
    if (tableView.tag == 2) {
        NSString *nibName = @"MealTableViewCell";
		[cellOwner loadMyNibFile:nibName];
		// get a pointer to the loaded cell from the cellOwner and cast it to the appropriate type
		cell2 = (MealTableViewCell *)cellOwner.cell;
//        [cell2.chooseMealButton addTarget:self action:@selector(acceptRequest:) forControlEvents:UIControlEventTouchUpInside];
//        cell2.chooseMealButton.tag = row;
		cell = cell2;
    }
		return cell;
		//NSLog(@"cell returned");
	
//	else
//	{
//		NSString *nibName = @"Cell2";
//		[cellOwner loadMyNibFile:nibName];
//		// get a pointer to the loaded cell from the cellOwner and cast it to the appropriate type
//		cell2 = (Cell2 *)cellOwner.cell;
//		//NSLog(@"Loading cell from nib %@", nibName);
//		NSUInteger row = [indexPath row];
//		//NSLog(@"Setting up cell %i", row);
//		
//		// set the labels to the appropriate text for this row
//		cell2.label.text = [NSString stringWithFormat:@"%@",aNewsLink.linkTitle];
//		cell = cell2;
//		
//		// return the cell which will be either a "Cell1" or "Cell2" object.
//		return cell;
//	}

	
	
}


#pragma mark -
#pragma mark Table View Delegate Methods

//indentation for table rows
/*
 - (NSInteger)tableView:(UITableView *)tableView
 indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 NSInteger row = [indexPath row];
 return row;
 }
 */

/*
 - (NSIndexPath *)tableView:(UITableView *)tableView
 willSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
 //NSInteger row = [indexPath row];
 //if (row == 0)
 //	return nil;
 
 
 //return indexPath;
 }
 */

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	//display a fullscreen ad after 3 views and every 4 after that
	
	
	//Initialize the detail view controller and display it.
	NSLog(@"table row %i selected",[indexPath row]);
}

- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath {
	
    return 0;
	
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
	
	
	//[self tableView:self.tableView didSelectRowAtIndexPath:indexPath];
}


//set row height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	NSUInteger row = [indexPath row];
	NSLog(@"Setting up cell %i", row);
	
    if (tableView.tag == 1)
        return 90;
    else
        return 70;
	
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
