//
//  News.h
//  AliNews
//
//  Created by 黄礼潮 on 16/3/13.
//  Copyright © 2016年 黄礼潮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject


@property (nonatomic, copy) NSString *title;
/**
 *  新闻摘要
 */
@property (nonatomic, copy) NSString *digest;
/**
 *  跟贴数量
 */
@property (nonatomic, assign) int replyCount;
/**
 *  配图地址
 */
@property (nonatomic, copy) NSString *imgsrc;

+(instancetype)newsWithDict:(NSDictionary *)dict;

+(void)loadNewsListWithString:(NSString *)urlString finished:(void(^)(NSArray *newsList))finished;

@end
