//
//  TUTViewController.m
//  TUTBuildConfigurations
//
//  Created by Brad Woodard on 12/12/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
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
    
    // UI Elements
    mEnvironmentLabel.text = buildSettings.configuration;
    mGACodeLabel.text = buildSettings.GoogleCode;
    mFlurryCodeLabel.text = buildSettings.FlurryCode;
    mAPIURLLabel.text = buildSettings.URL;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
