//
//  DMTLightingLabel.h
//  
//
//  Created by Victor Chen on 1/11/10.
//  Copyright Mt. Zendo Inc. 2010. All rights reserved.
//
//#import <Foundation/Foundation.h>
//#import <UIKit/UIKit.h>

#import "DigitalMt.h"




@interface DMTLightingLabel : UIView {
  NSString* _text;
  UIFont* _font;
  UIColor* textColor;
  UIColor* _spotlightColor;
  UITextAlignment _textAlignment;
  NSTimer* _timer;
  CGFloat _spotlightPoint;
  CGContextRef _maskContext;
  void* _maskData;
	
	BOOL hasGlowDrawed;
}

@property(nonatomic,copy) NSString* text;
@property(nonatomic,retain) UIFont* font;
@property(nonatomic,retain) UIColor* textColor;
@property(nonatomic,retain) UIColor* spotlightColor;
@property(nonatomic) UITextAlignment textAlignment;

- (void)startAnimating;
- (void)stopAnimating;

@end
