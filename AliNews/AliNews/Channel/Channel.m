//
//  Channel.m
//  AliNews
//
//  Created by 黄礼潮 on 16/3/17.
//  Copyright © 2016年 黄礼潮. All rights reserved.
//

#import "Channel.h"
#import "NSObject+Extension.h"

@implementation Channel

+(NSArray *)channelsList{

    NSString *path = [[NSBundle mainBundle] pathForResource:@"topic_news.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    //JSON反序列化
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    
    NSArray *array = dict[dict.keyEnumerator.nextObject];
    
    NSMutableArray *array1 =[NSMutableArray arrayWithCapacity:array.count];
    //字典转模型
    for (NSDictionary *dict1 in array) {
        
        [array1 addObject:[self objectWithDict:dict1]];
     
    }

    return array1.copy;
}

-(NSString *)description{
    
    NSArray *property = [self.class loadArrayData];
    NSDictionary *dict = [self dictionaryWithValuesForKeys:property];
    
    return [NSString stringWithFormat:@"<%@: %p>,%@",self.class,self,dict];
    
}

@end
