//
//  SPZViewController.m
//  DynamicBuildConfigurations
//
//  Created by Brad Woodard on 1/13/14.
//  Copyright (c) 2014 Brad Woodard. All rights reserved.
//

#import "SPZViewController.h"
#import "SPZConfiguration.h"

@interface SPZViewController ()
{
    __weak IBOutlet UILabel *mEnvironmentLabel;
    __weak IBOutlet UILabel *mFlurryCodeLabel;
    __weak IBOutlet UILabel *mAPIURLLabel;
    __weak IBOutlet UILabel *mGACodeLabel;
}

@end

@implementation SPZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1. Get an instance of SPZConfiguration
    SPZConfiguration *mBuildSettings = [SPZConfiguration getSharedInstance];
    
    // 2. Populate the UI Elements
    mEnvironmentLabel.text = mBuildSettings._mConfiguration;
    mGACodeLabel.text = mBuildSettings._mGoogleCode;
    mFlurryCodeLabel.text = mBuildSettings._mFlurryCode;
    mAPIURLLabel.text = mBuildSettings._mURL;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
