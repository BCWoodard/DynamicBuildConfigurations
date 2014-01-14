//
//  TUTConfiguration.h
//  TUTBuildConfigurations
//
//  Created by Brad Woodard on 12/12/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPZConfiguration : NSObject

/*
+ (NSString *)configuration;
+ (NSString *)CAMFlurryCode;
+ (NSString *)CAMurl;
+ (NSString *)CAMGoogleAnalyticsCode;
*/

// Properties
@property (strong, nonatomic) NSString *configuration;
@property (strong, nonatomic) NSString *FlurryCode;
@property (strong, nonatomic) NSString *URL;
@property (strong, nonatomic) NSString *GoogleCode;

// Methods
+ (SPZConfiguration *)getSharedInstance;

@end
