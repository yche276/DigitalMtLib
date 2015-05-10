//
//  UIColor+Helper.m
//  MtZendoLib
//
//  Created by Victor Chen on 5/10/15.
//  Copyright (c) 2015 Digital Mt. Inc. All rights reserved.
//

#import "UIColor+Helper.h"

@implementation UIColor (Helper)

+(UIColor *)red:(CGFloat)prmRed
          green:(CGFloat)prmGreen
           blue:(CGFloat)prmBlue
          alpha:(CGFloat)prmAlpha
{
    return [UIColor colorWithRed:(CGFloat)prmRed/255
                           green:(CGFloat)prmGreen/255
                            blue:(CGFloat)prmBlue/255
                           alpha:prmAlpha];
}
@end
