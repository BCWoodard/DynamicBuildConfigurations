//
//  SPZConfiguration.m
//  DynamicBuildConfigurations
//
//  Created by Brad Woodard on 1/13/14.
//  Copyright (c) 2014 Brad Woodard. All rights reserved.
//

#import "SPZConfiguration.h"

@interface SPZConfiguration ()

@end

@implementation SPZConfiguration

// 1. STATIC declaration of the SPZConfiguration object to ensure only 1 instance exists
static SPZConfiguration *_mSharedInstance = nil;

// 2. Synthesize the object properties
@synthesize _mConfiguration, _mFlurryCode, _mURL, _mGoogleCode;

// 3. Create a shared instance of SPZConfiguration that can be called within a controller
#pragma mark - Create Shared Instance
+ (SPZConfiguration *)getSharedInstance
{
    if (!_mSharedInstance) {
        _mSharedInstance = [[self alloc] init];
    }
    
    return _mSharedInstance;
}

// 4. Override the initializer and assign values to properties
#pragma mark - Override Initializer
- (id)init
{
    if (self = [super init]) {
        
        // a. Read the CONFIGURATION SETTING from the -Info.plist
        self._mConfiguration = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"Configuration"];
    
        // b. Read the Configuration dictionary
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Configurations" ofType:@"plist"];
        NSDictionary *configurationsDictionary = [NSDictionary dictionaryWithContentsOfFile:path];
        
        // c. Declare a local dictionary with environment-specific settings
        NSDictionary *buildConfigurationDictionary;
        
        // d. Identify the configuration for the build and populate 'buildConfigurationDictionary'
        if ([self._mConfiguration isEqualToString:@"Development"]) {
            buildConfigurationDictionary = [configurationsDictionary objectForKey:@"Development"];
        } else {
            buildConfigurationDictionary = [configurationsDictionary objectForKey:@"Production"];
        }
        
        // e. Assign values to the remaining properties
        self._mFlurryCode = [buildConfigurationDictionary objectForKey:@"FlurryCode"];
        self._mURL = [buildConfigurationDictionary objectForKey:@"URL"];
        self._mGoogleCode = [buildConfigurationDictionary objectForKey:@"GoogleCode"];
        
    }
    
    return self;
}

@end
