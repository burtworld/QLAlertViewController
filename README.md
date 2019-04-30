# QLAlertViewController

[![CI Status](https://img.shields.io/travis/Paramita/QLAlertViewController.svg?style=flat)](https://travis-ci.org/Paramita/QLAlertViewController)
[![Version](https://img.shields.io/cocoapods/v/QLAlertViewController.svg?style=flat)](https://cocoapods.org/pods/QLAlertViewController)
[![License](https://img.shields.io/cocoapods/l/QLAlertViewController.svg?style=flat)](https://cocoapods.org/pods/QLAlertViewController)
[![Platform](https://img.shields.io/cocoapods/p/QLAlertViewController.svg?style=flat)](https://cocoapods.org/pods/QLAlertViewController)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage

```
#import "QLAlertViewController.h"
```
```
QLAlertViewController *alert = [QLAlertViewController alertWithTitle:@"this is title" message:@"i am message" style:style];

QLAlertAction *cancleAction = [QLAlertAction actionWithTitle:@"Cancle Action" style:QLAlertActionStyleCancel handler:^{
NSLog(@"this is cancle Action");
[alert dismissViewControllerAnimated:YES completion:nil];
}];

QLAlertAction *dangerAction = [QLAlertAction actionWithTitle:@"Danger" color:[UIColor redColor] font:[UIFont systemFontOfSize:18.0f] style:QLAlertActionStyleDefault handler:^{
NSLog(@"Danger");
}];
[alert addActions:@[cancleAction,dangerAction]];
if (count > 0) {
QLAlertAction *ignoreAction = [QLAlertAction actionWithTitle:@"Ignore" color:[UIColor grayColor] font:[UIFont systemFontOfSize:14.0f] style:QLAlertActionStyleDefault handler:^{
NSLog(@"ignoreAction");
}];

QLAlertAction *passAction = [QLAlertAction actionWithTitle:@"AassAction" color:[UIColor greenColor] font:[UIFont systemFontOfSize:20.0f] style:QLAlertActionStyleDestructive handler:^{
NSLog(@"passAction");
}];
[alert addActions:@[ignoreAction,passAction]];
}
[self presentViewController:alert animated:YES completion:NULL];
```
## Installation

QLAlertViewController is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'QLAlertViewController'
```

## Author

Paramita, baqkoo007@aliyun.com

## License

QLAlertViewController is available under the MIT license. See the LICENSE file for more info.
