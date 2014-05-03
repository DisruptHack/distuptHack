//
//  MasterViewController.m
//  DisruptNYC
//
//  Created by Emin on 5/3/14.
//  Copyright (c) 2014 Disrupt. All rights reserved.
//
#define kMerchantBidCellResuseIdentifier @"MerchantBidCell"

#import "MasterViewController.h"
#import "MerchantBidCell.h"

#import "DetailViewController.h"

@interface MasterViewController () {
    NSMutableArray *merchantOfferArray;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    merchantOfferArray = [[NSMutableArray alloc]init];
    OutgoingOffer *testOffer = [[OutgoingOffer alloc]init];
    testOffer.offerExpirationDate = [NSDate new];
    testOffer.mealDescription = @"Many steaks";
    [merchantOfferArray addObject:testOffer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!merchantOfferArray) {
        merchantOfferArray = [[NSMutableArray alloc] init];
    }
    [merchantOfferArray insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return merchantOfferArray.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MerchantBidCell *bidCell = [tableView dequeueReusableCellWithIdentifier:kMerchantBidCellResuseIdentifier forIndexPath:indexPath];
    
    OutgoingOffer *currentOffer = [merchantOfferArray objectAtIndex:indexPath.row];
    
    bidCell.merchantOfferLabel.text = currentOffer.mealDescription;
    bidCell.merchantCellImage.image = currentOffer.offerImage;
    bidCell.expirationLabel.text = [currentOffer.offerExpirationDate description];
    return bidCell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [merchantOfferArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = merchantOfferArray[indexPath.row];
        //[segue destinationViewController]setMerchantOfferLabel:object];
    }
}

@end
