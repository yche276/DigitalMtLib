//
//  UIColor+Helper.h
//  MtZendoLib
//
//  Created by Victor Chen on 5/10/15.
//  Copyright (c) 2015 Digital Mt. Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Helper)

/**
 
 */
+(UIColor *)red:(CGFloat)prmRed
          green:(CGFloat)prmGreen
           blue:(CGFloat)prmBlue
          alpha:(CGFloat)prmAlpha;


+(UIColor *)randomColor;

-(UIColor *)reverseColor;

+ (UIColor *)colorFromHexString:(NSString *)hexString;
+ (NSString *)hexStringFromUIColor:(UIColor *)color;
@end
