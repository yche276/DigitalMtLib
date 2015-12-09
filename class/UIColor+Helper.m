//
//  UIColor+Helper.m
//  MtZendoLib
//
//  Created by Victor Chen on 5/10/15.
//  Copyright (c) 2015 Digital Mt. Inc. All rights reserved.
//

#import "UIColor+Helper.h"
#define RAND_FROM_TO(min, max) (min + arc4random_uniform(max - min + 1))

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

+(UIColor *)randomColor{
    float r = RAND_FROM_TO(0,255);
    float g = RAND_FROM_TO(0,255);
    float b = RAND_FROM_TO(0,255);
    
    return [UIColor colorWithRed:(float)r/255 green:(float)g/255 blue:(float)b/255 alpha:1.0f];
}
@end
