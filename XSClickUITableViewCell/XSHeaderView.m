//
//  XSHeaderView.m
//  XSClickUITableViewCell
//
//  Created by dashuios126 on 2017/4/19.
//  Copyright © 2017年 dashuios126. All rights reserved.
//

#import "XSHeaderView.h"
#import "XSSectionModel.h"

#define ScreenW  [UIScreen mainScreen].bounds.size.width

@interface XSHeaderView ()

@property (nonatomic,strong) UIImageView *directionImageView;
@end

@implementation XSHeaderView


- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {

        //初始化 一些控件
        [self setupItems];
    }
    return self;
}

- (void)setupItems{
    //右上角的箭头
    self.directionImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"brand_expand"]];
    self.directionImageView.frame = CGRectMake(ScreenW-30, (44-8)/2, 15, 8);
    [self.contentView addSubview:self.directionImageView];

    //btn覆盖header,相应点击
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 44)];
    button.backgroundColor = [UIColor clearColor];

    [self.contentView addSubview:button];
    [button addTarget:self action:@selector(headerClick:) forControlEvents:UIControlEventTouchUpInside];
    self.contentView.backgroundColor = [UIColor lightGrayColor];
    self.contentView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.contentView.layer.borderWidth = 0.5;
}

- (void)headerClick:(UIButton *)btn{

    self.sectionModel.isExpanded = !self.sectionModel.isExpanded;

    [UIView animateWithDuration:0.25 animations:^{

        if (!self.sectionModel.isExpanded) {

            self.directionImageView.transform = CGAffineTransformIdentity;

        }else{

            self.directionImageView.transform = CGAffineTransformMakeRotation(M_PI);
        }

    }];

    if (self.HeaderClickedBack) {

        self.HeaderClickedBack(self.sectionModel.isExpanded);
    }

    
}

- (void)setSectionModel:(XSSectionModel *)sectionModel{

    _sectionModel = sectionModel;

    self.textLabel.text = sectionModel.sectionTitle;

    if (!_sectionModel.isExpanded) {

        self.directionImageView.transform = CGAffineTransformIdentity;

    }else{

        self.directionImageView.transform = CGAffineTransformMakeRotation(M_PI);
    }
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
