//
//  XSTableViewController.m
//  XSClickUITableViewCell
//
//  Created by dashuios126 on 2017/4/19.
//  Copyright © 2017年 dashuios126. All rights reserved.
//

#import "XSTableViewController.h"
#import "XSCellModel.h"
#import "XSSectionModel.h"
#import "XSHeaderView.h"
#import "XSTableViewCell.h"


@interface XSTableViewController ()
@property (nonatomic,strong) NSArray<XSSectionModel *> *dataSource;

@end

@implementation XSTableViewController

- (NSArray *)dataSource{

    if (!_dataSource) {

        _dataSource = [[NSArray alloc] init];
    }

    return _dataSource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [XSSectionModel loadData:^(NSArray *models) {

        self.dataSource = models;

    }];

    [self.tableView registerClass:[XSTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[XSHeaderView class] forHeaderFooterViewReuseIdentifier:@"header"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource[section].isExpanded ? self.dataSource[section].cellModels.count : 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.cellModel = self.dataSource[indexPath.section].cellModels[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    XSHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    headerView.sectionModel = self.dataSource[section];
    headerView.HeaderClickedBack = ^(BOOL isExpand) {

        [tableView reloadSections:[[NSIndexSet alloc] initWithIndex:section] withRowAnimation:UITableViewRowAnimationAutomatic];
    };
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"%ld",indexPath.row);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
