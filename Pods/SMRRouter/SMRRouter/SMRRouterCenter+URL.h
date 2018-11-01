//
//  SMRRouterCenter+URL.h
//  SMRRouterDemo
//
//  Created by 丁治文 on 2018/10/5.
//  Copyright © 2018年 sumrise.com. All rights reserved.
//

#import "SMRRouterCenter.h"

@interface SMRRouterCenter (URL)

/// scheme://target/action?param1=a&param2=b
+ (BOOL)canResponseWithUrl:(NSURL *)url;
+ (id)performWithUrl:(NSURL *)url params:(NSDictionary *)params;

@end
