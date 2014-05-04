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
    
    //dummy arrays
    NSArray *samplePrices = [[NSArray alloc] initWithObjects:@"$75.00",@"$50.00",@"$75.00",@"$35.00", @"$75.00",@"$100.00",@"$75.00", nil];
    NSArray *sampleTimes = [[NSArray alloc] initWithObjects:@"Today 5:00PM",@"Today 5:00PM",@"Today 5:30PM",@"Today 5:30PM", @"Today 6:00PM",@"Today 7:00PM",@"Today 8:00PM", nil];
    NSArray *sampleNames = [[NSArray alloc] initWithObjects:@"User 34",@"Luis S. Alexander",@"Howard S. Beach",@"Sandra T. Tucker", @"Emily R. Miller",@"Gene L. Arnold",@"Tommie P. Valenzuela", nil];
    
    NSArray *sampleUserImages = [[NSArray alloc] initWithObjects:@"photo2.png",@"photo3.png",@"photo4.png",@"photo6.png", @"photo7.png",@"photo8.png",@"photo2.png", nil];
    
    
    NSArray *sampleMealPrices = [[NSArray alloc] initWithObjects:@"$100.00",@"$75.00",@"$50.00",@"$35.00", nil];
    
    NSArray *sampleMealNames = [[NSArray alloc] initWithObjects:@"Dinner,Wine, Dessert",@"App, Dinner, Dessert",@"App & Dinner",@"Dinner", nil];
    
    NSArray *sampleMealImages = [[NSArray alloc] initWithObjects:@"meal1.png",@"meal2.png",@"meal3.png",@"meal4.png", nil];

    
    requests = [[NSMutableArray alloc] init];
    for (int i=0; i<[samplePrices count]; i++) {
        OutgoingOffer *tempOffer = [[OutgoingOffer alloc] init];
        tempOffer.price = [samplePrices objectAtIndex:i];
        tempOffer.mealDate = [sampleTimes objectAtIndex:i];
        tempOffer.customerName = [sampleNames objectAtIndex:i];
        tempOffer.status = 0;
        tempOffer.userImage = [UIImage imageNamed:[sampleUserImages objectAtIndex:i]];
        [requests addObject:tempOffer];
    }
    
    meals = [[NSMutableArray alloc] init];
    for (int i=0; i<[sampleMealPrices count]; i++) {
        OutgoingOffer *tempOffer = [[OutgoingOffer alloc] init];
        tempOffer.price = [sampleMealPrices objectAtIndex:i];
        tempOffer.mealName = [sampleMealNames objectAtIndex:i];
        tempOffer.offerImage = [UIImage imageNamed:[sampleMealImages objectAtIndex:i]];
        [meals addObject:tempOffer];
    }
    
    self.view.backgroundColor = [UIColor grayColor];
    offerTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,40,320,488)];
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
    
    //add button to go to meal builder
    UIButton *refreshButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [refreshButton addTarget:self
               action:@selector(refreshOffers)
     forControlEvents:UIControlEventTouchUpInside];
    [refreshButton setTitle:@"Refresh" forState:UIControlStateNormal];
    refreshButton.frame = CGRectMake(190.0, 528, 100, 40.0);
    [self.view addSubview:refreshButton];


}

- (IBAction)acceptRequest:(id)sender {
    
    NSLog(@"Accepted, Row %i", ((UIButton *)sender).tag);
    //open meals view
    CGRect tempRect = ((UIButton *)sender).frame;
    mealsView = [[UIView alloc] initWithFrame:CGRectMake(tempRect.origin.x-80, tempRect.origin.y+80, 0, 0)];
    offerTableView.backgroundColor = [UIColor blackColor];
    offerIndex = ((UIButton *)sender).tag;
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
    button.frame = CGRectMake(10.0, mealsView.frame.size.height-45, 70, 40.0);
    [mealsView addSubview:button];
    [self.view addSubview:mealsView];
    
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         offerTableView.alpha = 0.2;
                         offerTableView.userInteractionEnabled = NO;
                         mealsView.frame = CGRectMake(30,50,260,260);
                         button.frame = CGRectMake(10.0, mealsView.frame.size.height-45, 70, 40.0);
                         mealsTableView.frame = CGRectMake(1,1,mealsView.frame.size.width-2, mealsView.frame.size.height-50);
                         // other animations here
                     }
                     completion:^(BOOL finished){
                         // ... completion stuff
                     }
     ];

    
    
    
    
    
    
}

- (IBAction)refuseRequest:(id)sender {
    NSLog(@"Refused, Row %li", (long)((UIButton *)sender).tag);
    
}

-(IBAction)sendOffer:(id)sender {
    NSLog(@"send offer");
    //test update status
    OutgoingOffer *tempOffer = [requests objectAtIndex:offerIndex];
    tempOffer.status = 2;
    [offerTableView reloadData];
    [self dismissMealsView];
    
    //TODO: Send offer acceptance to user
}



-(void)refreshOffers{
    //TODO: make call to get list of offers with statuses
    
    
}

-(void)dismissMealsView {
    offerTableView.alpha = 1.0;
    offerTableView.backgroundColor = [UIColor whiteColor];
    offerTableView.userInteractionEnabled = YES;

    [mealsView removeFromSuperview];
}

-(void)gotoOfferBuilder {
//    OfferBuilderViewController *dvController = [[OfferBuilderViewController alloc] initWithNibName:@"OfferBuilderView" bundle:nil];
//    [self presentViewController:dvController animated:YES completion:nil];
//
}

#pragma mark
#pragma mark Table View Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	//NSLog(@"rows in section);
    if (tableView.tag ==1) {
        return [requests count];
    }
   else {
        return [meals count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	NSUInteger row = [indexPath row];
	//NSLog(@"Setting up cell %i", row);
		
	
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
        
        OutgoingOffer *tempOffer = [requests objectAtIndex:row];
        cell1.name.text = tempOffer.customerName;
        cell1.price.text = tempOffer.price;
        cell1.time.text = tempOffer.mealDate;
        cell1.userImage.image = tempOffer.userImage;
        
        if (tempOffer.status == 0) {
            cell1.statusLabel.hidden = YES;
        }
        if (tempOffer.status == 1) {
            cell1.statusLabel.hidden = NO;
            cell1.statusLabel.backgroundColor = [UIColor colorWithRed:.223 green:.710 blue:.290 alpha:1.0];
            cell1.statusLabel.textColor = [UIColor whiteColor];
            cell1.statusLabel.text = @"ACCEPTED";
        }
        if (tempOffer.status == 2) {
            cell1.statusLabel.hidden = NO;
            cell1.statusLabel.backgroundColor = [UIColor colorWithRed:1.0 green:.729 blue:.004 alpha:1.0];
            cell1.statusLabel.textColor = [UIColor whiteColor];
            cell1.statusLabel.text = @"PENDING";
        }

        
		cell = cell1;
    }
    if (tableView.tag == 2) {
        NSString *nibName = @"MealTableViewCell";
		[cellOwner loadMyNibFile:nibName];
		// get a pointer to the loaded cell from the cellOwner and cast it to the appropriate type
		cell2 = (MealTableViewCell *)cellOwner.cell;
        OutgoingOffer *tempOffer = [meals objectAtIndex:row];
        cell2.title.text = tempOffer.mealName;
        cell2.price.text = tempOffer.price;
        cell2.mealImageView.image = tempOffer.offerImage;
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
        return 60;
    else
        return 70;
	
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
