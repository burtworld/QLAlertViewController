//
//  ASPopupAction.m
//  ASPopupView
//
//  Created by Cyrus on 16/4/13.
//  Copyright © 2016年 Cyrus. All rights reserved.
//

#import "QLAlertAction.h"

@implementation QLAlertAction

+ (instancetype)actionWithTitle:(NSString *)title style:(QLAlertActionStyle)style handler:(void(^)(void))handler {
    QLAlertAction *action = [QLAlertAction actionWithTitle:title
                                                     color:[UIColor blueColor]
                                                      font:[UIFont systemFontOfSize:16.0f]
                                                     style:style
                                                   handler:handler];
    return action;
}


+ (instancetype)actionWithTitle:(NSString *)title
                          color:(UIColor *)color
                           font:(UIFont *)font
                          style:(QLAlertActionStyle)style handler:(void(^)(void))handler {
    QLAlertAction *action = [QLAlertAction new];
    action.title = title;
    action.handler = handler;
    action.font = font;
    action.color = color;
    action.style = style;
    return action;
}

@end
