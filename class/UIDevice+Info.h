//
//  UIDevice+Info.h
//  DigitalMtLib
//
//  Created by Victor Chen on 3/27/15.
//  Copyright (c) 2015 Digital Mt. Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum _DEVICE_TYPE
{
    DEVICE_TYPE_UNKNOWN = 1000,
    DEVICE_TYPE_IPHONE,
    DEVICE_TYPE_IPOD,
    DEVICE_TYPE_IPAD,
    DEVICE_TYPE_SIMULATOR,
    
}DeviceType;

typedef enum _DEVICE_DISPLAY
{
    DEVICE_DISPLAY_UNKNOWN = 2000,
    DEVICE_DISPLAY_IPHONE_35INCH,//iPhone 4s and all models before 2010, upto 4th generation iPod Touch
    DEVICE_DISPLAY_IPHONE_40INCH,//iPhone 5
    DEVICE_DISPLAY_IPHONE_47INCH,//iPhone 6
    DEVICE_DISPLAY_IPHONE_55INCH,//iPhone 6 Plus
    DEVICE_DISPLAY_IPAD,
    
}DeviceDisplay;


@interface UIDevice (Info)

@property (assign, atomic, readonly) DeviceType type;
@property (assign, atomic, readonly) DeviceDisplay display;

- (NSString *) platform;
- (NSString *) platformString;

- (NSString *)versionFromInfoPlist;
- (NSString *)bundleNameFromInfoPlist;
- (NSString *)bundleIdFromInfoPlist;

- (NSString *)description;
@end
