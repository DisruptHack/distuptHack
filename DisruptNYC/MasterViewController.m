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
#import "Connection.h"

#import "DetailViewController.h"


@interface MasterViewController () {
    NSMutableArray *merchantOfferArray;
}
-(NSString *)stringForPeerConnectionState:(MCSessionState)state;
-(void) startAdvertising;


@end

@implementation MasterViewController
{
    
        
        MCPeerID *_peerID;
        MCSession *_mcSession;
        MCAdvertiserAssistant *_mcAdvertiserAssistant;
        UIButton *_startAdvertisingButonControl;
        UITextView *_merchantRepliesTextView;
        NSMutableArray* peers;
    

}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _peerID = [[MCPeerID alloc] initWithDisplayName:@"Rene Saroza"];
    _mcSession = [[MCSession alloc] initWithPeer:_peerID];
    _mcSession.delegate = self;
    _mcAdvertiserAssistant = [[MCAdvertiserAssistant alloc] initWithServiceType:@"service" discoveryInfo:nil session:_mcSession];

    peers = [[NSMutableArray alloc] init];

    [self startAdvertising];
    
    
//    Connection* con = [Connection model];
//    BOOL b = con.finishedRequest;
    merchantOfferArray = [[NSMutableArray alloc]init];
    [self populateWithFakeData];
    
}

-(void)populateWithFakeData{
    OutgoingOffer *testOffer = [[OutgoingOffer alloc]init];
    testOffer.offerExpirationDate = [NSDate date];
    testOffer.mealDescription = @"Many steaks";
    UIImage *animatedGif = [UIImage animatedImageWithAnimatedGIFURL:[NSURL URLWithString:@"http://37.media.tumblr.com/tumblr_lx9qvrIYEx1qe5q3go1_500.gif"]];
    testOffer.offerImage = animatedGif;
    [merchantOfferArray addObject:testOffer];
    
    
    OutgoingOffer *testOffer2 = [[OutgoingOffer alloc]init];
    testOffer2.offerExpirationDate = [NSDate date];
    testOffer2.mealDescription = @"some steaks";
    testOffer2.offerImage = [UIImage imageNamed:@"restaurant1"];
    [merchantOfferArray addObject:testOffer2];
    
    OutgoingOffer *testOffer3 = [[OutgoingOffer alloc]init];
    testOffer3.offerExpirationDate = [NSDate date];
    testOffer3.mealDescription = @"shit load of steaks";
    testOffer3.offerImage = [UIImage imageNamed:@"restaurant2"];
    [merchantOfferArray addObject:testOffer3];
    
    OutgoingOffer *testOffer4 = [[OutgoingOffer alloc]init];
    testOffer4.offerExpirationDate = [NSDate date];
    testOffer4.mealDescription = @"meh steaks";
    testOffer4.offerImage = [UIImage imageNamed:@"restaurant3"];
    [merchantOfferArray addObject:testOffer4];

    
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
    
    [UIView animateWithDuration:1.4
                          delay:.3
                        options:UIViewAnimationOptionCurveEaseOut animations:^{
                            bidCell.merchantOfferLabel.alpha =.8;
                            bidCell.merchantOfferLabelBackground.alpha = .8;
                        } completion:^(BOOL finished) {
                            bidCell.merchantOfferLabel.alpha =.8;
                            bidCell.merchantOfferLabelBackground.alpha = .8;
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

- (IBAction)acceptOffer:(id)sender{
    NSLog(@"pressed button");
    
}


// Override this method to handle changes to peer session state
- (void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state
{
    
    NSLog(@"Peer [%@] changed state to %@", peerID.displayName, [self stringForPeerConnectionState:state]);
    /*
     switch (state)
     {
     case MCSessionStateConnected:
     //[_mcAdvertiserAssistant stop];
     case MCSessionStateConnecting:
     
     case MCSessionStateNotConnected:
     ;
     //[_mcAdvertiserAssistant start];
     
     }
     
     */
    
}

// MCSession Delegate callback when receiving data from a peer in a given session
- (void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID
{
    NSString *messageFromMerchant = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    NSLog(@" Received data [%@]from peer %@ ", messageFromMerchant, peerID.displayName);
    //_merchantRepliesTextView.text = data.description;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        _merchantRepliesTextView.text = messageFromMerchant;
    });
}

// MCSession delegate callback when we start to receive a resource from a peer in a given session
- (void)session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress
{
    NSLog(@"Start receiving resource [%@] from peer %@ with progress [%@]", resourceName, peerID.displayName, progress);
    
}

// MCSession delegate callback when a incoming resource transfer ends (possibly with error)
- (void)session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error
{
    
    
}

// Streaming API not utilized in this sample code
- (void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID
{
    NSLog(@"Received data over stream with name %@ from peer %@", streamName, peerID.displayName);
}


// Helper method for human readable printing of MCSessionState.  This state is per peer.
- (NSString *)stringForPeerConnectionState:(MCSessionState)state
{
    switch (state)
    {
        case MCSessionStateConnected:
            return @"Connected";
            
        case MCSessionStateConnecting:
            return @"Connecting";
            
        case MCSessionStateNotConnected:
            return @"Not Connected";
    }
}

-(void) startAdvertising
{
    
    NSLog(@"Peer with id %@ started advertizing ... ", _peerID.displayName);
    [_mcAdvertiserAssistant start];
}

-(void) sendData
{
    NSString* offers = @"lalalal";
    
    NSLog(@"Sending data %@", offers);
    NSError *error = [[NSError alloc] init];
    [_mcSession sendData:[offers dataUsingEncoding:NSASCIIStringEncoding] toPeers:peers withMode:MCSessionSendDataReliable error:&error];
}


@end
