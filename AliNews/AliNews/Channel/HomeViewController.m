//
//  HomeViewController.m
//  AliNews
//
//  Created by 黄礼潮 on 16/3/17.
//  Copyright © 2016年 黄礼潮. All rights reserved.
//

#import "HomeViewController.h"
#import "Channel.h"
#import "ChannelLabel.h"

@interface HomeViewController ()
@property(nonatomic,strong)NSArray * channelList;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //往scrollView上添加Label
    [self addLabel];
}

-(void)addLabel{

    //iOS7 之后 nav + scrollView 默认会向下调整64 个间距点  使表格能够“穿透效果”。
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //设置label 的间距及它的大小
    
    CGFloat margin = 8.0;
    
    CGFloat x = 8.0;
    
    CGFloat h = self.scrollView.bounds.size.height;
    
    for (Channel * channel in self.channelList) {
        
        ChannelLabel *label = [ChannelLabel labelWithTitle:channel.tname];
        
        
        label.frame = CGRectMake(x, 0, label.bounds.size.width, h);
        
        x += label.bounds.size.width ;
        
        [self.scrollView addSubview:label];
    }
    self.scrollView.contentSize = CGSizeMake(x + margin, h);

}

-(NSArray *)channelList{
    

    if (_channelList == nil) {
        
        _channelList = [Channel channelsList];
    }

    return _channelList;
}

@end
