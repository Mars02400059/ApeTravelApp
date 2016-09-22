//
//  HomeThreeTableViewCell.m
//  WJQ_ApeTravel
//
//  Created by dllo on 16/9/22.
//  Copyright © 2016年 Mars02400059. All rights reserved.
//

#import "HomeThreeTableViewCell.h"
#import "HomeModel.h"

@interface HomeThreeTableViewCell ()
<
UIScrollViewDelegate
>


@property (nonatomic, retain) UILabel *columnLabel;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UILabel *subjectLabel;
@property (nonatomic, retain) UIScrollView *subitemsScrollView;
@property (nonatomic, retain) UIImageView *icon_urlImageView;

@end

@implementation HomeThreeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 添加子视图
        [self createSubView];
    }
    return self;
}

- (void)createSubView {
  
    // 新闻类型
    self.columnLabel = [UILabel new];
    _columnLabel.font = [UIFont systemFontOfSize:14.f];
    _columnLabel.textColor = [UIColor whiteColor];
    _columnLabel.backgroundColor = [UIColor colorWithRed:0.29 green:0.75 blue:0.47 alpha:1.000];
    _columnLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_columnLabel];
 
    
    // 新闻标题
    self.titleLabel = [UILabel new];
    _titleLabel.numberOfLines = 0;
    _titleLabel.font = [UIFont systemFontOfSize:20.f];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_titleLabel];
    
    // 新闻详情
    self.subjectLabel = [UILabel new];
    _subjectLabel.numberOfLines = 0;
    _subjectLabel.font = [UIFont systemFontOfSize:15.f];
    _subjectLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_subjectLabel];
    
    
    self.subitemsScrollView = [UIScrollView new];
    _subitemsScrollView.showsVerticalScrollIndicator = NO;
    _subitemsScrollView.showsHorizontalScrollIndicator = NO;
    _subitemsScrollView.delegate = self;
    [self.contentView addSubview:_subitemsScrollView];
    
    // 下方图片
    self.icon_urlImageView = [UIImageView new];
    [self.contentView addSubview:_icon_urlImageView];
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
