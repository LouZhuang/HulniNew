//
//  NewsCell.h
//  AliNews
//
//  Created by 黄礼潮 on 16/3/15.
//  Copyright © 2016年 黄礼潮. All rights reserved.
//

#import <UIKit/UIKit.h>
@class News;
@interface NewsCell : UITableViewCell

@property(nonatomic,copy)News *news;

//返回怎么的cell
+(NSString *)cellIndefiner:(News *)news;

@end
