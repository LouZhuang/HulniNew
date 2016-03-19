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
//重写setter 方法，意味着对象的引用处理，全部由程序员接管
//重写copy 属性的时候，一定要在后面写copy
-(void)setTid:(NSString *)tid{
//如果不使用copy,外面的copy就白写了
// 设置数值的时候，tid 属性只是一个strong,而不是copy
    _tid = tid.copy;
    
    _urlString = [NSString stringWithFormat:@"%@/0-20.html",tid];
}

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

    return  [array1.copy sortedArrayUsingComparator:^NSComparisonResult(Channel *obj1, Channel * obj2) {
        
        return [obj1.tid compare:obj2.tid];
    }];
}

-(NSString *)description{
    
    NSArray *property = [self.class loadArrayData];
    NSDictionary *dict = [self dictionaryWithValuesForKeys:property];
    
    return [NSString stringWithFormat:@"<%@: %p>,%@",self.class,self,dict];
    
}

@end
