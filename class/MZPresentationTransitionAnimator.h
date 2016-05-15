//
//  MZPresentationTransitionAnimator.h
//  TransitionDemo
//
//  Created by Victor Chen on 5/13/16.
//  Copyright © 2016 Mt Zendo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MZPresentationTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning> {
    
    
    
    
}
@property CGFloat duration;



@property (weak, nonatomic) UIView *animatedView;
@property (nonatomic) CGRect startFrame;
@property (nonatomic) UIColor *startBackgroundColor;

@property (getter=isReverse) BOOL reverse;

- (instancetype)initWithAnimatedView:(UIView *)animatedView;


@end
