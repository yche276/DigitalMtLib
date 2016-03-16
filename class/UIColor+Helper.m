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

-(UIColor *)reverseColor{
    CGColorRef oldCGColor = self.CGColor;
    
    int numberOfComponents = (int)CGColorGetNumberOfComponents(oldCGColor);
    // can not invert - the only component is the alpha
    if (numberOfComponents == 1) {
        return [UIColor colorWithCGColor:oldCGColor];
    }
    
    const CGFloat *oldComponentColors = CGColorGetComponents(oldCGColor);
    CGFloat newComponentColors[numberOfComponents];
    
    int i = numberOfComponents - 1;
    newComponentColors[i] = oldComponentColors[i]; // alpha
    while (--i >= 0) {
        newComponentColors[i] = 1 - oldComponentColors[i];
    }
    
    CGColorRef newCGColor = CGColorCreate(CGColorGetColorSpace(oldCGColor), newComponentColors);
    UIColor *newColor = [UIColor colorWithCGColor:newCGColor];
    CGColorRelease(newCGColor);
    
    //=====For the GRAY colors 'Middle level colors'
    CGFloat white = 0;
    [self getWhite:&white alpha:nil];
    
    if(white>0.3 && white < 0.67)
    {
        if(white >= 0.5)
            newColor = [UIColor darkGrayColor];
        else if (white < 0.5)
            newColor = [UIColor blackColor];
        
    }
    return newColor;
}
@end
