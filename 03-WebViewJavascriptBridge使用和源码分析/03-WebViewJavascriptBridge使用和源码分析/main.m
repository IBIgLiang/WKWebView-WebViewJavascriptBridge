//
//  main.m
//  03-WebViewJavascriptBridge使用和源码分析
//
//  Created by zhangzhiliang on 2020/5/12.
//  Copyright © 2020 zhangzhiliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
