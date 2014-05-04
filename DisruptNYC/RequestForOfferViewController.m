//
//  RequestForOfferViewController.m
//  DisruptNYC
//
//  Created by Emin on 5/3/14.
//  Copyright (c) 2014 Disrupt. All rights reserved.
//

#import "RequestForOfferViewController.h"
#import "UIImage+animatedGIF.h"
#import "Connection.h"

@interface RequestForOfferViewController ()

@end

@implementation RequestForOfferViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //UIImage *animatedGif = [UIImage animatedImageWithAnimatedGIFURL:[NSURL URLWithString:@"http://37.media.tumblr.com/tumblr_lx9qvrIYEx1qe5q3go1_500.gif"]];
    //[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:animatedGif] forBarMetrics:UIBarMetricsDefault];
    Connection* con = [Connection model];
    BOOL b = con.finishedRequest;
    
    
    [self.distanceSlider setThumbImage:[UIImage imageNamed:@"circle-radius"] forState:UIControlStateNormal];
    [self.distanceSlider  setMinimumTrackImage:[[UIImage imageNamed:@"blue slider bar"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [self.distanceSlider  setMaximumTrackImage:[[UIImage imageNamed:@"blue slider bar"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
    //[self.distanceSlider set]
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveTestNotification:)
                                                 name:@"TestNotification"
                                               object:nil];

    
    
}



-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:NO];

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

- (void) receiveTestNotification:(NSNotification *) notification
{
    // [notification name] should always be @"TestNotification"
    // unless you use this method for observation of other notifications
    // as well.
    
    if ([[notification name] isEqualToString:@"TestNotification"]){
        Connection *connection =  notification.object;
        NSLog (@"Successfully received the test notification! %@", connection.name);
        
        [UIView animateWithDuration:1 delay:.2 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.userLabel.text = [NSString stringWithFormat:@"(Concur User: %@)", connection.name];
        } completion:^(BOOL finished) {
            self.userLabel.text = [NSString stringWithFormat:@"(Concur User: %@)", connection.name];
        }];
    }
    
    
}


@end
