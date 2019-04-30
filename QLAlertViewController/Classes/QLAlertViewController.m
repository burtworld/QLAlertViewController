//
//  QLAlertViewController.m
//  SgccMobileOA
//
//  Created by Paramita on 2019/4/28.
//  Copyright © 2019 Paramita. All rights reserved.
//

#import "QLAlertViewController.h"
#import "QLAlertAnimator.h"

@interface QLAlertViewController ()<UIViewControllerTransitioningDelegate>
@property (nonatomic, retain) NSString * _Nullable titleMsg;
@property (nonatomic, retain) NSString * _Nullable contentMsg;
@end

@implementation QLAlertViewController

#pragma mark - Factory
///! Factory
+ (_Nonnull instancetype)alertWithTitle:(NSString *_Nullable)title
                                message:(NSString *_Nullable)message
                                  style:(QLAlertViewStyle)style
{
    
    QLAlertViewController *alertController = [[QLAlertViewController alloc]initWithStyle:style];
    alertController.titleMsg = title;
    alertController.contentMsg = message;
    alertController.style = style;
    if (style == QLAlertViewStyle_ActionSheet) {
        alertController.presentTyle = QLAlertViewPresentStyleSlideUp;
        alertController.dismissStyle = QLAlertViewPresentStyleSlideDown;
    }else{
        alertController.presentTyle = QLAlertViewPresentStyleSystem;
        alertController.dismissStyle = QLAlertViewDismissStyleFadeOut;
    }
    return alertController;
}

///! Factory
+ (_Nonnull instancetype)alertWithTitle:(NSString *_Nullable)title
                                message:(NSString *_Nullable)message
                                  style:(QLAlertViewStyle)style
                                present:(QLAlertViewAnimatorStyle)presentStyle
                                dismiss:(QLAlertViewAnimatorStyle)dismisStyle
{
    
    QLAlertViewController *alertController = [[QLAlertViewController alloc]initWithStyle:style];
    alertController.titleMsg = title;
    alertController.contentMsg = message;
    alertController.style = style;
    alertController.presentTyle = presentStyle;
    alertController.dismissStyle = dismisStyle;
    return alertController;
}

- (instancetype)initWithStyle:(QLAlertViewStyle)style {
    self = [super init];
    if (self) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.padding = QLAlertView_Padding;
        self.view.backgroundColor = [UIColor clearColor];
        self.style = style;
        self.bgView = [UIView new];
        _bgView.translatesAutoresizingMaskIntoConstraints = NO;
        _bgView.backgroundColor = [UIColor blackColor];
        _bgView.alpha = QLAlertView_backgroundAlpha;
        [self.view addSubview:self.bgView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(close)];
        [self.bgView addGestureRecognizer:tap];
        
        self.alertView = [[QLAlertView alloc] initWithTitle:self.titleMsg message:self.contentMsg];
        self.alertView.translatesAutoresizingMaskIntoConstraints = NO;
        self.alertView.style = self.style;
        self.alertView.actionHeight = 50.0f;
        [self.view addSubview:self.alertView];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillLayoutSubviews {
    
    // 设置灰色半透明背景的约束
    [NSLayoutConstraint constraintWithItem:_bgView
                                 attribute:NSLayoutAttributeLeft
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeLeft
                                multiplier:1.0
                                  constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:_bgView
                                 attribute:NSLayoutAttributeRight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeRight
                                multiplier:1.0
                                  constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:_bgView
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:_bgView
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:0.0].active = YES;
    
    if (self.style == QLAlertViewStyle_ActionSheet) {
        [NSLayoutConstraint constraintWithItem:_alertView
                                     attribute:NSLayoutAttributeLeft
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeLeft
                                    multiplier:1.0
                                      constant:0.0].active = YES;
        [NSLayoutConstraint constraintWithItem:_alertView
                                     attribute:NSLayoutAttributeRight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeRight
                                    multiplier:1.0
                                      constant:0.0].active = YES;
        [NSLayoutConstraint constraintWithItem:_alertView
                                     attribute:NSLayoutAttributeBottom
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeBottom
                                    multiplier:1.0
                                      constant:0.0].active = YES;
    }else if (self.style == QLAlertViewStyle_Alert) {
        // 设置 alertView 在屏幕中心
        [NSLayoutConstraint constraintWithItem:_alertView
                                     attribute:NSLayoutAttributeCenterX
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeCenterX
                                    multiplier:1.0
                                      constant:0.0].active = YES;
        [NSLayoutConstraint constraintWithItem:_alertView
                                     attribute:NSLayoutAttributeCenterY
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeCenterY
                                    multiplier:1.0
                                      constant:0.0].active = YES;
        [NSLayoutConstraint constraintWithItem:_alertView
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeWidth
                                    multiplier:2.0/3
                                      constant:0.0].active = YES;
        
    }
    
    [super viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.alertViewHeight = self.alertView.frame.size.height;
}

- (void)close {
    [self dismissViewControllerAnimated:YES completion:NULL];
}


/** 添加 action */
- (void)addAction:(QLAlertAction * _Nonnull)action {
    [self.alertView addAction:action];
}

/** 直接添加一个数组的 action */
- (void)addActions:(NSArray<QLAlertAction *> * _Nonnull)actions {
    for (QLAlertAction *action in actions) {
        [self.alertView addAction:action];
    }
}


#pragma mark - setter
- (void)setPadding:(CGFloat)padding {
    _padding = padding;
}

/** 设置 alertView 的圆角半径 */
- (void)setAlertViewCornerRadius:(CGFloat)cornerRadius {
    _alertView.layer.cornerRadius = cornerRadius;
}

- (void)setStyle:(QLAlertViewStyle)style {
    _style = style;

}

- (void)setTitleMsg:(NSString *)titleMsg {
    _titleMsg = titleMsg;
    if (self.alertView) {
        self.alertView.titleLabel.text = titleMsg;
    }
}

- (void)setContentMsg:(NSString *)contentMsg {
    _contentMsg = contentMsg;
    if (self.contentMsg) {
        self.alertView.msgLabel.text = contentMsg;
    }
}

#pragma mark - getter

#pragma mark - UIViewControllerTransitioningDelegate

/** 返回Present动画 */
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    QLAlertAnimator *animator = [QLAlertAnimator new];
    if (self.style == QLAlertViewStyle_Alert) {
        animator.style = QLAlertViewPresentStyleSystem;
    }else{
        animator.style = QLAlertViewPresentStyleSlideUp;
    }
    
    return animator;
}

/** 返回Dismiss动画 */
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    QLAlertAnimator *animator = [QLAlertAnimator new];
    animator.style = QLAlertViewDismissStyleSlideDown;
    if (self.style == QLAlertViewStyle_Alert) {
        animator.style = QLAlertViewDismissStyleFadeOut;
    }else{
        animator.style = QLAlertViewDismissStyleSlideDown;
    }
    return animator;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
