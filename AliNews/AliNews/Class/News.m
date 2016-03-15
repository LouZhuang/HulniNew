//
//  News.m
//  AliNews
//
//  Created by 黄礼潮 on 16/3/13.
//  Copyright © 2016年 黄礼潮. All rights reserved.
//

#import "News.h"
#import "NetWorkTools.h"
#import <objc/runtime.h>

@implementation News

+(instancetype)newsWithDict:(NSDictionary *)dict{
    
    id obj = [[self alloc]init];
    NSArray *array = [self loadArrayData];
    
    for (NSString * key in array) {
        if (dict[key] != nil){
        
            [obj setValue:dict[key] forKey:key];
        }
    }
    
    
    return obj;

}
//用运行时动态的加载属性
const char * kHulni = "kHulni";
+(NSArray *)loadArrayData{
    
    NSArray *plist = objc_getAssociatedObject(self,kHulni);
    
    if (plist != nil) {
        return plist;
    }
    NSLog(@"%@",plist);
    
    unsigned int count;
    
  objc_property_t *list = class_copyPropertyList([self class], &count);
    
    //可变数组
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:count];
    
    for (unsigned int i = 0; i<count; i++) {
        
        objc_property_t pty = list[i];
        
        //获取属相名称
        
        const char * cName = property_getName(pty);
        
        [arrayM addObject:[NSString stringWithUTF8String:cName]];
    }
    
    NSLog(@"%@",arrayM);
    
    free(list);
    //设置关联对象，是运用时使用最多的  获取关联对象  提高性能，不用每次进来判断对象中是否有该属性
    objc_setAssociatedObject(self, kHulni, arrayM, OBJC_ASSOCIATION_COPY_NONATOMIC);

    
    return  objc_getAssociatedObject(self, kHulni);

}

-(NSString *)description{

    NSArray *array = [self.class loadArrayData];
    NSDictionary *dict = [ self dictionaryWithValuesForKeys:array];

    return [NSString stringWithFormat:@"<%@: %p> %@",self.class,self,dict];
}


+(void)loadNewsListWithString:(NSString *)urlString{

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
            [arrayM addObject:[self newsWithDict:obj]];
        }
        NSLog(@"%@",arrayM);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }]resume];


}
@end
