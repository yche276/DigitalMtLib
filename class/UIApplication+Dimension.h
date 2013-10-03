//
//  UIApplication+Dimension.h
//  QBookDemo
//
//  Created by Victor Chen on 3/04/13.
//  Copyright (c) 2013 Mt. Zendo Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (Dimension)

+(CGSize) currentSize;
+(CGSize) sizeInOrientation:(UIInterfaceOrientation)orientation;

@end
