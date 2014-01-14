//
//  SPZConfiguration.h
//  DynamicBuildConfigurations
//
//  Created by Brad Woodard on 1/13/14.
//  Copyright (c) 2014 Brad Woodard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPZConfiguration : NSObject

// Properties
@property (strong, nonatomic) NSString *configuration;
@property (strong, nonatomic) NSString *FlurryCode;
@property (strong, nonatomic) NSString *URL;
@property (strong, nonatomic) NSString *GoogleCode;

// Methods
+ (SPZConfiguration *)getSharedInstance;

@end
