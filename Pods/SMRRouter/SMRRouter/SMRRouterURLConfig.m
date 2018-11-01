//
//  SMRRouterURLConfig.m
//  SMRRouterDemo
//
//  Created by 丁治文 on 2018/10/4.
//  Copyright © 2018年 sumrise.com. All rights reserved.
//

#import "SMRRouterURLConfig.h"
#import "NSURL+SMRRouter.h"

@implementation SMRURLParserItem

- (void)setUrl:(NSURL *)url {
    _url = url;
}

- (void)setTarget:(NSString *)target {
    _target = target;
}

- (void)setAction:(NSString *)action {
    _action = action;
}

- (void)setParams:(NSDictionary *)params {
    _params = params;
}

+ (instancetype)itemWithUrl:(NSURL *)url Target:(NSString *)target action:(NSString *)action params:(NSDictionary *)params {
    SMRURLParserItem *item = [[SMRURLParserItem alloc] init];
    item.url = url;
    item.target = target;
    item.action = action;
    item.params = params;
    return item;
}

@end

@implementation SMRRouterURLParser

- (void)dealloc {
    self.targetBondingBlock = nil;
}

- (SMRURLParserItem *)parserWithUrl:(NSURL *)url additionParams:(NSDictionary *)additionParams {
    SMRURLParserItem *item = [self p_parserWithUrl:url additionParams:additionParams];
    item.target = [self appendingTargetName:item.target withPrefix:@"SMRTarget"];
    item.action = [self appendingActionName:item.action withPrefix:@"action"];
    return item;
}

- (SMRURLParserItem *)p_parserWithUrl:(NSURL *)url additionParams:(NSDictionary *)additionParams {
    if (!url) {
        return nil;
    }
    NSString *action = [url.path stringByReplacingOccurrencesOfString:@"/" withString:@""];
    NSString *target = url.host;
    // 替换绑定的target
    if (self.targetBondingBlock) {
        NSString *bonding = self.targetBondingBlock()[target];
        if (bonding) {
            NSArray *comp = [bonding componentsSeparatedByString:@"/"];
            target = comp.firstObject;
            action = comp.lastObject;
        }
    }
    // 添加url参数和附加参数
    NSDictionary *urlParams = [url smr_parseredParams];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    if (urlParams) {
        [params addEntriesFromDictionary:urlParams];
    }
    if (additionParams) {
        [params addEntriesFromDictionary:additionParams];
    }
    SMRURLParserItem *item = [SMRURLParserItem itemWithUrl:url Target:target action:action params:[NSDictionary dictionaryWithDictionary:params]];
    return item;
}

#pragma mark - Utils
- (NSString *)appendingTargetName:(NSString *)targetName withPrefix:(NSString *)prefix {
    return [NSString stringWithFormat:@"%@%@", prefix ?: @"", targetName ?: @""];
}
- (NSString *)appendingActionName:(NSString *)actionName withPrefix:(NSString *)prefix {
    NSString *action = [NSString stringWithFormat:@"%@%@", prefix ?: @"", actionName ?: @""];
    return action;
}

@end
