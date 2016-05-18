//
//  MZDateTimeCollectionView.m
//  DateSelector
//
//  Created by Chen Yue on 8/02/16.
//  Copyright © 2016 Chen Yue. All rights reserved.
//

#import "MZDateTimeCollectionView.h"

@implementation MZDateTimeCollectionView

-(void)setup{
    
    self.baseLineColor = [UIColor whiteColor];
    self.baseLineineWidth = 3;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
    v.translatesAutoresizingMaskIntoConstraints = NO;
    self.backgroundView = v;
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.backgroundView
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0f
                                                                     constant:0.0]];
    
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.backgroundView
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self
                                                                    attribute:NSLayoutAttributeWidth
                                                                   multiplier:1.0f
                                                                     constant:0.0]];
    
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.backgroundView
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1.0f
                                                                     constant:0.0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.backgroundView
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1.0f
                                                                     constant:0.0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.backgroundView
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1.0f
                                                                     constant:0.0]];

    
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectZero];
    lbl.translatesAutoresizingMaskIntoConstraints = NO; 
    lbl.text = @"Title";
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.textColor = [UIColor whiteColor];
    lbl.backgroundColor = [UIColor clearColor];
    lbl.font = [UIFont systemFontOfSize:40];
    [self.backgroundView addSubview:lbl];
    
    
    
    [self.backgroundView addConstraint:[NSLayoutConstraint constraintWithItem:lbl
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.backgroundView
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:0.5f
                                                      constant:0.0]];
    
    
    [self.backgroundView addConstraint:[NSLayoutConstraint constraintWithItem:lbl
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.backgroundView
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:1.0f
                                                      constant:0.0]];
    
    
    [self.backgroundView addConstraint:[NSLayoutConstraint constraintWithItem:lbl
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.backgroundView
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0f
                                                      constant:10.0]];
    
    [self.backgroundView addConstraint:[NSLayoutConstraint constraintWithItem:lbl
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.backgroundView
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.0f
                                                      constant:0.0]];
    
    [self.backgroundView addConstraint:[NSLayoutConstraint constraintWithItem:lbl
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.backgroundView
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1.0f
                                                      constant:0.0]];

    
    
    
    self.titleLabel = lbl;
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
        
        
        [self setup];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, self.baseLineColor.CGColor);
    
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, self.baseLineineWidth);
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0.0f, rect.size.height);
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
    
    
    CGContextStrokePath(context);
    
}

@end
