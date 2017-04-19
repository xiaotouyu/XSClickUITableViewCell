//
//  XSHeaderView.h
//  XSClickUITableViewCell
//
//  Created by dashuios126 on 2017/4/19.
//  Copyright © 2017年 dashuios126. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XSSectionModel;

typedef void(^HeaderViewClickedBack)(BOOL);


@interface XSHeaderView : UITableViewHeaderFooterView
@property (nonatomic, copy) HeaderViewClickedBack HeaderClickedBack;
@property (nonatomic, strong) XSSectionModel *sectionModel;

@end
