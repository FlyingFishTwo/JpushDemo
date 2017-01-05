//
//  JumpManager.m
//  JpushDemo
//
//  Created by 雨 on 16/11/23.
//  Copyright © 2016年 RYT. All rights reserved.
//

#import "JumpManager.h"
#import "ViewController.h"
#import "SecondViewController.h"
@implementation JumpManager

+ (void)jumpWithUserInfo:(NSDictionary *)userInfo {
    SecondViewController *vc = [SecondViewController new];
    vc.title = @"push";
    [[self current].navigationController pushViewController:vc animated:YES];
}

+ (UIViewController *)current {
    UIViewController *vc = [[UIApplication sharedApplication] keyWindow].rootViewController;
    if ([vc isKindOfClass:[UINavigationController class]]) {
        vc = ((UINavigationController *)vc).topViewController;
    }
    return vc;
}

@end
