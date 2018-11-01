//
//  SMRRouterCenter+URL.m
//  SMRRouterDemo
//
//  Created by 丁治文 on 2018/10/5.
//  Copyright © 2018年 sumrise.com. All rights reserved.
//

#import "SMRRouterCenter+URL.h"
#import "SMRRouterConfig.h"

@implementation SMRRouterCenter (URL)

+ (BOOL)canResponseWithUrl:(NSURL *)url {
    SMRRouterCenter *center = [SMRRouterCenter sharedCenter];
    if (![self p_checkSchemeResponsableWithConfig:center.config url:url]) {
        return NO;
    }
    
    SMRURLParserItem *parserItem = [center.config.parser parserWithUrl:url additionParams:nil];
    return [SMRRouterCenter canResponseTarget:parserItem.target action:parserItem.action];
}
+ (id)performWithUrl:(NSURL *)url params:(NSDictionary *)params {
    SMRRouterCenter *center = [SMRRouterCenter sharedCenter];
    if (![self p_checkSchemeResponsableWithConfig:center.config url:url]) {
        return nil;
    }
    
    SMRURLParserItem *parserItem = [center.config.parser parserWithUrl:url additionParams:params];
    return [SMRRouterCenter performWithTarget:parserItem.target action:parserItem.action params:parserItem.params shouldCacheTarget:NO];
}

/// private
+ (BOOL)p_checkSchemeResponsableWithConfig:(SMRRouterConfig *)config url:(NSURL *)url {
    BOOL canResponse = YES;
    if (config.urlValideBlock) {
        canResponse = config.urlValideBlock(url);
    }
    return canResponse;
}

@end
