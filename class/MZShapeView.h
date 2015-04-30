//
//  MZShapeView.h
//  DigitalMtLib
//
//  Created by Victor Chen on 7/27/14.
//  Copyright (c) 2014 Mt Zendo Inc. All rights reserved.
//



#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

typedef enum : NSInteger
{
	OutlineTypeHexagon = 0,
	OutlineTypeOval = 1,
    OutlineTypeStar = 2,
    OutlineTypeRectangle
} OutlineType;



@interface MZShapeView : UIView <UIAccelerometerDelegate>{
    BOOL _drawInnerShadow;
    
    BOOL _startListening;
    CATransform3D _rotateTransformH;
    CATransform3D _rotateTransformV;
}
@property (nonatomic, strong) CMMotionManager *motionManager;

@property (nonatomic, assign) OutlineType type;
@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, assign) NSInteger strokeWidth;
@property (nonatomic, assign) CGFloat cornerRadius;



//Public Methods
-(void)motionManagerUpdate:(BOOL)prmEnable;


@end
