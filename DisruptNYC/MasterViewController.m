//
//  MasterViewController.m
//  DisruptNYC
//
//  Created by Emin on 5/3/14.
//  Copyright (c) 2014 Disrupt. All rights reserved.
//
#define kMerchantBidCellResuseIdentifier @"MerchantBidCell"

#import <QuartzCore/QuartzCore.h>
#import "UIImage+animatedGIF.h"
#import "MasterViewController.h"
#import "MerchantBidCell.h"
#import "MerchantViewController.h"

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
    
    //test stuff - will be deleted
    merchantOfferArray = [[NSMutableArray alloc]init];
    OutgoingOffer *testOffer = [[OutgoingOffer alloc]init];
    testOffer.offerExpirationDate = [NSDate date];

    testOffer.mealDescription = @"Many steaks";
    UIImage *animatedGif = [UIImage animatedImageWithAnimatedGIFURL:[NSURL URLWithString:@"http://37.media.tumblr.com/tumblr_lx9qvrIYEx1qe5q3go1_500.gif"]];
    testOffer.offerImage = animatedGif;//[UIImage imageNamed:@"test"];
    [merchantOfferArray addObject:testOffer];
    
    
}

-(NSInteger)getHoursTillExpiration:(NSDate *) expirationDate{
    NSTimeInterval distanceBetweenDates = [expirationDate timeIntervalSinceDate:[NSDate date]];
    double secondsInAnHour = 3600;
    NSInteger hoursBetweenDates = distanceBetweenDates / secondsInAnHour;
    return  hoursBetweenDates;
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
    NSString *dateString = [NSString stringWithFormat:@"%ldh", (long)[self getHoursTillExpiration:[NSDate dateWithTimeInterval:(60*60*5) sinceDate:[NSDate date]]]];
    
    bidCell.expirationLabel.text = dateString;
    bidCell.expirationLabel.alpha =0;
    
    bidCell.merchantCellImage.layer.shadowColor = [UIColor blackColor].CGColor;
    bidCell.merchantCellImage.layer.shadowRadius = 5.0;
    bidCell.merchantCellImage.layer.shadowOpacity = 1;
    bidCell.merchantCellImage.layer.shadowOffset = CGSizeMake(3, 3);
    CGPathRef path = [UIBezierPath bezierPathWithRect:bidCell.merchantCellImage.bounds].CGPath;
    bidCell.merchantCellImage.layer.shadowPath = path;
    //bidCell.merchantCellImage.layer.shouldRasterize = YES;
    
    [UIView animateWithDuration:2.5
                          delay:.75
                        options:UIViewAnimationOptionCurveEaseOut animations:^{
                            bidCell.expirationLabel.alpha =.75;
                        } completion:^(BOOL finished) {
                            bidCell.expirationLabel.alpha =.75;
                        }];

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


- (IBAction)gotoMerchantView:(id)sender{
    NSLog(@"launching merchant view");
    MerchantViewController *dvController = [[MerchantViewController alloc] initWithNibName:@"MerchantView" bundle:nil];
    [self presentViewController:dvController animated:YES completion:nil];
    
}

@end
