//
//  NewsCell.m
//  AliNews
//
//  Created by 黄礼潮 on 16/3/15.
//  Copyright © 2016年 黄礼潮. All rights reserved.
//

#import "NewsCell.h"
#import "News.h"

@interface NewsCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *digsrcLabel;
@property (weak, nonatomic) IBOutlet UILabel *replyLabel;

@end

@implementation NewsCell

-(void)setNews:(News *)news{

    _news = news;
    
    self.titleLabel.text = news.title;
    self.digsrcLabel.text = news.digest;
    self.replyLabel.text = [NSString stringWithFormat:@"%d",news.replyCount];

}

- (void)awakeFromNib {
    // Initialization code
    //digsrc换行高度
    self.digsrcLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - CGRectGetMaxX(self.iconView.frame)  - 16;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
