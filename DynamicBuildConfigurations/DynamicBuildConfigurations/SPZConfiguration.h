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
@property (strong, nonatomic) NSString *_mConfiguration;
@property (strong, nonatomic) NSString *_mFlurryCode;
@property (strong, nonatomic) NSString *_mURL;
@property (strong, nonatomic) NSString *_mGoogleCode;

// Methods
+ (SPZConfiguration *)getSharedInstance;

@end
