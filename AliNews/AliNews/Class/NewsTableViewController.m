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

@interface NewsTableViewController (){

    NSArray *_newsList;
}


@end

@implementation NewsTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
   // __weak typeof(self) weakSelf = self;
  [News loadNewsListWithString:@"T1348647853363/0-20.html"finished:^(NSArray *newsList) {
      _newsList = newsList;
      
      [self.tableView reloadData];
  }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   

    return _newsList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell" forIndexPath:indexPath];
    
    cell.news = _newsList[indexPath.row];
    
    return cell;
}





@end
