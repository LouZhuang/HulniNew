//
//  NetWorkTools.m
//  AliNews
//
//  Created by 黄礼潮 on 16/3/13.
//  Copyright © 2016年 黄礼潮. All rights reserved.
//

#import "NetWorkTools.h"


@implementation NetWorkTools

+(instancetype)shardTools{

    static NetWorkTools *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *url = [NSURL URLWithString:@"http://c.m.163.com/nc/article/headline/"];
        
        instance = [[self alloc]initWithBaseURL:url];
        
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",nil];
    });

    return instance;
}

@end
