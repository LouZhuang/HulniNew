//
//  Channel.h
//  AliNews
//
//  Created by 黄礼潮 on 16/3/17.
//  Copyright © 2016年 黄礼潮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Channel : NSObject

@property(nonatomic, copy)NSString *tid;
@property(nonatomic,copy)NSString *tname;
@property(nonatomic,strong)NSString *urlString;

+(NSArray *)channelsList;

@end
