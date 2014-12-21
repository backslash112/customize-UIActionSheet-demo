//
//  ViewController.m
//  CustomizeUIActionSheetDemo
//
//  Created by YangCun on 14/12/21.
//  Copyright (c) 2014年 backslash112. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createUIActionSheet];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createUIActionSheet {
//    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
//                                                             delegate:nil
//                                                    cancelButtonTitle:nil
//                                               destructiveButtonTitle:nil
//                                                    otherButtonTitles:nil];
//    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
//    
//    self.myActionSheet = actionSheet;
//    NSLog(@"w:%@ h:%@", @(self.myActionSheet.frame.size.width), @(self.myActionSheet.frame.size.height));
//    
//    if ([[[UIDevice currentDevice] systemVersion] compare:@"8.0" options:NSNumericSearch] == NSOrderedAscending) {
//        // UIActionSheet, iOS 7
//        [self.myActionSheet addSubview:[self getBackgroundView]];
//        [self.myActionSheet addSubview:[self getButton]];
//    } else {
//        // UIAlertController iOS 8
//        SEL selector = NSSelectorFromString(@"_alertController");
//        if ([self.myActionSheet respondsToSelector:selector]) {
//            UIAlertController *alertController = [self.myActionSheet valueForKey:@"_alertController"];
//            if ([alertController isKindOfClass:[UIAlertController class]]) {
//                [alertController.view addSubview:[self getBackgroundView]];
//                //[alertController.view addSubview:[self getButton]];
//                //[alertController.view setFrame:CGRectMake(0.0f, 0.0f, 320.0f, 200.0f)];
//                NSLog(@"alertController w:%@ h:%@", @(alertController.view.frame.size.width), @(alertController.view.frame.size.height));
//            }
//        }
//    }
}

- (UIView*)getBackgroundView
{
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 500.0f)];
    backgroundView.backgroundColor = [UIColor redColor];
    return backgroundView;
}

- (UIButton*)getButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0.0f, 0.0f, 320.0f, 70.0f);
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"Button 1" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor grayColor]];
    return button;
}

- (IBAction)showActionSheetButtonClick:(id)sender {
    [self.myActionSheet showInView:self.view];
    [self.myActionSheet setBounds:CGRectMake(0, 0, 320, 400)];
    [self.myActionSheet setFrame:CGRectMake(0, 0, 320, 400)];
}
@end
