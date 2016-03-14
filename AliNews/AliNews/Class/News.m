//
//  News.m
//  AliNews
//
//  Created by 黄礼潮 on 16/3/13.
//  Copyright © 2016年 黄礼潮. All rights reserved.
//

#import "News.h"
#import "NetWorkTools.h"

@implementation News

+(instancetype)newsWithDict:(NSDictionary *)dict{

    id obj = [[self alloc]init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;

}


+(void)loadNewsListWithString:(NSString *)urlString{

    [[[NetWorkTools shardTools] GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }]resume];


}
@end
