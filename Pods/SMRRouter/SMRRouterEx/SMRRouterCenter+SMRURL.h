//
//  SMRRouterCenter+SMRURL.h
//  SMRRouterDemo
//
//  Created by 丁治文 on 2018/10/5.
//  Copyright © 2018年 sumrise.com. All rights reserved.
//

#import "SMRRouterCenter.h"

@interface SMRRouterCenter (SMRURL)

+ (BOOL)canOpenWithUrl:(NSURL *)url;
+ (id)openWithUrl:(NSURL *)url params:(NSDictionary *)params;
+ (id)openPathWithUrl:(NSURL *)url params:(NSDictionary *)params;

@end
