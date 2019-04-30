//
//  QLAlertHeader.h
//  SgccMobileOA
//
//  Created by Paramita on 2019/4/28.
//  Copyright © 2019 Paramita. All rights reserved.
//

#ifndef QLAlertHeader_h
#define QLAlertHeader_h

/**
 *  alert style 0-alert    1-actionSheet
*/
typedef NS_ENUM(NSInteger, QLAlertViewStyle) {
    QLAlertViewStyle_Alert,                ///!< alert
    QLAlertViewStyle_ActionSheet,          ///!< action sheet
};

/**
 *
 *
 */
typedef NS_ENUM(NSInteger, QLAlertActionStyle) {
    QLAlertActionStyleDestructive,
    QLAlertActionStyleDefault,
    QLAlertActionStyleCancel
};


/** present style */
typedef NS_ENUM(NSInteger, QLAlertViewAnimatorStyle) {
    //** present */
    QLAlertViewPresentStyleSystem,          // 系统样式
    QLAlertViewPresentStyleFadeIn,          // 渐入
    QLAlertViewPresentStyleBounce,          // 弹出
    QLAlertViewPresentStyleExpandHorizontal,// 水平展开
    QLAlertViewPresentStyleExpandVertical,  // 垂直展开
    QLAlertViewPresentStyleSlideDown,       // 从上往下划入
    QLAlertViewPresentStyleSlideUp,         // 从下往上划入
    QLAlertViewPresentStyleSlideLeft,       // 从右往左划入
    QLAlertViewPresentStyleSlideRight,      // 从左往右划入
    
    /** dismiss */
    QLAlertViewDismissStyleFadeOut,             // 渐出
    QLAlertViewDismissStyleContractHorizontal,  // 水平收起
    QLAlertViewDismissStyleContractVertical,    // 垂直收起
    QLAlertViewDismissStyleSlideDown,           // 向下划出
    QLAlertViewDismissStyleSlideUp,             // 向上划出
    QLAlertViewDismissStyleSlideLeft,           // 向左划出
    QLAlertViewDismissStyleSlideRight,          // 向右划出
};


///!< alterview bg alpha default
#define QLAlertView_backgroundAlpha 0.4f

///!< alterview padding default
#define QLAlertView_Padding 15.0f

///!< alterview padding default
#define QLAlertView_ActionHeight 44.0f

#endif /* QLAlertHeader_h */
