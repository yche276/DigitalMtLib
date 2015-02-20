//
//  DMTLightingLabel.m
//  
//
//  Created by Victor Chen on 1/11/10.
//  Copyright Mt. Zendo Inc. 2010. All rights reserved.
//

#import "DMTLightingLabel.h"

@implementation DMTLightingLabel

@synthesize text = _text, font = _font, textColor, spotlightColor = _spotlightColor,
  textAlignment = _textAlignment;

//////////////////////////////////////////////////////////////////////////////////////////////////
// private

- (void)newMask {
  CGRect rect = self.frame;
  CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
  int bitmapBytesPerRow = (rect.size.width * 4);
  int bitmapByteCount = (bitmapBytesPerRow * rect.size.height);
  _maskData = malloc(bitmapByteCount);
  _maskContext = CGBitmapContextCreate(_maskData, rect.size.width, rect.size.height,
                          8, bitmapBytesPerRow, space, kCGImageAlphaPremultipliedLast);
  CGColorSpaceRelease(space);
}

- (void)releaseMask {
  CGContextRelease(_maskContext);
  free(_maskData);
  _maskContext = nil;
  _maskData = nil;
}

- (CGImageRef)newSpotlightMask:(CGRect)rect origin:(CGPoint)origin radius:(CGFloat)radius {
  CGContextClearRect(_maskContext, rect);

  CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
  CGFloat components[] = {1, 1, 1, 1, 0, 0, 0, 0};
  CGFloat locations[] = {0, 1};
  CGGradientRef gradient = CGGradientCreateWithColorComponents(space, components, locations, 2);
  CGContextDrawRadialGradient(_maskContext, gradient, origin, 0, origin, radius, 0);
  CGGradientRelease(gradient);
  CGColorSpaceRelease(space);

  return CGBitmapContextCreateImage(_maskContext);
}

- (void)updateSpotlight {
	_spotlightPoint += 1.3/32;
  if (_spotlightPoint > 2) {
    _spotlightPoint = -0.5;
  }
  if (_spotlightPoint <= 1.5) {
    [self setNeedsDisplay];
  }
	//[self setNeedsDisplay];
}

//////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject
- (void) commonInit
{
	_timer = nil;
	hasGlowDrawed = NO;
    
	self.text = @"";
	//self.font = TTSTYLEVAR(font);
	self.font = [UIFont systemFontOfSize:20];
	self.textColor = [UIColor colorWithWhite:0.25f alpha:1];
	//self.textColor = [UIColor blackColor];
	self.spotlightColor = [UIColor whiteColor];
	self.textAlignment = UITextAlignmentLeft;
	self.backgroundColor = [UIColor clearColor];
	self.contentMode = UIViewContentModeCenter;
	self.clearsContextBeforeDrawing = YES;

}
//wake from NIB
- (id)initWithCoder:(NSCoder *)coder
{
	if (self = [super initWithCoder:coder]) {
		[self commonInit];
    }
	return self;
}
- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		[self commonInit];
	}
	return self;
}

- (void)dealloc {
  [self stopAnimating];

  TT_RELEASE_SAFELY(_text);
  TT_RELEASE_SAFELY(_font);
  TT_RELEASE_SAFELY(textColor);
  TT_RELEASE_SAFELY(_spotlightColor);
 
  [super dealloc];
}

//////////////////////////////////////////////////////////////////////////////////////////////////
// UIView

- (void)drawRect:(CGRect)rect {
  CGContextRef context = UIGraphicsGetCurrentContext();
	//NSLog(@"asdfasfasdfa");
	//if (hasGlowDrawed == NO) {
	/*
		float glowWidth = 10.0*10;
		float colorValues[] = { 0, 0, 1, 1.0 };
		CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
		CGColorRef glowColor = CGColorCreate( colorSpace, colorValues );
		CGContextSetShadowWithColor( context, CGSizeMake( 0.0, 0.0 ), glowWidth, glowColor );
		CGColorRelease(glowColor);	
		hasGlowDrawed = YES;
	*/
	//}
/*	
float glowWidth = 10.0*10;
float colorValues[] = { 0, 0, 1, 1.0 };
CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
CGColorRef glowColor = CGColorCreate( colorSpace, colorValues );
CGContextSetShadowWithColor( context, CGSizeMake( 0.0, 0.0 ), glowWidth, glowColor );
CGColorRelease(glowColor);	
*/

  CGSize textSize = [self sizeThatFits:CGSizeZero];
  
  CGFloat x = 0;
  if (_textAlignment == UITextAlignmentRight) {
    x = self.frame.size.width - textSize.width;
  } else if (_textAlignment == UITextAlignmentCenter) {
    x = ceil(self.frame.size.width/2 - textSize.width/2);
  }
  
  CGFloat y = 0;
  if (self.contentMode == UIViewContentModeCenter) {
    y = ceil(rect.size.height/2 + _font.capHeight/2);
  } else if (self.contentMode == UIViewContentModeBottom) {
    y = rect.size.height + _font.descender;
  } else {
    y = _font.capHeight;
  }
  
  CGContextSelectFont(context, [_font.fontName UTF8String], _font.pointSize, kCGEncodingMacRoman);
  CGContextSetTextDrawingMode(context, kCGTextFill);
  CGContextSetTextMatrix(context, CGAffineTransformScale(CGAffineTransformIdentity, 1, -1));

	CGContextSetFillColorWithColor(context, textColor.CGColor);
	//CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
	//CGContextShowTextAtPoint(context, x, y, [self.text UTF8String], self.text.length);
	[self.text drawAtPoint:CGPointMake(x, y) withFont:self.font];
	
  if (_timer) {
    CGPoint spotOrigin = CGPointMake(x + (textSize.width * _spotlightPoint), y - ceil(self.font.capHeight/2));
    CGFloat spotRadius = self.font.capHeight*6;

    CGImageRef mask = [self newSpotlightMask:rect origin:spotOrigin radius:spotRadius];
    CGContextClipToMask(context, rect, mask);
    CGImageRelease(mask);
    
    [_spotlightColor setFill];
    //CGContextShowTextAtPoint(context, x, y, [self.text UTF8String], self.text.length);
	[self.text drawAtPoint:CGPointMake(x, y) withFont:self.font];
	 // NSString *tmp = @"中文";
	  //[tmp drawAtPoint:CGPointMake(10, 60) withFont:[UIFont systemFontOfSize:25]];
	  

  }
 
}

- (CGSize)sizeThatFits:(CGSize)size {
  return [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
}

//////////////////////////////////////////////////////////////////////////////////////////////////
// UIAccessibility

- (BOOL)isAccessibilityElement {
  return YES;
}

- (NSString *)accessibilityLabel {
  return _text;
}

- (UIAccessibilityTraits)accessibilityTraits {
  return [super accessibilityTraits] | UIAccessibilityTraitStaticText;
}

//////////////////////////////////////////////////////////////////////////////////////////////////
// public


- (void)doAnimationThd
{
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	while (YES) {
	
		[self updateSpotlight];
		usleep(1.0/32 );
		
	}
	
	[pool release];	
	
	return;
}
- (void)test
{
	
}

- (void)startAnimating {
	//[self performSelectorOnMainThread:@selector(doAnimationThd) withObject:nil waitUntilDone:NO];
/*	
	_spotlightPoint = -0.5;
    [self newMask];
	[NSThread detachNewThreadSelector:@selector(doAnimationThd) toTarget:self withObject:nil];
	 _timer = [NSTimer scheduledTimerWithTimeInterval:100 target:self selector:@selector(test) userInfo:nil repeats:YES];
*/	
	
	
  if (!_timer) {
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0/32 target:self selector:@selector(updateSpotlight) userInfo:nil repeats:YES];
    _spotlightPoint = -0.5;
    [self newMask];
  }
 
	 
}

- (void)stopAnimating {
  if (_timer) {
    [_timer invalidate];
    _timer = nil;
    [self releaseMask];
  }
  [self setNeedsDisplay];	
}

@end
