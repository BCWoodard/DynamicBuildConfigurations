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

// 1. Declare and assign 'nil' value to an SPZConfiguration object
static SPZConfiguration *_mSharedInstance = nil;

// 2. Synthesize the properties
@synthesize configuration, FlurryCode, URL, GoogleCode;

// 3. Create a shared instance of SPZConfiguration
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
    // a. Read the CONFIGURATION SETTING from the -Info.plist
    if (self = [super init]) {
        
        self.configuration = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"Configuration"];
    
        // b. Read the Configuration dictionary
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Configurations" ofType:@"plist"];
        NSDictionary *configurationsDictionary = [NSDictionary dictionaryWithContentsOfFile:path];
        
        // c. Declare a local dictionary with environment-specific settings
        NSDictionary *buildConfigurationDictionary;
        
        // d. Identify the configuration for the build and populate 'buildConfigurationDictionary'
        if ([self.configuration isEqualToString:@"Development"]) {
            buildConfigurationDictionary = [configurationsDictionary objectForKey:@"Development"];
        } else {
            buildConfigurationDictionary = [configurationsDictionary objectForKey:@"Production"];
        }
        
        // e. Assign values to the properties
        //self.configuration = [buildConfigurationDictionary objectForKey:@"Configuration"];
        self.FlurryCode = [buildConfigurationDictionary objectForKey:@"FlurryCode"];
        self.URL = [buildConfigurationDictionary objectForKey:@"URL"];
        self.GoogleCode = [buildConfigurationDictionary objectForKey:@"GoogleCode"];
        
    }
    
    return self;
}

@end
