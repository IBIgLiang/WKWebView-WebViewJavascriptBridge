//
//  ViewController.m
//  03-WebViewJavascriptBridge使用和源码分析
//
//  Created by zhangzhiliang on 2020/5/12.
//  Copyright © 2020 zhangzhiliang. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
#import "WebViewJavascriptBridge.h"

@interface ViewController ()

@property (nonatomic, strong) WKWebView *webView;

@property (nonatomic, strong) WebViewJavascriptBridge *bridge;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WKWebViewConfiguration *configaration = [[WKWebViewConfiguration alloc] init];
    
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:configaration];
    [self.view addSubview:self.webView];
    
    self.bridge  = [WebViewJavascriptBridge bridgeForWebView:self.webView];
    
    // iOS端注册通信方法
    [self.bridge registerHandler:@"iOS2JS" handler:^(id data, WVJBResponseCallback responseCallback) {
        NSLog(@"我是js传递给iOS的数据: %@", data);
        responseCallback(@"我是iOS回传给js的数据");
    }];
    
    // iOS端响应js注册的通信方法
    [self.bridge callHandler:@"JS2iOS" data:@[@"111",@"222"] responseCallback:^(id responseData) {
        NSLog(@"%@",responseData);
    }];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"index.html" withExtension:nil];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}


@end
