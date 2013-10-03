//
//  CoverView.m
//  
//
//  Created by chenyue on 10-4-1.
//  Copyright Digital Mt. Inc. 2010. All rights reserved.
//

#import "DMTCoverImageView.h"






#pragma mark -
#pragma mark UIImage extend methods
@implementation UIImage (ReflecttionImage)



- (UIImage *)addImageReflection:(CGFloat)prmReflectionFraction {
	int reflectionHeight = self.size.height * prmReflectionFraction;
	
    // create a 2 bit CGImage containing a gradient that will be used for masking the 
    // main view content to create the 'fade' of the reflection.  The CGImageCreateWithMask
    // function will stretch the bitmap image as required, so we can create a 1 pixel wide gradient
	CGImageRef gradientMaskImage = NULL;
	
    // gradient is always black-white and the mask must be in the gray colorspace
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    
    // create the bitmap context
    CGContextRef gradientBitmapContext = CGBitmapContextCreate(nil, 1, reflectionHeight,
                                                               8, 0, colorSpace, kCGImageAlphaNone);
    
    // define the start and end grayscale values (with the alpha, even though
    // our bitmap context doesn't support alpha the gradient requires it)
    CGFloat colors[] = {0.0, 1.0, 1.0, 1.0};
    
    // create the CGGradient and then release the gray color space
    CGGradientRef grayScaleGradient = CGGradientCreateWithColorComponents(colorSpace, colors, NULL, 2);
    CGColorSpaceRelease(colorSpace);
    
    // create the start and end points for the gradient vector (straight down)
    CGPoint gradientStartPoint = CGPointMake(0, reflectionHeight);
    CGPoint gradientEndPoint = CGPointZero;
    
    // draw the gradient into the gray bitmap context
    CGContextDrawLinearGradient(gradientBitmapContext, grayScaleGradient, gradientStartPoint,
                                gradientEndPoint, kCGGradientDrawsAfterEndLocation);
	CGGradientRelease(grayScaleGradient);
	
	// add a black fill with 50% opacity
	CGContextSetGrayFillColor(gradientBitmapContext, 0.0, 0.5);
	CGContextFillRect(gradientBitmapContext, CGRectMake(0, 0, 1, reflectionHeight));
    
    // convert the context into a CGImageRef and release the context
    gradientMaskImage = CGBitmapContextCreateImage(gradientBitmapContext);
    CGContextRelease(gradientBitmapContext);
	
    // create an image by masking the bitmap of the mainView content with the gradient view
    // then release the  pre-masked content bitmap and the gradient bitmap
    CGImageRef reflectionImage = CGImageCreateWithMask(self.CGImage, gradientMaskImage);
    CGImageRelease(gradientMaskImage);
	
	CGSize size = CGSizeMake(self.size.width, self.size.height + reflectionHeight);
	
	UIGraphicsBeginImageContext(size);
	
	[self drawAtPoint:CGPointZero];
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextDrawImage(context, CGRectMake(0, self.size.height, self.size.width, reflectionHeight), reflectionImage);
	
	UIImage* result = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
    CGImageRelease(reflectionImage);
	
	return result;
}
@end







@implementation DMTCoverImageView

@synthesize radius;
- (UIImage*)scaleToSize:(UIImage*)prmImage newSize:(CGSize)prmNewSize {
	UIGraphicsBeginImageContext(prmNewSize);
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextTranslateCTM(context, 0.0, prmNewSize.height);
	CGContextScaleCTM(context, 1.0, -1.0);
	
	CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, prmNewSize.width, prmNewSize.height), prmImage.CGImage);
	
	UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
	
	UIGraphicsEndImageContext();
	
	return scaledImage;
}

-(void) commInit
{
	self.radius = 5.0;
	coverImage = nil;
	LoadImageIndicator = nil;
}
//init from NIB
-(id) initWithCoder:(NSCoder *)aDecoder
{
	if (self = [super initWithCoder:aDecoder]) {
		self = [self initWithFrame:self.frame];
	}
	return self;
}


- (id)initWithFrame:(CGRect)frame {
	
    if ((self = [super initWithFrame:frame])) {
		
        // Initialization code
		[self commInit];
		self.backgroundColor=[UIColor clearColor];
		coverImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
		//coverImage.contentMode = UIViewContentModeCenter;
		coverImage.contentMode = UIViewContentModeScaleAspectFit;
		[self addSubview:coverImage];
		
		UIImage *bgImage = [UIImage imageNamed:@"default_cover.png"];

		[self setImage:bgImage];
	
		LoadImageIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
		LoadImageIndicator.frame = CGRectMake((frame.size.width)/2-(LoadImageIndicator.frame.size.width/2), 
											  50, 
											  LoadImageIndicator.frame.size.width, 
											  LoadImageIndicator.frame.size.height);
		[self addSubview:LoadImageIndicator];
		[LoadImageIndicator startAnimating];
		
    }
    return self;
}

  

- (void)dealloc {
    [super dealloc];
	
	if(coverImage != nil)
	{
		[coverImage release];
		coverImage = nil;
	}
	
	if (LoadImageIndicator != nil) {
		[LoadImageIndicator release];
		LoadImageIndicator = nil;
	}
}


#pragma mark -
#pragma mark -
-(void) getImage:(NSURL *)prmURL
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	//NSLog(@"getImageFromURL %@", [prmURL description]);
	NSHTTPURLResponse *response = NULL;
	NSError *error = NULL;
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:prmURL cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10];
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
	UIImage *img = [[UIImage alloc] initWithData:data];
	
	[self setImage:img];
	[img release];
	[pool release];
	[NSThread exit];
	return;
	

}
- (void) getImageFromURL:(NSURL *) prmURL
{//[NSURL URLWithString:prmURL]
	
	[NSThread detachNewThreadSelector:@selector(getImage:) toTarget:self withObject:prmURL];
		
	
	/*
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL:prmURL
												  cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData 
											  timeoutInterval:20];//second
	
	
	
	requestConnection = [[NSURLConnection connectionWithRequest:request delegate:self] retain];
	
	if (requestConnection) {
		// Create the NSMutableData that will hold
		// the received data
		// receivedData is declared as a method instance elsewhere
		[requestConnection start];
		receivedData = [[NSMutableData data] retain];
		
	} else 
	{
		// inform the user that the download could not be made
		NSLog(@"connection object is null!!!");
	}
	[request release];
	*/
}

- (void) setImage:(UIImage *) prmImage
{
	
	[LoadImageIndicator stopAnimating];
	
	CGFloat width = prmImage.size.width;   
	CGFloat height = prmImage.size.height;
	UIGraphicsBeginImageContext(prmImage.size);
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextSetShadowWithColor(context, CGSizeMake(2, 2), 2, [[UIColor blackColor] CGColor]);
	
	
	CGContextTranslateCTM(context, 0.0, height);
	CGContextScaleCTM(context, 1.0, -1.0);
	
	CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0);
	CGContextSaveGState(context);

	CGRect rrect = CGRectMake(0, 0, width, height);
	//CGFloat radius = 5.0;
	CGFloat minx = CGRectGetMinX(rrect), midx = CGRectGetMidX(rrect), maxx = CGRectGetMaxX(rrect);
	CGFloat miny = CGRectGetMinY(rrect), midy = CGRectGetMidY(rrect), maxy = CGRectGetMaxY(rrect);
	
	CGMutablePathRef path = CGPathCreateMutable();
	CGPathMoveToPoint(path, NULL, minx, midy);
	
	CGPathAddArcToPoint(path, NULL,  minx, miny, midx, miny, radius);
	CGPathAddArcToPoint(path, NULL, maxx, miny, maxx, midy, radius);
	CGPathAddArcToPoint(path, NULL,  maxx, maxy, midx, maxy, radius);
	CGPathAddArcToPoint(path, NULL, minx, maxy, minx, midy, radius);
	CGContextAddPath(context, path);
	
	CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
	CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
	CGPathRelease(path);
	
	
	CGContextSaveGState(context);
	

	// Clip to the current path using the non-zero winding number rule.
	CGContextClip(context);

	CGContextDrawImage(context, CGRectMake(0, 0, width, height), [prmImage CGImage]);

	
	CGContextRestoreGState(context);	
	UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();

	
	UIImage *imageWithReflection = [resultingImage addImageReflection:reflectionFraction];
	
	coverImage.image = imageWithReflection;
}

#pragma mark -
#pragma mark Reflection methods
CGImageRef AEViewCreateGradientImage (int pixelsWide, int pixelsHigh)
{
	CGImageRef theCGImage = NULL;
    CGContextRef gradientBitmapContext = NULL;
    CGColorSpaceRef colorSpace;
	CGGradientRef grayScaleGradient;
	CGPoint gradientStartPoint, gradientEndPoint;
	
	// Our gradient is always black-white and the mask
	// must be in the gray colorspace
    colorSpace = CGColorSpaceCreateDeviceGray();
	
	// create the bitmap context
    gradientBitmapContext = CGBitmapContextCreate (NULL, pixelsWide, pixelsHigh,
												   8, 0, colorSpace, kCGImageAlphaNone);
	
	if (gradientBitmapContext != NULL) {
		// define the start and end grayscale values (with the alpha, even though
		// our bitmap context doesn't support alpha the gradient requires it)
		CGFloat colors[] = {0.0, 1.0,1.0, 1.0,};
		
		// create the CGGradient and then release the gray color space
		grayScaleGradient = CGGradientCreateWithColorComponents(colorSpace, colors, NULL, 2);
		
		// create the start and end points for the gradient vector (straight down)
		gradientStartPoint = CGPointZero;
		gradientEndPoint = CGPointMake(0,pixelsHigh);
		
		// draw the gradient into the gray bitmap context
		CGContextDrawLinearGradient (gradientBitmapContext, grayScaleGradient, gradientStartPoint, gradientEndPoint, kCGGradientDrawsAfterEndLocation);
		
		// clean up the gradient
		CGGradientRelease(grayScaleGradient);
		
		// convert the context into a CGImageRef and release the
		// context
		theCGImage=CGBitmapContextCreateImage(gradientBitmapContext);
		CGContextRelease(gradientBitmapContext);
		
	}
	
	// clean up the colorspace
	CGColorSpaceRelease(colorSpace);
	
	// return the imageref containing the gradient
    return theCGImage;
}




- (UIImage *)reflectedImageRepresentationWithHeight:(NSUInteger)height
{
	CGContextRef mainViewContentContext;
    CGColorSpaceRef colorSpace;
	
    colorSpace = CGColorSpaceCreateDeviceRGB();
	
	// create a bitmap graphics context the size of the image
    mainViewContentContext = CGBitmapContextCreate (NULL, self.bounds.size.width,height, 8,0, colorSpace, kCGImageAlphaPremultipliedLast);
	
	// free the rgb colorspace
    CGColorSpaceRelease(colorSpace);	
	
	if (mainViewContentContext==NULL)
		return NULL;
	
	// offset the context. This is necessary because, by default, the  layer created by a view for
	// caching its content is flipped. But when you actually access the layer content and have
	// it rendered it is inverted. Since we're only creating a context the size of our 
	// reflection view (a fraction of the size of the main view) we have to translate the context the
	// delta in size, render it, and then translate back (we could have saved/restored the graphics 
	// state
	
	CGFloat translateVertical=self.bounds.size.height-height;
	CGContextTranslateCTM(mainViewContentContext,0,-translateVertical);
	
	// render the layer into the bitmap context
	[self.layer renderInContext:mainViewContentContext];
	
	// translate the context back
	CGContextTranslateCTM(mainViewContentContext,0,translateVertical);
	
	// Create CGImageRef of the main view bitmap content, and then
	// release that bitmap context
	CGImageRef mainViewContentBitmapContext=CGBitmapContextCreateImage(mainViewContentContext);
	CGContextRelease(mainViewContentContext);
	
	// create a 2 bit CGImage containing a gradient that will be used for masking the 
	// main view content to create the 'fade' of the reflection.  The CGImageCreateWithMask
	// function will stretch the bitmap image as required, so we can create a 1 pixel wide
	// gradient
	CGImageRef gradientMaskImage=AEViewCreateGradientImage(1,height);
	
	// Create an image by masking the bitmap of the mainView content with the gradient view
	// then release the  pre-masked content bitmap and the gradient bitmap
	CGImageRef reflectionImage=CGImageCreateWithMask(mainViewContentBitmapContext,gradientMaskImage);
	CGImageRelease(mainViewContentBitmapContext);
	CGImageRelease(gradientMaskImage);
	
	// convert the finished reflection image to a UIImage 
	UIImage *theImage=[UIImage imageWithCGImage:reflectionImage];
	
	// image is retained by the property setting above, so we can 
	// release the original
	CGImageRelease(reflectionImage);
	
	// return the image
	return theImage;
}
#pragma mark -
#pragma mark NSURLConnection delegate methods
- (void)connection:(NSURLConnection *)theConnection didReceiveResponse:(NSURLResponse *)response
{
	NSLog(@"didReceiveResponse");
	
	// this method is called when the server has determined that it
    // has enough information to create the NSURLResponse
	
    // it can be called multiple times, for example in the case of a
    // redirect, so each time we reset the data.
    // receivedData is declared as a method instance elsewhere
	//NSLog(@"didReceiveResponse");
	
	//receivedData
	
	[receivedData setLength:0];
	

   	
	
}

- (void)connection:(NSURLConnection *)theConnection didReceiveData:(NSData *)data
{
	//NSLog(@"didReceiveData");
	// append the new data to the receivedData
    // receivedData is declared as a method instance elsewhere
	
    [receivedData appendData:data];
	
	
	
}

- (void)connection:(NSURLConnection *)theConnection didFailWithError:(NSError *)error
{
	NSLog(@"CoverVIew didFailWithError %@", [error description]);
	
}

- (void)connectionDidFinishLoading:(NSURLConnection *)theConnection
{
	NSLog(@"CoverVIew connectionDidFinishLoading");
	UIImage *img = [[UIImage alloc] initWithData:receivedData];
	
	[self setImage:img];
	
	[img release];
	[receivedData release];
	
}

@end





