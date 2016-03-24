//
//  ChannelLabel.m
//  AliNews
//
//  Created by 黄礼潮 on 16/3/18.
//  Copyright © 2016年 黄礼潮. All rights reserved.
//

#import "ChannelLabel.h"

@implementation ChannelLabel

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if ([self.delegate respondsToSelector:@selector(scaleChannelLabel:)]) {
        [self.delegate scaleChannelLabel:self];
    }
    
}

+(instancetype )labelWithTitle:(NSString *)titlle{
 
    ChannelLabel *label = [[ChannelLabel alloc]init];
    label.font = [UIFont systemFontOfSize:18];
    
    label.textAlignment = NSTextAlignmentCenter;
    
    label.text = titlle;
    label.numberOfLines = 0;
    label.userInteractionEnabled = YES;
    
    [label sizeToFit];
    
    label.font = [UIFont systemFontOfSize: 14];


    return  label;
}

-(void)setScale:(float)scale{

    _scale = scale;
    
    float present = (18 - 14) / 18;
    present = present*scale + 1;
    
    self.transform = CGAffineTransformMakeScale(present, present);
    
    self.textColor = [UIColor colorWithRed:scale green:0 blue:0 alpha:1.0];

}
@end
