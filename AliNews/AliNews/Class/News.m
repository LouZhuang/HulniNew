//
//  News.m
//  AliNews
//
//  Created by 黄礼潮 on 16/3/13.
//  Copyright © 2016年 黄礼潮. All rights reserved.
//

#import "News.h"
#import "NetWorkTools.h"
#import "NSObject+DictModel.h"

@implementation News


+(void)loadNewsListWithString:(NSString *)urlString finished:(void (^)(NSArray *))finished{

    [[[NetWorkTools shardTools] GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * responseObject) {
        
        NSLog(@"%@",responseObject.keyEnumerator.nextObject);
        //responseObject.keyEnumerator.nextObject 通过这个属性值，拿到字典中的第一个数组中的值
        NSArray *array = responseObject[responseObject.keyEnumerator.nextObject];
        NSLog(@"%@",array);
        //拿到数组之后，然后字典转模型...
        //Capacity这是一个容器，会自动递增，不会崩溃，每次递增10个长度来存储数据
        //[NSMutableArray array ] 这个会临时开辟空间
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:10];
        for (NSDictionary * obj in array) {
            [arrayM addObject:[self objectWithDict:obj]];
        }
    //    NSLog(@"%@",arrayM);
        
        //这个方法是异步的 数据解析之后完成回调
        finished(arrayM);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }]resume];


}
@end
