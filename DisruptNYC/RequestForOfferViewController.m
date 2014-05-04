//
//  RequestForOfferViewController.m
//  DisruptNYC
//
//  Created by Emin on 5/3/14.
//  Copyright (c) 2014 Disrupt. All rights reserved.
//

#import "RequestForOfferViewController.h"
#import "UIImage+animatedGIF.h"

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

    [self.distanceSlider setThumbImage:[UIImage imageNamed:@"circle-radius"] forState:UIControlStateNormal];
    //[self.distanceSlider set]
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
