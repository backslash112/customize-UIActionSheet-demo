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
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@""
                                                             delegate:self
                                                    cancelButtonTitle:@""
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"", nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    
    self.myActionSheet = actionSheet;
    NSLog(@"w:%@ h:%@", @(self.myActionSheet.frame.size.width), @(self.myActionSheet.frame.size.height));
    if ([[[UIDevice currentDevice] systemVersion] compare:@"8.0" options:NSNumericSearch] == NSOrderedAscending) {
        // UIActionSheet, iOS 7
        [self.myActionSheet addSubview:[self getBackgroundView]];
        
        UIButton *firstButton = [self getButton];
        firstButton.tag = 1000;
        firstButton.frame = CGRectMake(-8, 0.5, self.view.frame.size.width+8.0f, 44.0f);
        [self.myActionSheet addSubview:firstButton];
        
        UIButton *secondButton = [self getButton];
        secondButton.tag = 1001;
        secondButton.frame = CGRectMake(-8, 45, self.view.frame.size.width+8.0f, 44.0f);
        [self.myActionSheet addSubview:secondButton];
        
        UIButton *cancelButton = [self getButton];
        cancelButton.tag = 1002;
        cancelButton.frame = CGRectMake(-8, 90, self.view.frame.size.width+8.0f, 42.5f);
        [cancelButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self.myActionSheet addSubview:cancelButton];

    } else {
        // UIAlertController iOS 8
        SEL selector = NSSelectorFromString(@"_alertController");
        if ([self.myActionSheet respondsToSelector:selector]) {
            UIAlertController *alertController = [self.myActionSheet valueForKey:@"_alertController"];
            if ([alertController isKindOfClass:[UIAlertController class]]) {
                [alertController.view addSubview:[self getBackgroundView]];
                
                UIButton *firstButton = [self getButton];
                firstButton.tag = 1000;
                firstButton.frame = CGRectMake(-8, 0.5, self.view.frame.size.width+8.0f, 44.0f);
                [alertController.view addSubview:firstButton];
                
                UIButton *secondButton = [self getButton];
                secondButton.tag = 1001;
                secondButton.frame = CGRectMake(-8, 45, self.view.frame.size.width+8.0f, 44.0f);
                [alertController.view addSubview:secondButton];
                
                UIButton *cancelButton = [self getButton];
                cancelButton.tag = 1002;
                cancelButton.frame = CGRectMake(-8, 90, self.view.frame.size.width+8.0f, 42.5f);
                [cancelButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                [alertController.view addSubview:cancelButton];
            }
        }
        
    }
}

- (UIView*)getBackgroundView
{
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(-8.0f, 0.0f, self.view.frame.size.width+8.0f, 150.0f)];
    backgroundView.backgroundColor = [UIColor blackColor];
    return backgroundView;
}

- (UIButton*)getButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"Button 1" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor grayColor]];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)buttonClick:(UIButton*)sender
{
    NSLog(@"button click");
    NSInteger buttonIndex = 0;
    if (sender.tag == 1000) {
        buttonIndex = 0;
        
    } else if (sender.tag == 1001) {
        buttonIndex = 1;
    } else if (sender.tag == 1002) {
        buttonIndex = 2;
    }
    
    [self.myActionSheet dismissWithClickedButtonIndex:buttonIndex animated:YES]; // 直接在当前方法中执行操作，比调用这个方法再操作更快。
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"buttonIndex: %@", @(buttonIndex));
}

- (IBAction)showActionSheetButtonClick:(id)sender {
    /*
    if ([[[UIDevice currentDevice] systemVersion] compare:@"8.0" options:NSNumericSearch] == NSOrderedAscending) {
        [self.myActionSheet showInView:self.view];
        [self.myActionSheet setBounds:CGRectMake(0, 0, 320, 400)];
        [self.myActionSheet setFrame:CGRectMake(0, 0, 320, 400)];
    } else { // iOS 8
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Title"
                                                                                 message:nil
                                                                          preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"Action1"
                                                          style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction *action) {
                                                            
                                                        }];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"Action2"
                                                          style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction *action) {
                                                            
                                                        }];
        
        [alertController addAction:action1];
        [alertController addAction:action2];
        
        [alertController.view addSubview:[self getBackgroundView]];
        [alertController.view addSubview:[self getButton]];
        [self presentViewController:alertController animated:YES completion:nil];
    }*/
    [self.myActionSheet showInView:self.view];
}
@end
