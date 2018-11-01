//
//  SMRTarget.m
//  SMRRouterDemo
//
//  Created by 丁治文 on 2018/10/4.
//  Copyright © 2018年 sumrise.com. All rights reserved.
//

#import "SMRTarget.h"
#import "SMRNavigator.h"
#import "SMRRouterCenter+URL.h"

NSString * const k_perform_last_url = @"k_perform_last_url";
NSString * const k_perform_open = @"k_perform_open";

NSString * const k_change_tab = @"k_change_tab";

@implementation SMRTarget

#pragma mark - SMRTargetURLProtocol

- (void)supportedLastURLActionWithParams:(NSDictionary *)params {
    NSString *lastUrl = params[k_perform_last_url];
    NSURL *url = [NSURL URLWithString:lastUrl];
    if (url) {
        [SMRRouterCenter performWithUrl:url params:nil];
    }
}

- (void)supportedActionWithParams:(NSDictionary *)params
                 toOpenController:(UIViewController *)controller
                  openActionBlock:(void (^)(UIViewController *))openActionBlock
              openPathActionBlock:(void (^)(UIViewController *))openPathActionBlock {
    NSString *supported = params[k_perform_open];
    switch (supported.integerValue) {
        case SMRTargetOpenTypeOpen: {
            if (openActionBlock) {
                openActionBlock(controller);
            } else {
                [SMRNavigator pushOrPresentToViewController:controller animated:YES];
            }
        }
            break;
        case SMRTargetOpenTypeOpenPath: {
            if (openPathActionBlock) {
                openPathActionBlock(controller);
            } else {
                [SMRNavigator pushOrPresentToViewController:controller animated:YES];
            }
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - Public

- (void)actionResetRoot:(NSDictionary *)params {
    [self supportedLastURLActionWithParams:params];
    [SMRNavigator resetToRootViewControllerWithCompletion:nil];
    // 如果传了tab参数,则进行tab切换
    NSString *tab = params[k_change_tab];
    if (tab) {
        [SMRNavigator changeRootTabNavigationControllerWithTab:tab.intValue];
    }
}

@end
