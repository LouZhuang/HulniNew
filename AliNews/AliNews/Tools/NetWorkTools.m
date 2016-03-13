//
//  NetWorkTools.m
//  AliNews
//
//  Created by 黄礼潮 on 16/3/13.
//  Copyright © 2016年 黄礼潮. All rights reserved.
//

#import "NetWorkTools.h"
#import <AFNetworking/AFHTTPSessionManager.h>

@implementation NetWorkTools

+(instancetype)shardTools{

    static NetWorkTools *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[self alloc]initWithBaseURL:nil];
        
    });

    return instance;
}

@end
