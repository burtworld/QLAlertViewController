//
//  QLAlertView.h
//  QLDemoProject
//
//  Created by Paramita on 2019/4/28.
//  Copyright © 2019 paramita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QLAlertHeader.h"
#import "QLAlertAction.h"

@interface QLAlertView : UIView
@property (nonatomic, assign) CGFloat padding;

/// action height , default is 44
@property (nonatomic, assign) CGFloat actionHeight;

@property (nonatomic, assign) QLAlertViewStyle style;

@property (nonatomic, retain) UILabel * _Nullable titleLabel;
@property (nonatomic, retain) UILabel * _Nullable msgLabel;

- (void)addAction:(QLAlertAction * _Nonnull)action;

- (_Nonnull instancetype)initWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message;

- (_Nonnull instancetype)initWithTitle:(NSString * _Nullable)title
                               message:(NSString * _Nullable)message
                                 style:(QLAlertViewStyle)style;
@end

