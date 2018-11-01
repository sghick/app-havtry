//
//  SMRRouterConfig.h
//  SMRRouterDemo
//
//  Created by 丁治文 on 2018/10/4.
//  Copyright © 2018年 sumrise.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMRRouterURLConfig.h"

@interface SMRRouterConfig : NSObject<SMRRouterURLConfigProtocol>

/// 初始化入口
- (void)settingInit NS_REQUIRES_SUPER;

#pragma mark - SMRRouterURLConfigProtocol
/// 解析器,推荐在settingInit方法设置,否则为默认解析器
@property (nonatomic, strong) SMRRouterURLParser *parser;
/// UrlScheme验证block,验证通过返回YES,否则返回NO.
@property (nonatomic, copy)   SMRURLValideBlock urlValideBlock;

@end
