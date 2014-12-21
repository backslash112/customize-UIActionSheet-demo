//
//  ViewController.h
//  CustomizeUIActionSheetDemo
//
//  Created by YangCun on 14/12/21.
//  Copyright (c) 2014年 backslash112. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIActionSheetDelegate>
- (IBAction)showActionSheetButtonClick:(id)sender;

@property (nonatomic, strong) UIActionSheet *myActionSheet;

@end

