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
#import "ChannelCell.h"

@interface HomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,ChannelLabelDelegate>
@property(nonatomic,strong)NSArray * channelList;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;
@property(nonatomic,assign)NSInteger currentIndex;

@end

@implementation HomeViewController

/// MARK----ChannelLabelDelegate

-(void)scaleChannelLabel:(ChannelLabel *)label{

    self.currentIndex = label.tag;
    
    NSIndexPath *indexpath = [NSIndexPath indexPathForRow:self.currentIndex inSection:0];
    //滚动到特定位置
    [self.collectionView scrollToItemAtIndexPath:indexpath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];


}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //往scrollView上添加Label
    [self addLabel];
    

}
//子视图将要布局，还没开始
-(void)viewDidLayoutSubviews{

    [self setUpLayout];

}

-(void)setUpLayout{
    self.layout.itemSize = self.collectionView.bounds.size;
    self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView.pagingEnabled = YES;
    self.layout.minimumInteritemSpacing = 0;
    self.layout.minimumLineSpacing = 0;
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
}

/// MARK --数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.channelList.count;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    ChannelCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ChannelCell" forIndexPath:indexPath];
  //  cell.backgroundColor = [UIColor redColor];
    
    cell.urlString = [self.channelList[indexPath.item] urlString];
    
    NSLog(@"%@",cell.urlString);
    return cell;

}

/// MARK----代理方法
//一滚动就会调用这个方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //当前选中的标签
    ChannelLabel *currentLabel = self.scrollView.subviews[self.currentIndex];

 //   NSLog(@"%@",currentLabel.text);
    //一个户型 就是返回数组 里面装的是可以滑动的cell的item
    NSArray *indexPaths = [self.collectionView indexPathsForVisibleItems];
    //遍历数组 确定第二个标签
    ChannelLabel *nextLabel = nil;
    for (NSIndexPath *path in indexPaths) {
        if (path.item != self.currentIndex) {
            nextLabel = self.scrollView.subviews[path.item];
        }
    }
    //ABS 取绝对值
    float nextscale = ABS((float)scrollView.contentOffset.x / self.collectionView.bounds.size.width - self.currentIndex);
    
    float currentscale = 1 - nextscale;
    
    currentLabel.scale = currentscale;
    nextLabel.scale = nextscale;
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{


    self.currentIndex = scrollView.contentOffset.x / self.collectionView.bounds.size.width;
}

-(void)addLabel{

    //iOS7 之后 nav + scrollView 默认会向下调整64 个间距点  使表格能够“穿透效果”。
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //设置label 的间距及它的大小
    
    CGFloat margin = 8.0;
    
    CGFloat x = 8.0;
    
    CGFloat h = self.scrollView.bounds.size.height;
    
    NSInteger index = 0;
    for (Channel * channel in self.channelList) {
        
        ChannelLabel *label = [ChannelLabel labelWithTitle:channel.tname];
        
        label.delegate = self;
        
        label.tag = index++;
        label.frame = CGRectMake(x, 0, label.bounds.size.width, h);
        
        x += label.bounds.size.width ;
        
        [self.scrollView addSubview:label];
    }
    self.scrollView.contentSize = CGSizeMake(x + margin, h);
    
    //记录当前的索引值
    self.currentIndex = 0;
    //设置第0个label的scale
    ChannelLabel *l = self.scrollView.subviews[0];
    l.scale = 1;
   

}

-(NSArray *)channelList{
    

    if (_channelList == nil) {
        
        _channelList = [Channel channelsList];
    }

    return _channelList;
}

@end
