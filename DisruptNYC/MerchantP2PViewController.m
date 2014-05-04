//
//  MerchantViewController.m
//  P2PMerchant
//
//  Created by local admin on 5/3/14.
//  Copyright (c) 2014 local admin. All rights reserved.
//

#import "MerchantP2PViewController.h"
@import MultipeerConnectivity;

@interface MerchantP2PViewController ()
{
    MCPeerID *_peerID;
    MCSession *_mcSession;
    MCBrowserViewController *_browserViewController;

    UIButton *_startBrowsingButonControl;
    UIButton *_sendDataButonControl;
    UITextField *_offers;
    
    NSMutableArray *_peers;
}
@end

@implementation MerchantP2PViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        _peerID = [[MCPeerID alloc] initWithDisplayName:@"Merchant"];
        _mcSession = [[MCSession alloc] initWithPeer:_peerID];
        _mcSession.delegate = self;
        _peers = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) loadView
{
    
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    
    _startBrowsingButonControl = [UIButton buttonWithType:UIButtonTypeSystem];
    _startBrowsingButonControl.backgroundColor = [UIColor greenColor];
    _startBrowsingButonControl.frame = CGRectMake (0, 20, 768, 80);
    
    [_startBrowsingButonControl addTarget:self action:@selector(startBrowsingForPeers) forControlEvents:UIControlEventTouchUpInside];
    [_startBrowsingButonControl setTitle:@"Start Browsing ..." forState:UIControlStateNormal];
    
    _offers = [[UITextField alloc] initWithFrame:CGRectMake(0, 100, 688, 80)];
    _offers.backgroundColor = [UIColor darkGrayColor];
    
    _sendDataButonControl = [UIButton buttonWithType:UIButtonTypeSystem];
    _sendDataButonControl.frame = CGRectMake (688, 20, 80, 80);
    [_sendDataButonControl setTitle:@"Send" forState:UIControlStateNormal];
    
    [_sendDataButonControl addTarget:self action:@selector(sendData) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_startBrowsingButonControl];
    [self.view addSubview:_sendDataButonControl];
    
    [self.view addSubview:_offers];
    
               
}

#pragma mark - MCSessionDelegate methods

// Override this method to handle changes to peer session state
- (void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state
{
    
    NSLog(@"Peer [%@] changed state to %@", peerID.displayName, [self stringForPeerConnectionState:state]);
    
    switch (state)
    {
        case MCSessionStateConnected:
            NSLog (@"Case MCSessionStateConnected");
            [_peers addObject:peerID];
            break;
        
        case MCSessionStateConnecting:
            NSLog (@"Case MCSessionStateConnecting");
            break;
            
        case MCSessionStateNotConnected:
            NSLog (@"Case MCSessionStateNotConnected");
            break;
            
            /*
            _mcSession = [[MCSession alloc] initWithPeer:_peerID];
            _mcSession.delegate = self;
          */
    }
    
}

// MCSession Delegate callback when receiving data from a peer in a given session
- (void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID
{
    
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
    switch (state) {
        case MCSessionStateConnected:
            return @"Connected";
            
        case MCSessionStateConnecting:
            return @"Connecting";
            
        case MCSessionStateNotConnected:
            return @"Not Connected";
    }
}

-(void) startBrowsingForPeers
{
    
    NSLog(@"Peer with id %@ started browsing ... ", _peerID.displayName);
    _browserViewController = [[MCBrowserViewController alloc] initWithServiceType:@"service" session:_mcSession];
    _browserViewController.delegate = self;
    [self presentViewController:_browserViewController animated:YES completion:nil];
    
    
}

-(void) sendData
{
    NSLog(@"Sending data %@", _offers.text);
    NSError *error = [[NSError alloc] init];
    [_mcSession sendData:[_offers.text dataUsingEncoding:NSASCIIStringEncoding] toPeers:_peers withMode:MCSessionSendDataReliable error:&error];
}

-(void) browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController
{
    
    [_browserViewController dismissViewControllerAnimated:YES completion:nil];
    
}

-(void) browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController
{

    NSLog(@"browserViewControllerWasCancelled ... ");
    [_browserViewController dismissViewControllerAnimated:YES completion:nil];
   
}


@end
