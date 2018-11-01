//
//  NSURL+SMRRouter.h
//  SMRRouterDemo
//
//  Created by 丁治文 on 2018/10/3.
//  Copyright © 2018年 sumrise.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (SMRRouter)

+ (NSURL *)smr_URLWithString:(NSString *)string;
+ (NSString *)smr_encodeURLQueryStringWithString:(NSString *)string;
+ (NSString *)smr_encodeURLStringWithString:(NSString *)string;
+ (NSString *)smr_decodeURLStringWithString:(NSString *)string;

/// 拼接url参数
- (NSURL *)smr_URLByAppendParam:(NSString *)param value:(NSString *)value;
/// 获取url参数
- (NSDictionary *)smr_parseredParams;

@end
