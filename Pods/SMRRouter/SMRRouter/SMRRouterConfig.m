//
//  SMRRouterConfig.m
//  SMRRouterDemo
//
//  Created by 丁治文 on 2018/10/4.
//  Copyright © 2018年 sumrise.com. All rights reserved.
//

#import "SMRRouterConfig.h"

@implementation SMRRouterConfig

@synthesize parser = _parser;
@synthesize urlValideBlock = _urlValideBlock;

- (void)dealloc {
    _parser = nil;
    _urlValideBlock = nil;
}

- (SMRRouterURLParser *)parser {
    if (_parser == nil) {
        _parser = [[SMRRouterURLParser alloc] init];
    }
    return _parser;
}

- (void)settingInit {
    
}

@end
