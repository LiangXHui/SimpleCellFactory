//
//  LHTableViewController.m
//  SimpleCellFactory
//
//  Created by apple on 16/5/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LHTableViewController.h"
#import <MJRefresh.h>
#import "LHNetWorkTool.h"
#import "LHCellFactory.h"

@interface LHTableViewController ()

/** 数据数组*/
@property(nonatomic,retain)NSMutableArray *dataModelArr;
/** 界面数据计数器*/
@property(nonatomic,assign)NSInteger count;
@end

@implementation LHTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"SimpleCellFactory";
    
    self.count = 1;
    self.dataModelArr = [NSMutableArray new];
    
    [self.tableView registerClass:[LHOneImageTableViewCell class] forCellReuseIdentifier:NEWSONEIMAGECELL];
    
    [self.tableView registerClass:[LHOneImageTableViewCell class] forCellReuseIdentifier:NEWSONEIMAGECELLSPECIAL];
    
    [self.tableView registerClass:[LHOneBigImageTableViewCell class] forCellReuseIdentifier:NEWSONEBIGIMAGECELL];
    
    [self.tableView registerClass:[LHImagesTableViewCell class] forCellReuseIdentifier:NEWSIMAGESCELL];
    
    
    self.tableView.tableFooterView = [UIView new];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
    [self.tableView.mj_header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//头部刷新数据
- (void)headerRereshing{
    [self.dataModelArr removeAllObjects];
    [self.tableView reloadData];
    NSString *temp = @"http://c.m.163.com/nc/article/headline/T1348647853363/0-20.html";
    [LHNetWorkTool getWithURL:temp paramer:nil httpHeader:nil responseType:ResponseTypeJSON progress:nil success:^(id result) {
        result = [result objectForKey:@"T1348647853363"];
        for (NSDictionary *dic in result) {
            LHNewsModel *model = [LHNewsModel newsModelWithDic:dic];
            [self.dataModelArr addObject:model];
        }
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        [self.tableView.mj_header endRefreshing];
        
    }];
}

//底部加载数据
- (void)footerRereshing{

    NSString *temp = [NSString stringWithFormat:@"http://c.m.163.com/nc/article/headline/T1348647853363/%ld-20.html",20*self.count];
    [LHNetWorkTool getWithURL:temp paramer:nil httpHeader:nil responseType:ResponseTypeJSON progress:nil success:^(id result) {
        result = [result objectForKey:@"T1348647853363"];
        if (result == nil) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
        else{
            for (NSDictionary *dic in result) {
                LHNewsModel *model = [LHNewsModel newsModelWithDic:dic];
                [self.dataModelArr addObject:model];
                [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.dataModelArr.count-1 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
            }
            [self.tableView.mj_footer endRefreshing];
        }
    } failure:^(NSError *error) {
        [self.tableView.mj_footer endRefreshing];
        
    }];
    self.count++;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataModelArr.count;
}

/** cell */
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LHNewsModel *model = self.dataModelArr[indexPath.row];
    return  [LHCellFactory cellWithTableView:tableView Model:model IndexPath:indexPath];
}
/** cell hight*/
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    LHNewsModel *model = self.dataModelArr[indexPath.row];
    return [LHCellFactory cellHightWithModel:model];
}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
