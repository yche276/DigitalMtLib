//
//  UIApplication+Dimension.m
//  QBookDemo
//
//  Created by Victor Chen on 3/04/13.
//  Copyright (c) 2013 Mt. Zendo Inc. All rights reserved.
//

#import "UIApplication+Dimension.h"

@implementation UIApplication (Dimension)
+(CGSize) currentSize
{
    return [UIApplication sizeInOrientation:[UIApplication sharedApplication].statusBarOrientation];
}

+(CGSize) sizeInOrientation:(UIInterfaceOrientation)orientation
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    UIApplication *application = [UIApplication sharedApplication];
    if (UIInterfaceOrientationIsLandscape(orientation))
    {
        size = CGSizeMake(size.height, size.width);
    }
    if (application.statusBarHidden == NO)
    {
        size.height -= MIN(application.statusBarFrame.size.width, application.statusBarFrame.size.height);
    }
    return size;
}

@end
