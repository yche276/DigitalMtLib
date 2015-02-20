//
//  CoverView.h
//  
//
//  Created by chenyue on 10-4-1.
//  Copyright Mt. Zendo Inc. 2010. All rights reserved.
//

#import "DigitalMt.h"
#define reflectionFraction 0.5
#define reflectionOpacity 0.4
@interface UIImage (ReflecttionImage)

- (UIImage *)addImageReflection:(CGFloat)prmReflectionFraction;

@end


@interface DMTCoverImageView : UIView {
	UIImageView *coverImage;
	
	UIActivityIndicatorView *LoadImageIndicator;
	
	NSMutableData *receivedData;
	NSURLConnection *requestConnection;
	
	
	CGFloat radius;
}
@property (nonatomic) CGFloat radius;


-(void) commInit;


- (UIImage *)reflectedImageRepresentationWithHeight:(NSUInteger)height;


- (void) setImage:(UIImage *) prmImage;
- (void) getImageFromURL:(NSURL *) prmURL;
//http://img2.douban.com/spic/s2008003.jpg
@end

