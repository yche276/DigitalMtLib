//
//  MZDateTimeCollectionViewCell.m
//  DateSelector
//
//  Created by Chen Yue on 8/02/16.
//  Copyright © 2016 Chen Yue. All rights reserved.
//

#import "MZDateTimeCollectionViewCell.h"
#define kBarHeight          15
#define RAND_FROM_TO(min, max) (min + arc4random_uniform(max - min + 1))

@implementation MZDateTimeCollectionViewCell

-(void)setup{
    self.titleLabel.text = @"Title";
    self.titleLabel.textColor = [UIColor whiteColor];
    
    self.lineColor = [UIColor whiteColor];
    self.lineWidth = 3;
    
//    float r = RAND_FROM_TO(0,255);
//    float g = RAND_FROM_TO(0,255);
//    float b = RAND_FROM_TO(0,255);
//    self.backgroundColor = [UIColor colorWithRed:(float)r/255 green:(float)g/255 blue:(float)b/255 alpha:1.0f];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationChanged:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
}


- (void)awakeFromNib {
    // Initialization code
    [self setup];
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        NSArray *arrayOfViews = arrayOfViews = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([MZDateTimeCollectionViewCell class])
                                                                             owner:self
                                                                           options:nil];
        if ([arrayOfViews count] < 1) {
            return nil;
        }
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        self = [arrayOfViews objectAtIndex:0];
        
        [self setup];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, self.lineColor.CGColor);
    
//    CGContextSetLineJoin(context, kCGLineJoinRound);
//    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, self.lineWidth);
    
    float barX = (float)rect.size.width/2;
    CGContextMoveToPoint(context, barX, rect.size.height);
    CGContextAddLineToPoint(context, barX, rect.size.height-kBarHeight);
    
    
    CGContextStrokePath(context);
    
}

#pragma mark - Notificaion
- (void)orientationChanged:(NSNotification *)notification{
    [self setNeedsDisplay];
    [self setNeedsLayout];
}
@end
