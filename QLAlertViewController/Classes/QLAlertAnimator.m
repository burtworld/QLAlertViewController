//
//  QLAlertAnimator.m
//  QLDemoProject
//
//  Created by Paramita on 2019/4/28.
//  Copyright © 2019 paramita. All rights reserved.
//

#import "QLAlertAnimator.h"
#import "QLAlertViewController.h"

@implementation QLAlertAnimator

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.3f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    [self animateWithStyle:self.style context:transitionContext];
}

- (void)animateWithStyle:(QLAlertViewAnimatorStyle)style context:(id<UIViewControllerContextTransitioning>)transitionContext {
    switch (self.style) {
        case QLAlertViewPresentStyleSlideUp:
            [self slideUpAnimationWithContext:transitionContext];
            break;
        case QLAlertViewDismissStyleSlideDown:
            [self slideDownAnimationWithContext:transitionContext];
            break;
        case QLAlertViewPresentStyleSystem:
            [self systemAnimationWithContext:transitionContext];
            break;
        case QLAlertViewDismissStyleFadeOut:
            [self fadeOutAnimationWithContext:transitionContext];
            break;
        
        default:
            break;
    }
}

- (void)slideUpAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    QLAlertViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.bgView.alpha = 0;
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    toVC.alertView.frame = CGRectMake(0, toVC.view.frame.size.height, toVC.view.frame.size.width, toVC.alertViewHeight);
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration animations:^{
        toVC.bgView.alpha = QLAlertView_backgroundAlpha;
        toVC.alertView.frame = CGRectMake(0, 0, toVC.view.frame.size.width, toVC.alertViewHeight);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (void)slideDownAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    QLAlertViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.bgView.alpha = 0;
                         fromVC.alertView.frame = CGRectMake(0, fromVC.view.frame.size.height, fromVC.view.frame.size.width, fromVC.alertViewHeight);
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}


- (void)systemAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    QLAlertViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.bgView.alpha = 0;
    toVC.alertView.alpha = 0;
    toVC.alertView.transform = CGAffineTransformMakeScale(1.3, 1.3);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         toVC.bgView.alpha = QLAlertView_backgroundAlpha;
                         toVC.alertView.alpha = 1;
                         toVC.alertView.transform = CGAffineTransformIdentity;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)fadeOutAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.view.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}
@end
