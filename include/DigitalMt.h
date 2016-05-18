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

//Custom views
#import "MZShapeView.h"
#import "MZProfilePhotoView.h"

//Category
#import "UIDevice+Info.h"
#import "NSFileManager+Path.h"
#import "UIColor+Helper.h"


//Controller
#import "MZDateSelectViewController.h"
#import "MZTimeSelectViewController.h"



/**
 Generate a random number in the range from given min and max
 */
#define RAND_FROM_TO(min, max) (min + arc4random_uniform(max - min + 1))

/** Degrees to Radian **/
#define degreesToRadians( degrees ) ( ( degrees ) / 180.0 * M_PI )

/** Radians to Degrees **/
#define radiansToDegrees( radians ) ( ( radians ) * ( 180.0 / M_PI ) )



#define TT_RELEASE_SAFELY(__POINTER) { [__POINTER release]; __POINTER = nil; }

/** return true if the app running on iPad */
#define IS_IPAD             (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
/** return true if the app running on iPhone */
#define IS_IPHONE           (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)


#define IS_IPHONE_4         (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 480.0f)
#define IS_IPHONE_5         (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0f)
#define IS_IPHONE_6         (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0f)
#define IS_IPHONE_6_PLUS    (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0f)

/** 
 Make UIColor object 
 Input RGB and Alpha value, integer 0 to 255 integer
 */
#define mzcolor(prmRed, prmGreen, prmBlue, prmAlpha) [UIColor colorWithRed:(CGFloat)prmRed/255    \
                                                                   green:(CGFloat)prmGreen/255  \
                                                                    blue:(CGFloat)prmBlue/255   \
                                                                   alpha:prmAlpha]             \


//#define makecolor(prmRed, prmGreen, prmBlue, prmAlpha) [UIColor colorWithRed:(CGFloat)prmRed/255    \
//                                                                    green:(CGFloat)prmGreen/255  \
//                                                                    blue:(CGFloat)prmBlue/255   \
//                                                                    alpha:prmAlpha]             \







