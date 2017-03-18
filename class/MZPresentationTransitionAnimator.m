//
//  MZPresentationTransitionAnimator.m
//  TransitionDemo
//
//  Created by Victor Chen on 5/13/16.
//  Copyright © 2016 Mt Zendo. All rights reserved.
//

#import "MZPresentationTransitionAnimator.h"

@implementation MZPresentationTransitionAnimator

static CGFloat const kDefaultPresentationAnimationDuration = 0.7f;

- (instancetype)initWithAnimatedView:(UIView *)animatedView
{
    self = [super init];
    if(!self){
        return nil;
    }
    
    NSAssert(animatedView != nil, @"animatedView cannot be nil");
    _animatedView = animatedView;
    
    return self;
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.duration = kDefaultPresentationAnimationDuration;
    }
    
    return self;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
//    if(_animatedView){
//        self.startFrame = _animatedView.frame;
//        self.startBackgroundColor = _animatedView.backgroundColor;
//    }
    
    self.startFrame = _animatedView.frame;
    NSLog(@"frame = %@", NSStringFromCGRect(_animatedView.frame));
    
//    self.startBackgroundColor = [UIColor darkGrayColor];
    //_animatedView.backgroundColor;

    
    UIView *animatedViewForTransition;
    
    {
        animatedViewForTransition = [[UIView alloc] initWithFrame:self.startFrame];
        [transitionContext.containerView addSubview:animatedViewForTransition];
        
        animatedViewForTransition.clipsToBounds = YES;
//        animatedViewForTransition.layer.cornerRadius = CGRectGetHeight(animatedViewForTransition.frame) / 2.;
        animatedViewForTransition.backgroundColor = self.startBackgroundColor;
    }
    
    CGAffineTransform finalTransform;
    {
        CGFloat size = MAX(CGRectGetHeight(transitionContext.containerView.frame), CGRectGetWidth(transitionContext.containerView.frame)) * 1.2;
        CGFloat scaleFactor = size / CGRectGetWidth(animatedViewForTransition.frame);
        finalTransform = CGAffineTransformMakeScale(scaleFactor, scaleFactor);
    }
    
    UIViewController *presentedController;
    
    presentedController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    presentedController.view.frame = transitionContext.containerView.bounds;
    presentedController.view.layer.opacity = 0;
    [transitionContext.containerView addSubview:presentedController.view];
    
    
    [UIView transitionWithView:animatedViewForTransition
                      duration:[self transitionDuration:transitionContext] * .7
                       options:0
                    animations:^{
                        animatedViewForTransition.transform = finalTransform;
                        animatedViewForTransition.center = transitionContext.containerView.center;
                        animatedViewForTransition.backgroundColor = presentedController.view.backgroundColor;
                    } completion:nil];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] * .42
                          delay:[self transitionDuration:transitionContext] * .58
                        options:0
                     animations:^{
                         presentedController.view.layer.opacity = 1;
                     } completion:^(BOOL finished) {
                         [animatedViewForTransition removeFromSuperview];
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                     }];
    
    
    
    
    
    
    
//    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    
//    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
//    [[transitionContext containerView] addSubview:toViewController.view];
//    toViewController.view.layer.opacity = 0.0f;
//    
//    [UIView animateWithDuration:[self transitionDuration:transitionContext]
//                     animations:^{
//                         //                             toViewController.view.layer.transform = CATransform3DIdentity;
//                         toViewController.view.layer.opacity = 1.0f;
//                     }
//                     completion:^(BOOL finished) {
//                         [transitionContext completeTransition:YES];
//                     }];
//    [transitionContext completeTransition:YES];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0f;
}

@end
