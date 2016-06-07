//
//  ViewController.m
//  CRStatusBarHUDExample
//
//  Created by 陈瑞 on 16/6/7.
//  Copyright © 2016年 陈瑞. All rights reserved.
//

#import "ViewController.h"
#import "CRStatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)sucess:(id)sender {
    [CRStatusBarHUD showSuccess:@"加载成功！"];
}
- (IBAction)fail:(id)sender {
    [CRStatusBarHUD showFail:@"加载失败！"];
}
- (IBAction)loading:(id)sender {
    [CRStatusBarHUD showLoading:@"正在加载中...."];
}
- (IBAction)hide:(id)sender {
    [CRStatusBarHUD hide];
}
- (IBAction)custom:(id)sender {
    [CRStatusBarHUD showCustomMessage:@"自定义消息" Image:[UIImage imageNamed:@"1"]];
}

@end
