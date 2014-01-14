//
//  TUTConfiguration.m
//  TUTBuildConfigurations
//
//  Created by Brad Woodard on 12/12/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "SPZConfiguration.h"
#define TUTConfigurationCAMFlurryCode @"CAMFlurryCode"
#define TUTConfigurationCAMGoogleAnalyticsCode @"CAMGoogleAnalyticsCode"
#define TUTConfigurationCAMurl @"CAMurl"

@interface SPZConfiguration ()

//@property (copy, nonatomic) NSString        *configuration;
//@property (strong, nonatomic) NSDictionary  *variables;

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

/*
#pragma mark - Shared Configuration
+ (SPZConfiguration *)sharedConfiguration
{
    static SPZConfiguration *_sharedConfiguration = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedConfiguration = [[self alloc] init];
    });
    
    return _sharedConfiguration;
}

#pragma mark - Private Initialization
- (id)init
{
    self = [super init];
    
    if (self) {
        // FETCH the current configuration
        NSBundle *mainBundle = [NSBundle mainBundle];
        self.configuration = [[mainBundle infoDictionary] objectForKey:@"Configuration"];
        
        // LOAD the configurations
        NSString *path = [mainBundle pathForResource:@"Configurations" ofType:@"plist"];
        NSDictionary *configurations = [NSDictionary dictionaryWithContentsOfFile:path];
        
        // LOAD current configuration variables
        self.variables = [configurations objectForKey:self.configuration];
    }
    
    return self;
}

#pragma mark - Return the Configuration string for use by other objects
+ (NSString *)configuration
{
    return [[SPZConfiguration sharedConfiguration] configuration];
}

#pragma mark - Flurry Code
+ (NSString *)CAMFlurryCode
{
    SPZConfiguration *sharedConfiguration = [SPZConfiguration sharedConfiguration];
    if (sharedConfiguration.variables) {
        return [sharedConfiguration.variables objectForKey:TUTConfigurationCAMFlurryCode];
    }
    
    return nil;
}


#pragma mark - Google Analytics Code
+ (NSString *)CAMGoogleAnalyticsCode
{
    SPZConfiguration *sharedConfiguration = [SPZConfiguration sharedConfiguration];
    if (sharedConfiguration.variables) {
        return [sharedConfiguration.variables objectForKey:TUTConfigurationCAMGoogleAnalyticsCode];
    }
    
    return nil;
}


#pragma mark - URL
+ (NSString *)CAMurl
{
    SPZConfiguration *sharedConfiguration = [SPZConfiguration sharedConfiguration];
    if (sharedConfiguration.variables) {
        return [sharedConfiguration.variables objectForKey:TUTConfigurationCAMurl];
    }
    
    return nil;
}
*/

@end
