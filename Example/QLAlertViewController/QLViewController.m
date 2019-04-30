//
//  QLViewController.m
//  QLAlertViewController
//
//  Created by Paramita on 04/30/2019.
//  Copyright (c) 2019 Paramita. All rights reserved.
//

#import "QLViewController.h"
#import "QLAlertViewController.h"


@interface QLViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSArray *dataArray;
@end

@implementation QLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _dataArray = @[
                   @"showAlert with tow buttons",
                   @"showAlert with tow+ buttons",
                   @"show action sheet with tow buttons",
                   ];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentify = @"cellIdentify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (cell == nil) {
        cell = [UITableViewCell new];
    }
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < 2) {
         [self showAlert:indexPath.row style:QLAlertViewStyle_Alert];
    }else{
        [self showAlert:indexPath.row style:QLAlertViewStyle_ActionSheet];
    }
}

- (void)showAlert:(NSInteger)count style:(QLAlertViewStyle)style {
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
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
