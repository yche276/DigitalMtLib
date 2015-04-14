/*
 *  DigitalMt.h
 *  DigitalMtLib
 *
 *  Created by Victor Chen on 4/10/10.
 *  Copyright 2010 Mt. Zendo Inc. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <CoreGraphics/CoreGraphics.h>

#import "DLog.h"
#import "UIApplication+Dimension.h"
#import "UIDevice+Info.h"

#define TT_RELEASE_SAFELY(__POINTER) { [__POINTER release]; __POINTER = nil; }


#define IS_IPAD             (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define IS_IPHONE           (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_4         (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 480.0f)
#define IS_IPHONE_5         (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0f)
#define IS_IPHONE_6         (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0f)
#define IS_IPHONE_6_PLUS    (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0f)


