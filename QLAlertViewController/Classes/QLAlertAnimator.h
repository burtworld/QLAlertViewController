//
//  QLAlertAnimator.h
//  QLDemoProject
//
//  Created by Paramita on 2019/4/28.
//  Copyright © 2019 paramita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "QLAlertHeader.h"

@interface QLAlertAnimator : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) QLAlertViewAnimatorStyle style;

@end

