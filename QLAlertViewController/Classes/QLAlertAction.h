//
//  ASPopupAction.h
//  ASPopupView
//
//  Created by Cyrus on 16/4/13.
//  Copyright © 2016年 Cyrus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QLAlertHeader.h"


@interface QLAlertAction : NSObject

/** action 标题 */
@property (nonatomic, copy)NSString *title;

/** color */
@property (nonatomic, copy)UIColor *color;

/** font */
@property (nonatomic, copy)UIFont *font;

/** extents field, not in use now */
@property (nonatomic, copy)UIImage *imgae;

/** extents field, not in use now */
@property (nonatomic, copy)NSAttributedString *attributeString;

/** action 事件 */
@property (nonatomic, copy)void (^handler) (void);

/** action 风格 */
@property (nonatomic, assign)QLAlertActionStyle style;

/**
 *    创建一个 action
 *
 *    @param title   标题
 *    @param style   风格
 *    @param handler 回调
 *
 */
+ (instancetype)actionWithTitle:(NSString *)title style:(QLAlertActionStyle)style handler:(void(^)(void))handler;

+ (instancetype)actionWithTitle:(NSString *)title
                          color:(UIColor *)color
                           font:(UIFont *)font
                          style:(QLAlertActionStyle)style handler:(void(^)(void))handler;

@end
