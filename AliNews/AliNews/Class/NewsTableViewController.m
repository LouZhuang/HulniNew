//
//  NewsTableViewController.m
//  AliNews
//
//  Created by 黄礼潮 on 16/3/13.
//  Copyright © 2016年 黄礼潮. All rights reserved.
//

#import "NewsTableViewController.h"
#import "News.h"
#import "NewsCell.h"

@interface NewsTableViewController ()

@property(nonatomic,strong) NSArray *newsList;
@end

@implementation NewsTableViewController

-(void)setNewsList:(NSArray *)newsList{

    _newsList = newsList;
    
    [self.tableView reloadData];
 


}

-(void)setUrlString:(NSString *)urlString{
    
    self.newsList = nil;

    _urlString = urlString;

    [News loadNewsListWithString:urlString finished:^(NSArray *newsList) {
         __weak typeof(self) weakSelf = self;
       
        weakSelf.newsList = newsList;
 }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //计算行高
    self.tableView.estimatedRowHeight = 80;
    self.tableView.rowHeight  = UITableViewAutomaticDimension;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   

    return self.newsList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    News * n = self.newsList[indexPath.row];
    
    NSString *ID = [NewsCell cellIndefiner:n];
    
    
   NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
   
    
    cell.news = n;
    
    return cell;
}





@end
