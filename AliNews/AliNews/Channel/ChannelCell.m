//
//  ChannelCell.m
//  AliNews
//
//  Created by 黄礼潮 on 16/3/19.
//  Copyright © 2016年 黄礼潮. All rights reserved.
//

#import "ChannelCell.h"
#import "NewsTableViewController.h"

@implementation ChannelCell

-(void)awakeFromNib{

    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    
    NewsTableViewController *newsVc = sb.instantiateInitialViewController;
    
    [self addSubview:newsVc.view];


}

@end
