//
//  MZShapeView.m
//  DigitalMtLib
//
//  Created by Victor Chen on 7/27/14.
//  Copyright (c) 2014 Mt Zendo Inc. All rights reserved.
//

#import "MZShapeView.h"

@implementation MZShapeView
@synthesize motionManager;
@synthesize strokeColor;
@synthesize type;
@synthesize titleLabel;

- (void)setup{
    [self setBackgroundColor:[UIColor clearColor]];
    self.clipsToBounds = NO;
    self.layer.masksToBounds = NO;
    _drawInnerShadow = NO;
    
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    //[[UILabel alloc] initWithFrame:CGRectMake(0, (self.frame.size.height/2)-40, self.frame.size.width, 80)];
    lbl.translatesAutoresizingMaskIntoConstraints = NO;
    lbl.text = @"Text";
    lbl.backgroundColor = [UIColor clearColor];
    lbl.textColor = [UIColor whiteColor];
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.numberOfLines = 3;
    [self addSubview:lbl];
    self.titleLabel = lbl;
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:lbl
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:1
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:lbl
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:1
                                                      constant:0]];
    
    // Center horizontally
    [self addConstraint:[NSLayoutConstraint constraintWithItem:lbl
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0
                                                      constant:0.0]];
    
    // Center vertically
    [self addConstraint:[NSLayoutConstraint constraintWithItem:lbl
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1.0
                                                      constant:0.0]];
    
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(onTapGesture:)];
    [self addGestureRecognizer:tapRecognizer];
}

-(void)dealloc{
    [self.motionManager stopDeviceMotionUpdates];
    
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self setup];
    }
    
    return self;

}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        [self setup];

    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();

    if (_drawInnerShadow) {
        [[UIColor clearColor] setFill];
        UIColor * shadowColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f];
        CGContextSetShadowWithColor(context, CGSizeMake(0.0f, 1.0f), 4.0f, [shadowColor CGColor]);
    }
    
    int margin = 8;
    
    
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat alpha;
    
    [self.strokeColor getRed:&red green:&green blue:&blue alpha:&alpha];
    CGContextSetRGBStrokeColor(context, red, green, blue, alpha);
    [self.fillColor getRed:&red green:&green blue:&blue alpha:&alpha];
	CGContextSetRGBFillColor(context, red, green, blue, alpha);
    
    
	CGContextSetLineWidth(context, self.strokeWidth);
    
    CGPoint center = CGPointMake(self.frame.size.width/2.0f, self.frame.size.height/2.0f);
    
    switch (self.type) {
        case OutlineTypeHexagon:
        {
            int radius = (self.bounds.size.width/2)-margin;
            
            CGFloat x = center.x;
            CGFloat y = center.y;
            CGContextMoveToPoint(context, x+8, y+radius-5);
            
            CGFloat x1 = x + radius * sinf(2 * 2.0 * M_PI / 12.0);
            CGFloat y1 = y + radius * cosf(2 * 2.0 * M_PI / 12.0);
            CGFloat x2 = x + radius * sinf(3 * 2.0 * M_PI / 12.0);
            CGFloat y2 = y + radius * cosf(3 * 2.0 * M_PI / 12.0);
            CGContextAddArcToPoint(context, x1, y1, x2, y2, self.cornerRadius);
            
            CGFloat x3 = x + radius * sinf(4 * 2.0 * M_PI / 12.0);
            CGFloat y3 = y + radius * cosf(4 * 2.0 * M_PI / 12.0);
            CGFloat x4 = x + radius * sinf(5 * 2.0 * M_PI / 12.0);
            CGFloat y4 = y + radius * cosf(5 * 2.0 * M_PI / 12.0);
            CGContextAddArcToPoint(context, x3, y3, x4, y4, self.cornerRadius);
            
            CGFloat x5 = x + radius * sinf(6 * 2.0 * M_PI / 12.0);
            CGFloat y5 = y + radius * cosf(6 * 2.0 * M_PI / 12.0);
            CGFloat x6 = x + radius * sinf(7 * 2.0 * M_PI / 12.0);
            CGFloat y6 = y + radius * cosf(7 * 2.0 * M_PI / 12.0);
            CGContextAddArcToPoint(context, x5, y5, x6, y6, self.cornerRadius);
            
            CGFloat x7 = x + radius * sinf(8 * 2.0 * M_PI / 12.0);
            CGFloat y7 = y + radius * cosf(8 * 2.0 * M_PI / 12.0);
            CGFloat x8 = x + radius * sinf(9 * 2.0 * M_PI / 12.0);
            CGFloat y8 = y + radius * cosf(9 * 2.0 * M_PI / 12.0);
            CGContextAddArcToPoint(context, x7, y7, x8, y8, self.cornerRadius);
            
            CGFloat x9 = x + radius * sinf(10 * 2.0 * M_PI / 12.0);
            CGFloat y9 = y + radius * cosf(10 * 2.0 * M_PI / 12.0);
            CGFloat x10 = x + radius * sinf(11 * 2.0 * M_PI / 12.0);
            CGFloat y10 = y + radius * cosf(11 * 2.0 * M_PI / 12.0);
            CGContextAddArcToPoint(context, x9, y9, x10, y10, self.cornerRadius);
            
            CGFloat x11 = x + radius * sinf(12 * 2.0 * M_PI / 12.0);
            CGFloat y11 = y + radius * cosf(12 * 2.0 * M_PI / 12.0);
            CGContextAddArcToPoint(context, x11, y11, x1, y1, self.cornerRadius);
            
            CGContextClosePath(context);
            CGContextDrawPath(context, kCGPathFillStroke);
        }
            break;
        case OutlineTypeOval:
        {
            UIBezierPath *circle = [UIBezierPath bezierPathWithArcCenter:center
                                                                   radius:((self.frame.size.width/2.0f) - margin)
                                                               startAngle:0.0f
                                                                 endAngle:2*M_PI
                                                                clockwise:YES];
            [self.strokeColor setStroke];
            circle.lineWidth = self.strokeWidth;
            [circle fill];
            [circle stroke];
        }
            break;
        case OutlineTypeRectangle:
        {
            CGFloat minx = CGRectGetMinX(self.bounds)+margin, midx = CGRectGetMidX(self.bounds), maxx = CGRectGetMaxX(self.bounds)-margin;
            CGFloat miny = CGRectGetMinY(self.bounds)+margin, midy = CGRectGetMidY(self.bounds), maxy = CGRectGetMaxY(self.bounds)-margin;
       
            //from apple sample code, QuartzDemo
            // Next, we will go around the rectangle in the order given by the figure below.
            //       minx    midx    maxx
            // miny    2       3       4
            // midy   1 9              5
            // maxy    8       7       6
            // Which gives us a coincident start and end point, which is incidental to this technique, but still doesn't
            // form a closed path, so we still need to close the path to connect the ends correctly.
            // Thus we start by moving to point 1, then adding arcs through each pair of points that follows.
            // You could use a similar tecgnique to create any shape with rounded corners.
            
            // Start at 1
            CGContextMoveToPoint(context, minx, midy);
            // Add an arc through 2 to 3
            CGContextAddArcToPoint(context, minx, miny, midx, miny, self.cornerRadius);
            // Add an arc through 4 to 5
            CGContextAddArcToPoint(context, maxx, miny, maxx, midy, self.cornerRadius);
            // Add an arc through 6 to 7
            CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, self.cornerRadius);
            // Add an arc through 8 to 9
            CGContextAddArcToPoint(context, minx, maxy, minx, midy, self.cornerRadius);
            CGContextClosePath(context);
            CGContextDrawPath(context, kCGPathFillStroke);
        }
            break;
        case OutlineTypeStar:
        {
            float outertadius = (float)(self.frame.size.width/2)-10;
            [self drawStarInContext:context
                 withNumberOfPoints:5
                             center:CGPointMake((float)self.frame.size.width/2, (float)self.frame.size.height/2)
                        innerRadius:(float)(0.6f)*outertadius
                        outerRadius:outertadius
                          fillColor:[UIColor colorWithRed:(float)74/255 green:(float)81/255 blue:(float)109/255 alpha:1.0f]
                        strokeColor:[UIColor redColor]
                        strokeWidth:10];
            // And close the subpath.
            CGContextClosePath(context);
            CGContextDrawPath(context, kCGPathFillStroke);
        }
        default:
            break;
    }
    
    

}


- (void)drawStarInContext:(CGContextRef)context withNumberOfPoints:(NSInteger)points center:(CGPoint)center innerRadius:(CGFloat)innerRadius outerRadius:(CGFloat)outerRadius fillColor:(UIColor *)fill strokeColor:(UIColor *)stroke strokeWidth:(CGFloat)strokeWidth {
    CGFloat arcPerPoint = 2.0f * M_PI / points;
    CGFloat theta = M_PI / 2.0f;
    
    // Move to starting point (tip at 90 degrees on outside of star)
    CGPoint pt = CGPointMake(center.x - (outerRadius * cosf(theta)), center.y - (outerRadius * sinf(theta)));
    CGContextMoveToPoint(context, pt.x, pt.y);
    
    for (int i = 0; i < points; i = i + 1) {
        // Calculate next inner point (moving clockwise), accounting for crossing of 0 degrees
        theta = theta - (arcPerPoint / 2.0f);
        if (theta < 0.0f) {
            theta = theta + (2 * M_PI);
        }
        pt = CGPointMake(center.x - (innerRadius * cosf(theta)), center.y - (innerRadius * sinf(theta)));
        CGContextAddLineToPoint(context, pt.x, pt.y);
        
        // Calculate next outer point (moving clockwise), accounting for crossing of 0 degrees
        theta = theta - (arcPerPoint / 2.0f);
        if (theta < 0.0f) {
            theta = theta + (2 * M_PI);
        }
        pt = CGPointMake(center.x - (outerRadius * cosf(theta)), center.y - (outerRadius * sinf(theta)));
        CGContextAddLineToPoint(context, pt.x, pt.y);
    }
}

#pragma mark - Gesture Methods
-(void)onTapGesture:(UITapGestureRecognizer *)recognizer{
    _drawInnerShadow = !_drawInnerShadow;
    [self setNeedsDisplay];
}


#pragma mark - Public Methods
-(void)motionManagerUpdate:(BOOL)prmEnable{
    if (prmEnable) {
        CMMotionManager *mm = [[CMMotionManager alloc] init];
        self.motionManager = mm;
        self.motionManager.deviceMotionUpdateInterval = 1.0 / 60.0;
        if (self.motionManager.deviceMotionAvailable) {
            _startListening = NO;
            [self.motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue currentQueue]
                                                    withHandler: ^(CMDeviceMotion *motion, NSError *error){
                                                        dispatch_async(dispatch_get_main_queue(), ^{
                                                            CMAttitude *attitude = motion.attitude;
                                                            CGAffineTransform transform = CGAffineTransformRotate(CGAffineTransformIdentity, attitude.yaw);
//                                                            NSLog(@"yaw=%f, pitch=%f, roll=%f", attitude.yaw, attitude.pitch, radiansToDegrees(attitude.roll));
                                                            self.titleLabel.transform = transform;
                                                        });
                                                        _startListening = YES;
                                                    }];
            
        }

    }
    else{//disable
        [self.motionManager stopDeviceMotionUpdates];
        self.motionManager = nil;
    }
    
}

@end




