//
//  XSTableViewCell.m
//  XSClickUITableViewCell
//
//  Created by dashuios126 on 2017/4/19.
//  Copyright © 2017年 dashuios126. All rights reserved.
//

#import "XSTableViewCell.h"
#import "XSCellModel.h"
@implementation XSTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCellModel:(XSCellModel *)cellModel{

    _cellModel = cellModel;

    self.textLabel.text = cellModel.title;
    
}

@end
