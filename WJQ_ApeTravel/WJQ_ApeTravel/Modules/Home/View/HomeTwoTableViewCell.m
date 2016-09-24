//
//  HomeTwoTableViewCell.m
//  WJQ_ApeTravel
//
//  Created by dllo on 16/9/22.
//  Copyright © 2016年 Mars02400059. All rights reserved.
//

#import "HomeTwoTableViewCell.h"
#import "HomeModel.h"

@interface HomeTwoTableViewCell ()

/// 占位, 供观赏
@property (nonatomic, strong) UIView *view;

@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UILabel *columnLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subjectLabel;
@property (nonatomic, strong) UIImageView *icon_urlImageView;
@property (nonatomic, strong) UIImageView *hahaImageView;

@end

@implementation HomeTwoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 添加子视图

        [self createSubView];
    }
    return self;
}

- (void)createSubView {
    
    self.view = [UIView new];
    _view.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.000];
    [self.contentView addSubview:_view];
    
    // 新闻图片
    self.coverImageView = [UIImageView new];
    [self.contentView addSubview:_coverImageView];
    // 播放按钮
    self.hahaImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"播放按钮"]];
    _hahaImageView.layer.cornerRadius = 25.f;
    _hahaImageView.alpha = 0.95f;
    _hahaImageView.backgroundColor = [UIColor whiteColor];
    [_coverImageView addSubview:_hahaImageView];
    
    // 新闻类型
    self.columnLabel = [UILabel new];
    _columnLabel.font = [UIFont systemFontOfSize:14.f];
    _columnLabel.textColor = [UIColor whiteColor];
    _columnLabel.textAlignment = NSTextAlignmentCenter;
    _columnLabel.backgroundColor = [UIColor colorWithRed:0.29 green:0.75 blue:0.47 alpha:1.000];
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
    
    // 下方图片
    self.icon_urlImageView = [UIImageView new];
    [self.contentView addSubview:_icon_urlImageView];
    
}

- (void)setHomeModel:(HomeModel *)homeModel {
    _homeModel = homeModel;
    // 添加图片
    
    NSURL *cover = [NSURL URLWithString:homeModel.cover];
    [_coverImageView sd_setImageWithURL:cover];
    
    _columnLabel.text = homeModel.column;
    _titleLabel.text = homeModel.title;
    _titleLabel.height = 60.f;
    _subjectLabel.text = homeModel.subject;
    NSURL *icon_url = [NSURL URLWithString:homeModel.icon_url];
    [_icon_urlImageView sd_setImageWithURL:icon_url];
    
    
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.contentView.bounds.size.width;
    
    CGFloat viewHeight = 15.f;
    _view.frame = CGRectMake(0, 0, width, viewHeight);
    
    _coverImageView.frame = CGRectMake(0, viewHeight, width, width / 2 - 30);
    
    _hahaImageView.width = 50.f;
    _hahaImageView.height = 50.f;
    _hahaImageView.center = CGPointMake(_coverImageView.width / 2, _coverImageView.height / 2);
    
    _columnLabel.frame = CGRectMake(0, 25 + viewHeight, 90, 25);
    
    _titleLabel.frame = CGRectMake(0, 0, width - 100, 60);
    _titleLabel.center = CGPointMake(width / 2, width / 2 + 10 + viewHeight / 2);
    
    _subjectLabel.frame = CGRectMake(0, 0, width - 50, 50);
    _subjectLabel.center = CGPointMake(width / 2, width / 2 + 60 + viewHeight / 2);
    
    _icon_urlImageView.frame = CGRectMake(0, 0, 35, 35);
    _icon_urlImageView.center = CGPointMake(width / 2, width / 2 + 120 + viewHeight / 2);
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
