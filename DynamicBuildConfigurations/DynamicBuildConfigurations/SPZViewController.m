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
	// Do any additional setup after loading the view, typically from a nib.
    
    // 1. Get an instance of SPZConfiguration
    SPZConfiguration *buildSettings = [SPZConfiguration getSharedInstance];
    
    // 2. Populate the UI Elements
    mEnvironmentLabel.text = buildSettings._mConfiguration;
    mGACodeLabel.text = buildSettings._mGoogleCode;
    mFlurryCodeLabel.text = buildSettings._mFlurryCode;
    mAPIURLLabel.text = buildSettings._mURL;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
