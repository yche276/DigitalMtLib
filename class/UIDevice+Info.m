//
//  UIDevice+Info.m
//  DigitalMtLib
//
//  Created by Victor Chen on 3/27/15.
//  Copyright (c) 2015 Digital Mt. Inc. All rights reserved.
//

#import "UIDevice+Info.h"
#import <stdlib.h>
#import <stdio.h>
#import <sys/types.h>
#import <sys/sysctl.h>
#import <sys/utsname.h>

@implementation UIDevice (Info)


- (NSString *)description {
    
    NSMutableString* messageBody = [NSMutableString stringWithString:@"" ];
    
    NSTimeZone *localTime = [NSTimeZone systemTimeZone];
    
    NSString *languageCode = [[NSLocale preferredLanguages] objectAtIndex:0];
    NSLocale* locale = [NSLocale currentLocale];
    NSString *languageRegion =  [locale localeIdentifier];
    
    [messageBody appendFormat: @"App Name        : %@\n", [self bundleNameFromInfoPlist]];
    [messageBody appendFormat: @"App Id          : %@\n", [self bundleIdFromInfoPlist]];
    [messageBody appendFormat: @"App Version     : %@\n",  [self versionFromInfoPlist ]];
    
    [messageBody appendFormat: @"Model           : %@\n",  [self platformString]];//[UIDevice currentDevice].model]
    [messageBody appendFormat: @"Platform        : %@\n", [UIDevice currentDevice].model];
    [messageBody appendFormat: @"System Name     : %@\n", [UIDevice currentDevice].systemName];
    [messageBody appendFormat: @"System Version  : %@\n",[UIDevice currentDevice].systemVersion];
    
    [messageBody appendFormat: @"Timezone        : %@\n", [localTime name]];
    [messageBody appendFormat: @"Language Code   : %@\n", languageCode];
    [messageBody appendFormat: @"Language Region : %@\n", languageRegion];

    
    
    return messageBody;
}

- (NSString *)bundleIdFromInfoPlist {
    NSString *bundleId = (NSString*)[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
    return bundleId;
}
- (NSString *)bundleNameFromInfoPlist {
    NSString *appName = (NSString*)[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    if (!appName) {
        appName = (NSString*) [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
    }
    return appName;
}
- (NSString *)versionFromInfoPlist {
    NSString *currentVersion = (NSString*)[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
    return currentVersion;
}

- (NSString *) platform{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding: NSUTF8StringEncoding];
    free(machine);
    return platform;
}


- (NSString *) platformString {
    NSString *platform = [self platform];
    
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (UK+Europe+Asia+China)";
    if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (UK+Europe+Asia+China)";
    if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";

    
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch (1 Gen)";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch (2 Gen)";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch (3 Gen)";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch (4 Gen)";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch (5 Gen)";
    
    
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([platform isEqualToString:@"iPad1,2"])      return @"iPad 3G";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air 1 (WiFi)";
    if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air 1 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad4,3"])      return @"iPad Air 1";
    if ([platform isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([platform isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    
    
    
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad Mini";
    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
    
    if ([platform isEqualToString:@"iPad4,4"])      return @"iPad Mini 2 (WiFi)";
    if ([platform isEqualToString:@"iPad4,5"])      return @"iPad Mini 2";
    if ([platform isEqualToString:@"iPad4,6"])      return @"iPad Mini 2";
    
    if ([platform isEqualToString:@"iPad4,7"])      return @"iPad Mini 3";
    if ([platform isEqualToString:@"iPad4,8"])      return @"iPad Mini 3";
    if ([platform isEqualToString:@"iPad4,9"])      return @"iPad Mini 3";
    
    if ([platform isEqualToString:@"iPad5,1"])      return @"iPad Mini 4 (WiFi)";
    if ([platform isEqualToString:@"iPad5,2"])      return @"iPad Mini 4 (LTE);
        
        
    if ([platform isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([platform isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    if ([platform isEqualToString:@"iPad6,8"])      return @"iPad Pro";
    
    if ([platform isEqualToString:@"AppleTV2,1"])   return @"Apple TV 2G";
    if ([platform isEqualToString:@"AppleTV3,1"])   return @"Apple TV 3";
    if ([platform isEqualToString:@"AppleTV3,2"])   return @"Apple TV 3 (2013)";

    
    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
    
    return platform;
}

#pragma mark - Getter Methods
-(DeviceType)type{
    DeviceType devType = DEVICE_TYPE_UNKNOWN;
    if (TARGET_IPHONE_SIMULATOR) {
        devType = DEVICE_TYPE_SIMULATOR;
    }
    else {
        NSString *platform = [self platform];
        if ([platform containsString:@"iPhone"]) {
            devType = DEVICE_TYPE_IPHONE;
        }
        else if ([platform containsString:@"iPad"]) {
            devType = DEVICE_TYPE_IPAD;
        }
        else if ([platform containsString:@"iPod"]) {
            devType = DEVICE_TYPE_IPOD;
        }
    }
    return devType;
}


-(DeviceDisplay)display{
    DeviceDisplay dis = DEVICE_DISPLAY_UNKNOWN;
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    // iPad
    if (((screenWidth == 768) && (screenHeight == 1024)) ||
        ((screenWidth == 1024) && (screenHeight == 768))) {
        dis = DEVICE_DISPLAY_IPAD;
    }
    // iPhone 3.5 inch
    else if (((screenWidth == 320) && (screenHeight == 480)) ||
             ((screenWidth == 480) && (screenHeight == 320))) {
        dis = DEVICE_DISPLAY_IPHONE_35INCH;
    }
    // iPhone 4 inch
    else if (((screenWidth == 320) && (screenHeight == 568)) ||
             ((screenWidth == 568) && (screenHeight == 320))) {
        dis = DEVICE_DISPLAY_IPHONE_40INCH;
    }
    // iPhone 4.7 inch
    else if (((screenWidth == 375) && (screenHeight == 667)) ||
             ((screenWidth == 667) && (screenHeight == 375))) {
        dis = DEVICE_DISPLAY_IPHONE_47INCH;
    }
    // iPhone 5.5 inch
    else if (((screenWidth == 414) && (screenHeight == 736)) ||
             ((screenWidth == 736) && (screenHeight == 414))) {
        dis = DEVICE_DISPLAY_IPHONE_55INCH;
    }
    
    
    return dis;
}
@end










