//
//  QLAlertView.m
//  QLDemoProject
//
//  Created by Paramita on 2019/4/28.
//  Copyright © 2019 paramita. All rights reserved.
//

#import "QLAlertView.h"

@interface QLAlertView()
@property (weak, nonatomic) UIViewController *controller;

@end

@implementation QLAlertView {
    
    NSMutableArray<QLAlertAction *> *_actionsArray;
    NSMutableArray<UIButton *>*_buttons;
    UIView *_actionsContainerView;
}


- (_Nonnull instancetype)initWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message {
    self = [super init];
    if (!self) { return nil; };
    
    [self commonInit:title msg:message style:0];
    return self;
}

- (_Nonnull instancetype)initWithTitle:(NSString * _Nullable)title
                               message:(NSString * _Nullable)message
                                 style:(QLAlertViewStyle)style {
    self = [super init];
    if (!self) { return nil; };
    
    [self commonInit:title msg:message style:style];
    return self;
}

- (void)commonInit:(NSString *)title msg:(NSString *)message style:(QLAlertViewStyle)style {
    self.clipsToBounds = YES;
    
    self.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
    self.padding = QLAlertView_Padding;
    self.actionHeight = QLAlertView_ActionHeight;
    _actionsArray = [NSMutableArray array];
    _buttons = [NSMutableArray array];
    
    self.style = style;
    
    _titleLabel = [UILabel new];
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _titleLabel.text = title;
    _titleLabel.numberOfLines = 0;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
    [self addSubview:_titleLabel];
    
    _msgLabel = [UILabel new];
    _msgLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _msgLabel.text = message;
    _msgLabel.numberOfLines = 0;
    _msgLabel.textAlignment = NSTextAlignmentCenter;
    _msgLabel.font = [UIFont systemFontOfSize:13.0];
    [self addSubview:_msgLabel];
    
    _actionsContainerView = [UIView new];
    _actionsContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    _actionsContainerView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    [self addSubview:_actionsContainerView];
}

- (void)addAction:(QLAlertAction * _Nonnull)action {
    [_actionsArray addObject:action];
    [self sortActions];
    [self createButtons];
    [self setNeedsUpdateConstraints];
}

- (void)createButtons {
    [_buttons removeAllObjects];
    for (QLAlertAction *action in _actionsArray) {
        UIButton *button = [self buttonWithAction:action];
        [_buttons addObject:button];
    }
}

- (void)updateConstraints {
    [super updateConstraints];
 
    
    [self layoutTitleLabel];
    [self layoutMsgLabel];
    [self layoutActionContainerView];
    
    for (UIView *subV in _actionsContainerView.subviews) {
        [subV removeFromSuperview];
    }
    if (self.style == QLAlertViewStyle_Alert && _buttons.count == 2) {
        [self layoutButtonsHorizontal];
    }else{
        [self layoutButtonsVertical];
    }
    UIView *lastView = _buttons.lastObject;
    /// make the _actionsContainerView bottom align the lastview bottom
    // 设置 alert 底部约束
    [NSLayoutConstraint constraintWithItem:_actionsContainerView
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:lastView
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:0.0].active = YES;
    // 设置 alert 底部约束
    [NSLayoutConstraint constraintWithItem:self
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_actionsContainerView
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:0.0].active = YES;

}

- (void)layoutTitleLabel {
    [NSLayoutConstraint constraintWithItem:_titleLabel
                                 attribute:NSLayoutAttributeLeft
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                 attribute:NSLayoutAttributeLeft
                                multiplier:1
                                  constant:self.padding].active = YES;
    [NSLayoutConstraint constraintWithItem:_titleLabel
                                 attribute:NSLayoutAttributeRight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                 attribute:NSLayoutAttributeRight
                                multiplier:1
                                  constant:-self.padding].active = YES;
    [NSLayoutConstraint constraintWithItem:_titleLabel
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                 attribute:NSLayoutAttributeTop
                                multiplier:1
                                  constant:(_titleLabel.text ? self.padding : 0)].active = YES;
    
}

- (void)layoutMsgLabel {
    [NSLayoutConstraint constraintWithItem:_msgLabel
                                 attribute:NSLayoutAttributeLeft
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                 attribute:NSLayoutAttributeLeft
                                multiplier:1
                                  constant:self.padding].active = YES;
    [NSLayoutConstraint constraintWithItem:_msgLabel
                                 attribute:NSLayoutAttributeRight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                 attribute:NSLayoutAttributeRight
                                multiplier:1
                                  constant:-self.padding].active = YES;
    [NSLayoutConstraint constraintWithItem:_msgLabel
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.titleLabel
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1
                                  constant:(_msgLabel.text ? self.padding : 0)].active = YES;
    
}

- (void)layoutActionContainerView {

    [NSLayoutConstraint constraintWithItem:_actionsContainerView
                                 attribute:NSLayoutAttributeLeft
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                 attribute:NSLayoutAttributeLeft
                                multiplier:1
                                  constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:_actionsContainerView
                                 attribute:NSLayoutAttributeRight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                 attribute:NSLayoutAttributeRight
                                multiplier:1
                                  constant:0].active = YES;
    [NSLayoutConstraint constraintWithItem:_actionsContainerView
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.msgLabel
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1
                                  constant:(self.padding)].active = YES;

    
    
}

/** 两个 button 时的水平布局 */
- (void)layoutButtonsHorizontal {
    
    UIButton *leftButton = _buttons[0];
    UIButton *rightButton = _buttons[1];
    [_actionsContainerView addSubview:leftButton];
    [_actionsContainerView addSubview:rightButton];
    // 左边按钮
    [NSLayoutConstraint constraintWithItem:leftButton
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:self.actionHeight].active = YES;
    [NSLayoutConstraint constraintWithItem:leftButton
                                 attribute:NSLayoutAttributeLeft
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                 attribute:NSLayoutAttributeLeft
                                multiplier:1.0
                                  constant:0.0].active = YES;
    [NSLayoutConstraint constraintWithItem:leftButton
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_actionsContainerView
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:0.5].active = YES;
    
    // 右边按钮
    [NSLayoutConstraint constraintWithItem:rightButton
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:self.actionHeight].active = YES;
    [NSLayoutConstraint constraintWithItem:rightButton
                                 attribute:NSLayoutAttributeRight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                 attribute:NSLayoutAttributeRight
                                multiplier:1.0
                                  constant:0.0].active = YES;
    [NSLayoutConstraint constraintWithItem:rightButton
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_actionsContainerView
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:0.5].active = YES;
    [NSLayoutConstraint constraintWithItem:rightButton
                                 attribute:NSLayoutAttributeLeft
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:leftButton
                                 attribute:NSLayoutAttributeRight
                                multiplier:1.0 constant:0.5].active = YES;
    [NSLayoutConstraint constraintWithItem:rightButton
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:leftButton
                                 attribute:NSLayoutAttributeWidth
                                multiplier:1.0
                                  constant:0.0].active = YES;
    
    
}

/** 垂直布局 */
- (void)layoutButtonsVertical {
    
    // 记录最下面的一个view
    UIView *lastView;
    
    // 遍历在数组中的button，添加到alert上
    for(UIButton *button in _buttons) {
        [_actionsContainerView addSubview:button];
        [NSLayoutConstraint constraintWithItem:button
                                     attribute:NSLayoutAttributeLeft
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:_actionsContainerView
                                     attribute:NSLayoutAttributeLeft
                                    multiplier:1.0
                                      constant:0.0].active = YES;
        [NSLayoutConstraint constraintWithItem:button
                                     attribute:NSLayoutAttributeRight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:_actionsContainerView
                                     attribute:NSLayoutAttributeRight
                                    multiplier:1.0
                                      constant:0.0].active = YES;
        [NSLayoutConstraint constraintWithItem:button
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1.0
                                      constant:self.actionHeight].active = YES;
        if (lastView == nil) {
            [NSLayoutConstraint constraintWithItem:button
                                         attribute:NSLayoutAttributeTop
                                         relatedBy:NSLayoutRelationEqual
                                            toItem:_actionsContainerView
                                         attribute:NSLayoutAttributeTop
                                        multiplier:1.0
                                          constant:(1.0/[UIScreen mainScreen].scale)].active = YES;
        }else{
            [NSLayoutConstraint constraintWithItem:button
                                         attribute:NSLayoutAttributeTop
                                         relatedBy:NSLayoutRelationEqual
                                            toItem:lastView
                                         attribute:NSLayoutAttributeBottom
                                        multiplier:1.0
                                          constant:(1.0/[UIScreen mainScreen].scale)].active = YES;
        }
        
        
        lastView = button;
        
    }
}

- (void)sortActions {
    if (_actionsArray.count > 2) {
        [_actionsArray sortUsingComparator:^NSComparisonResult(QLAlertAction *_Nonnull obj1, QLAlertAction*  _Nonnull obj2) {
            if (obj1.style < obj2.style) {
                return NSOrderedAscending;
            }else if(obj1.style > obj2.style){
                return NSOrderedDescending;
            }
            return 0;
        }];
    }else{
        if (self.style == QLAlertViewStyle_ActionSheet) {
            [_actionsArray sortUsingComparator:^NSComparisonResult(QLAlertAction *_Nonnull obj1, QLAlertAction*  _Nonnull obj2) {
                if (obj1.style < obj2.style) {
                    return NSOrderedAscending;
                }else if(obj1.style > obj2.style){
                    return NSOrderedDescending;
                }
                return 0;
            }];
        }else{
            [_actionsArray sortUsingComparator:^NSComparisonResult(QLAlertAction *_Nonnull obj1, QLAlertAction*  _Nonnull obj2) {
                if (obj1.style < obj2.style) {
                    return NSOrderedDescending;
                }else if(obj1.style > obj2.style){
                    return NSOrderedAscending;
                }
                return 0;
            }];
        }
    }
}

#pragma mark - setter
- (void)setPadding:(CGFloat)padding {
  _padding = padding;
    [self setNeedsUpdateConstraints];
}

- (void)setActionHeight:(CGFloat)actionHeight {
    _actionHeight = actionHeight;
    [self setNeedsUpdateConstraints];
}

- (void)setStyle:(QLAlertViewStyle)style {
    _style = style;
    if (style == QLAlertViewStyle_Alert) {
        self.layer.cornerRadius = 8.0f;
    }else{
        self.layer.cornerRadius = 0.0f;
    }
}

#pragma mark - Getter

#pragma mark - Method

- (UIButton *)buttonWithAction:(QLAlertAction *)action {
 
    UIButton *actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    actionButton.translatesAutoresizingMaskIntoConstraints = NO;
    [actionButton setTag:[_actionsArray indexOfObject:action] + 1000];
    [actionButton setTitle:action.title forState:UIControlStateNormal];
    [actionButton setTitleColor:action.color forState:UIControlStateNormal];
    [actionButton.titleLabel setFont:action.font];
    [actionButton setBackgroundImage:[self imageWithColor:[UIColor whiteColor] size:CGSizeMake(1, 1)] forState:UIControlStateNormal];
    [actionButton setBackgroundImage:[self imageWithColor:[UIColor lightGrayColor] size:CGSizeMake(1, 1)] forState:UIControlStateHighlighted];

    [actionButton addTarget:self action:@selector(actionButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    return actionButton;
}

- (void)actionButtonDidClicked:(UIButton *)sender {
    QLAlertAction *action = _actionsArray[sender.tag - 1000];
    if (action.handler) {
        action.handler();
    }
    if (action.style == QLAlertActionStyleCancel) {
        // 点击button后自动dismiss
        if (_controller) {
            [_controller dismissViewControllerAnimated:YES completion:nil];
        }
    }
}

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    @autoreleasepool {
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context,color.CGColor);
        CGContextFillRect(context, rect);
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return img;
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
