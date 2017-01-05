//
//  AppDelegate.m
//  JpushDemo
//
//  Created by li on 16/11/23.
//  Copyright © 2016年 RYT. All rights reserved.
//

#import "AppDelegate.h"
#import "JpushManager.h"
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif
#import "JumpManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window.backgroundColor = [UIColor whiteColor];
    [[JpushManager manager] setUpJpushWithOption:launchOptions];//配置Jpush
    [[JpushManager manager] registJpushForRemote];//Jpush注册远程通知
    [[JpushManager manager] resetBadge];//角标清零
    
    
    return YES;
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    [[JpushManager manager] resetBadge];//角标清零
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
        [[UNUserNotificationCenter currentNotificationCenter] removeAllPendingNotificationRequests];
    } else {
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
    }
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [[JpushManager manager] registDeviceToken:deviceToken];//注册设备token
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [[JpushManager manager] handleRemoteNotification:userInfo];
    if (application.applicationState != UIApplicationStateActive) {
        [JumpManager jumpWithUserInfo:userInfo];
    }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    [[JpushManager manager] handleRemoteNotification:userInfo];
    if (application.applicationState != UIApplicationStateActive) {
        [JumpManager jumpWithUserInfo:userInfo];
    }
    completionHandler(UIBackgroundFetchResultNewData);
}



@end
