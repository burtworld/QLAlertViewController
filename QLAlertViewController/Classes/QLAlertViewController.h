//
//  QLAlertViewController.h
//  SgccMobileOA
//
//  Created by Paramita on 2019/4/28.
//  Copyright © 2019 Paramita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QLAlertHeader.h"
#import "QLAlertAction.h"
#import "QLAlertView.h"


/**
 *  QLAlertViewController 像系统的AlertViewController一样使用即可
 */
@interface QLAlertViewController : UIViewController


@property (nonatomic, assign) QLAlertViewStyle style;


/**
 *  set the present animation style
 *  default for alter is zoom, and action sheet is slide up
 */
@property (nonatomic, assign) QLAlertViewAnimatorStyle presentTyle;


/**
 *  set the present animation style
 *  default for alter is zoom, and action sheet is slide up
 */
@property (nonatomic, assign) QLAlertViewAnimatorStyle dismissStyle;


/** the bg view */
@property (nonatomic, retain) UIView * _Nullable bgView;


/** set alert view padding;affact on style alert */
@property (nonatomic, assign) CGFloat padding;

/** Alert view; content view */
@property (nonatomic, retain) QLAlertView * _Nullable alertView;


/** the value is calculator auto when call the method <b>viewDidLayoutSubviews</b> */
@property (nonatomic, assign) CGFloat alertViewHeight;




/**
 *  @see alertWithTitle:(NSString *_Nullable)title
 *              message:(NSString *_Nullable)message
 *                style:(QLAlertViewStyle)style
 *              present:(QLAlertViewAnimatorStyle)presentStyle
 *              dismiss:(QLAlertViewAnimatorStyle)dismisStyle;
 */
+ (_Nonnull instancetype)alertWithTitle:(NSString *_Nullable)title
                                message:(NSString *_Nullable)message
                                  style:(QLAlertViewStyle)style;

/**
 Factory Method
 
 @param title title
 @param message msg
 @param style style
 @return instance
 */
+ (_Nonnull instancetype)alertWithTitle:(NSString *_Nullable)title
                                message:(NSString *_Nullable)message
                                  style:(QLAlertViewStyle)style
                                present:(QLAlertViewAnimatorStyle)presentStyle
                                dismiss:(QLAlertViewAnimatorStyle)dismisStyle;


/** 添加 action */
- (void)addAction:(QLAlertAction * _Nonnull)action;



/** 直接添加一个数组的 action */
- (void)addActions:(NSArray<QLAlertAction *> * _Nonnull)actions;
@end

