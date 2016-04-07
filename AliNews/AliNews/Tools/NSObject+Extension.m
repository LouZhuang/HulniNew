//
//  NSObject+DictModel.m
//  AliNews
//
//  Created by 黄礼潮 on 16/3/17.
//  Copyright © 2016年 黄礼潮. All rights reserved.
//

#import "NSObject+Extension.h"
#import <objc/runtime.h>
const char * kHulni = "kHulni";
@implementation NSObject (Extension)

+(instancetype)objectWithDict:(NSDictionary *)dict{
    
    id obj = [[self alloc]init];
    NSArray *array = [self loadArrayData];
    
    for (NSString * key in array) {
        if (dict[key] != nil){
            
            [obj setValue:dict[key] forKey:key];
        }
    }
    
    
    return obj;
    
}


+(NSArray *)loadArrayData{

    NSArray *plist = objc_getAssociatedObject(self,kHulni);

    if (plist != nil) {
        return plist;
    }
  //  NSLog(@"%@",plist);

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

  //  NSLog(@"%@",arrayM);

    free(list);
    //设置关联对象，是运用时使用最多的  获取关联对象  提高性能，不用每次进来判断对象中是否有该属性
    objc_setAssociatedObject(self, kHulni, arrayM, OBJC_ASSOCIATION_COPY_NONATOMIC);


    return  objc_getAssociatedObject(self, kHulni);

}


@end
