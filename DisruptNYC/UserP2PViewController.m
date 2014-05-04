//
//  UserViewController.m
//  DisruptNYC
//
//  Created by local admin on 5/3/14.
//  Copyright (c) 2014 Disrupt. All rights reserved.
//

#import "UserP2PViewController.h"


@interface UserP2PViewController ()

-(NSString *)stringForPeerConnectionState:(MCSessionState)state;
-(void) startAdvertising;

@end

@implementation UserP2PViewController
{
    
    MCPeerID *_peerID;
    MCSession *_mcSession;
    MCAdvertiserAssistant *_mcAdvertiserAssistant;
    UIButton *_startAdvertisingButonControl;
    UITextView *_merchantRepliesTextView;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        _peerID = [[MCPeerID alloc] initWithDisplayName:@"Rene Saroza"];
        _mcSession = [[MCSession alloc] initWithPeer:_peerID];
        _mcSession.delegate = self;
        _mcAdvertiserAssistant = [[MCAdvertiserAssistant alloc] initWithServiceType:@"service" discoveryInfo:nil session:_mcSession];
        
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
    
    _startAdvertisingButonControl = [UIButton buttonWithType:UIButtonTypeSystem];
    _startAdvertisingButonControl.backgroundColor = [UIColor greenColor];
    _startAdvertisingButonControl.frame = CGRectMake (0, 20, 320, 40);
    
    [_startAdvertisingButonControl addTarget:self action:@selector(startAdvertising) forControlEvents:UIControlEventTouchUpInside];
    [_startAdvertisingButonControl setTitle:@"Connect" forState:UIControlStateNormal];
    
    _merchantRepliesTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 60, 320, 468)];
    _merchantRepliesTextView.editable = NO;
    _merchantRepliesTextView.backgroundColor = [UIColor blackColor];
    _merchantRepliesTextView.textColor = [UIColor whiteColor];
    
    [self.view addSubview:_startAdvertisingButonControl];
    [self.view addSubview:_merchantRepliesTextView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - MCSessionDelegate methods

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


@end
