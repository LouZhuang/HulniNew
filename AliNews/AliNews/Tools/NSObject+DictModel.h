//
//  NSObject+DictModel.h
//  AliNews
//
//  Created by 黄礼潮 on 16/3/17.
//  Copyright © 2016年 黄礼潮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DictModel)

+(NSArray *)loadArrayData;
+(instancetype)objectWithDict:(NSDictionary *)dict;
@end
