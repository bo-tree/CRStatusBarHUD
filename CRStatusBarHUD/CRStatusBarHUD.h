//
//  CRStatusBarHUD.h
//  CRStatusBarHUD
//
//  Created by 陈瑞 on 16/6/7.
//  Copyright © 2016年 陈瑞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRStatusBarHUD : NSObject


/**
 *  显示自定义信息和图片
 */
+ (void)showCustomMessage:(NSString *)msg Image:(UIImage *)image;
/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)msg;
/**
 *  显示失败信息
 */
+ (void)showFail:(NSString *)msg;
/**
 *  显示正在处理信息
 */
+ (void)showLoading:(NSString *)msg;
/**
 *  隐藏
 */
+ (void)hide;
@end
