//
//  SMRRouterCenter+SMRURL.m
//  SMRRouterDemo
//
//  Created by 丁治文 on 2018/10/5.
//  Copyright © 2018年 sumrise.com. All rights reserved.
//

#import "SMRRouterCenter+SMRURL.h"
#import "SMRRouter.h"
#import "SMRTarget.h"

@implementation SMRRouterCenter (SMRURL)

+ (BOOL)canOpenWithUrl:(NSURL *)url {
    return [self canResponseWithUrl:url];
}
+ (id)openWithUrl:(NSURL *)url params:(NSDictionary *)params {
    SMRURLParserItem *item = [[SMRRouterCenter sharedCenter].config.parser parserWithUrl:url additionParams:params];
    if (![item.params.allKeys containsObject:k_perform_open]) {
        url = [url smr_URLByAppendParam:k_perform_open value:[NSString stringWithFormat:@"%@", @(SMRTargetOpenTypeOpen)]];
    }
    return [self performWithUrl:url params:params];
}
+ (id)openPathWithUrl:(NSURL *)url params:(NSDictionary *)params {
    SMRURLParserItem *item = [[SMRRouterCenter sharedCenter].config.parser parserWithUrl:url additionParams:params];
    if (![item.params.allKeys containsObject:k_perform_open]) {
        url = [url smr_URLByAppendParam:k_perform_open value:[NSString stringWithFormat:@"%@", @(SMRTargetOpenTypeOpenPath)]];
    }
    return [self performWithUrl:url params:params];
}

@end
