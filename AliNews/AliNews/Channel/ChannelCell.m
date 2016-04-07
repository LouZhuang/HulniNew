//
//  ChannelCell.m
//  AliNews
//
//  Created by 黄礼潮 on 16/3/19.
//  Copyright © 2016年 黄礼潮. All rights reserved.
//

#import "ChannelCell.h"
#import "NewsTableViewController.h"

@interface ChannelCell (){

       NewsTableViewController * _newsVc;
}



@end

@implementation ChannelCell

-(void)setUrlString:(NSString *)urlString{

    _urlString = urlString;
    
    _newsVc.urlString = urlString;

}

-(void)awakeFromNib{

    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    
    _newsVc = sb.instantiateInitialViewController;
    
    [self addSubview:_newsVc.view];

   
}

-(void)layoutSubviews{

    [super layoutSubviews];
    
    _newsVc.view.frame = self.bounds;


}



@end
