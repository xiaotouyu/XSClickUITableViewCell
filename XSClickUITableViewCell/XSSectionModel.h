//
//  XSSectionModel.h
//  XSClickUITableViewCell
//
//  Created by dashuios126 on 2017/4/19.
//  Copyright © 2017年 dashuios126. All rights reserved.
//

#import <Foundation/Foundation.h>
@class XSCellModel;
@interface XSSectionModel : NSObject
/**
 头部
 */
@property (nonatomic, copy) NSString *sectionTitle;

/**
 是否展开  默认NO
 */
@property (nonatomic, assign) BOOL isExpanded;

/**
 cell的模型
 */
@property (nonatomic, strong) NSArray<XSCellModel *> *cellModels;


/**
 加载数据,可以根据实际需求定制

 */
+ (void)loadData:(void(^)(NSArray *models))finished;

@end
