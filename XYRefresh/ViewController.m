//
//  ViewController.m
//  XYRefresh
//
//  Created by xiaoyu on 15/7/22.
//  Copyright © 2015年 xiaoyu. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+XYRefresh.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>{
    UITableView *table;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    table = [[UITableView alloc] initWithFrame:(CGRect){0,120,self.view.bounds.size.width,self.view.bounds.size.height-240} style:UITableViewStylePlain];
    [self.view addSubview:table];
//    table.backgroundColor = [UIColor redColor];
    
    table.dataSource = self;
    table.delegate = self;
    table.rowHeight = 44;
    [table initDownRefresh];
    [table setDownRefreshBlock:^(id refreshView){
        [refreshView endDownRefresh];
    }];
    
    [table initPullUpRefresh];
    table.pullUpRefreshBlock = ^(id refreshView){
        [refreshView endPullUpRefresh];
    };
}

-(NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

-(UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"1"];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
