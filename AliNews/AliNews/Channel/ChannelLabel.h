//
//  ChannelLabel.h
//  AliNews
//
//  Created by 黄礼潮 on 16/3/18.
//  Copyright © 2016年 黄礼潮. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  ChannelLabelDelegate;



@interface ChannelLabel : UILabel

+(instancetype )labelWithTitle:(NSString *)titlle;

@property(nonatomic,weak)id<ChannelLabelDelegate>delegate;

@property(nonatomic,assign)float scale;

@end

@protocol ChannelLabelDelegate <NSObject>



-(void)scaleChannelLabel:(ChannelLabel *)label;

@end
