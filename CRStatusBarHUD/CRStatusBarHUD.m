//
//  CRStatusBarHUD.m
//  CRStatusBarHUD
//
//  Created by 陈瑞 on 16/6/7.
//  Copyright © 2016年 陈瑞. All rights reserved.
//  版本号 1.1.1   大版本.功能版本.bug修复版本,当前两个变化时，后面的版本都要清零

#import "CRStatusBarHUD.h"

#define CRMessageTextFont [UIFont systemFontOfSize:12] //字体大小
#define CRMessageDuration 2.0 //消息停留时间
#define CRMessageAnimationTime 0.25 //消息动画显示／隐藏时间
#define CRWindowHeight 20 //窗口高度
@implementation CRStatusBarHUD

static UIWindow *window_;
static NSTimer *timer_;

+ (void)showWindow //初始化窗口
{
   
    CGRect frame = CGRectMake(0, -CRWindowHeight, [UIScreen mainScreen].bounds.size.width, CRWindowHeight);
    window_.hidden = YES;//解决连续点击出现白线
    window_ = [[UIWindow alloc]init];
   
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
    window_.frame = frame;
   
    frame.origin.y = 0;
    [UIView animateWithDuration:CRMessageAnimationTime animations:^{
        window_.frame = frame;
    }];
}
/**
 *  显示自定义信息和图片
 */
+ (void)showCustomMessage:(NSString *)msg Image:(UIImage *)image
{
    [timer_ invalidate];//取消定时器
    
    [self showWindow];//显示窗口
    
    //添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    
    if (image) {//如果有图片设置图片，设置和文字的间距
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        [button setImage:image forState:UIControlStateNormal];
    }
    button.titleLabel.font = CRMessageTextFont;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    timer_ = [NSTimer scheduledTimerWithTimeInterval:CRMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
    
    
}
/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)msg
{
    [self showCustomMessage:msg Image:[UIImage imageNamed:@"CRStatusBarHUD.bundle/success"]];
}
/**
 *  显示失败信息
 */
+ (void)showFail:(NSString *)msg
{
    [self showCustomMessage:msg Image:[UIImage imageNamed:@"CRStatusBarHUD.bundle/fail"]];
}
/**
 *  显示正在处理信息
 */
+ (void)showLoading:(NSString *)msg
{
    [timer_ invalidate];//取消定时器
    timer_ = nil;
    
    [self showWindow];//显示窗口
    
    UILabel *label = [[UILabel alloc]init];//添加文字
    label.frame = window_.bounds;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    label.font = CRMessageTextFont;
    label.textAlignment = NSTextAlignmentCenter;
    [window_ addSubview:label];
    
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [activity startAnimating];
    
    CGFloat labelWidth = [msg sizeWithAttributes:@{NSFontAttributeName : CRMessageTextFont}].width;
    CGFloat centerX = (window_.frame.size.width - labelWidth) *0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    activity.center = CGPointMake(centerX, centerY);
    [window_ addSubview:activity];
}
/**
 *  隐藏
 */
+ (void)hide
{
    [UIView animateWithDuration:CRMessageAnimationTime animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = - CRWindowHeight;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
    
   
}
@end
