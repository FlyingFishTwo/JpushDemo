//
//  JpushManager.h
//  JpushDemo
//
//  Created by 雨 on 16/11/23.
//  Copyright © 2016年 RYT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JpushManager : NSObject


/**
 初始化

 @return 😝
 */
+ (instancetype)manager;

/**
 配置JPush信息

 @param option launchOptions
 */
- (void)setUpJpushWithOption:(NSDictionary *)option;

/**
 注册远程通知
 */
- (void)registJpushForRemote;

/**
 注册DeviceToken

 @param deviceToken DeviceToken
 */
- (void)registDeviceToken:(NSData *)deviceToken;


/**
 处理收到的 APNs 消息

 @param remoteInfo APNs消息
 */
- (void)handleRemoteNotification:(NSDictionary *)remoteInfo;


/**
 重置脚标(为0)
 */
- (void)resetBadge;

@end
