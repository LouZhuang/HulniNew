//
//  ChannelLabel.m
//  AliNews
//
//  Created by 黄礼潮 on 16/3/18.
//  Copyright © 2016年 黄礼潮. All rights reserved.
//

#import "ChannelLabel.h"

@implementation ChannelLabel

+(instancetype )labelWithTitle:(NSString *)titlle{
 
    ChannelLabel *label = [[ChannelLabel alloc]init];
    label.font = [UIFont systemFontOfSize:18];
    
    label.textAlignment = NSTextAlignmentCenter;
    
    label.text = titlle;
    
    
    [label sizeToFit];
    
    label.font = [UIFont systemFontOfSize: 14];
    


    return  label;
}
@end
