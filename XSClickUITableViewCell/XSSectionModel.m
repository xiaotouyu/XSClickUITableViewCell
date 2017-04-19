//
//  XSSectionModel.m
//  XSClickUITableViewCell
//
//  Created by dashuios126 on 2017/4/19.
//  Copyright © 2017年 dashuios126. All rights reserved.
//

#import "XSSectionModel.h"
#import "XSCellModel.h"

@implementation XSSectionModel


/**
 加载数据  这是测试用的,使用的是plist,可以根据具体的需求定制

 @param finished 数据完成的回调
 */
+ (void)loadData:(void(^)(NSArray *models))finished{


    NSMutableArray *dataArr = [NSMutableArray array];

    NSString *path = [[NSBundle mainBundle] pathForResource:@"headerList.plist" ofType:nil];
    NSDictionary *diaryList = [NSDictionary dictionaryWithContentsOfFile:path];


    NSArray *keyVal = diaryList.allKeys;
    NSArray *valueVal = diaryList.allValues;

    NSInteger keycount = keyVal.count;

    for (NSInteger i = 0; i<keycount ; i++) {

        XSSectionModel *sectionModel = [[XSSectionModel alloc] init];
        sectionModel.isExpanded = NO;
        sectionModel.sectionTitle = keyVal[i];

        NSMutableArray *cellArr = [NSMutableArray array];

        NSInteger valuCount = ((NSArray *)valueVal[i]).count;

        for (NSInteger j = 0; j<valuCount; j++) {

            XSCellModel *cellModel = [[XSCellModel alloc] init];
            cellModel.title = valueVal[i][j];
            [cellArr addObject:cellModel];

        }

        sectionModel.cellModels = cellArr;
        [dataArr addObject:sectionModel];

    }

    finished(dataArr);
    
}
@end
