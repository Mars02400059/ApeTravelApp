//
//  HomeOneTableViewCell.m
//  WJQ_ApeTravel
//
//  Created by dllo on 16/9/21.
//  Copyright © 2016年 Mars02400059. All rights reserved.
//

#import "HomeOneTableViewCell.h"
#import "HomeModel.h"

@interface HomeOneTableViewCell ()

/// 占位, 供观赏
@property (nonatomic, strong) UIView *view;

@property (nonatomic, strong) UIImageView *coverImageView;
/// 作者图片
@property (nonatomic, strong) UIImageView *picImageView;
/// 作者名字
@property (nonatomic, strong) UILabel *usernameLabel;
@property (nonatomic, strong) UILabel *columnLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subjectLabel;
@property (nonatomic, strong) UIImageView *icon_urlImageView;

@end

@implementation HomeOneTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
//        self.contentView.backgroundColor = [UIColor colorWithRed:0.407 green:0.987 blue:0.582 alpha:1.000];
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
    
    // 新闻类型
    self.columnLabel = [UILabel new];
    _columnLabel.font = [UIFont systemFontOfSize:14.f];
    _columnLabel.textColor = [UIColor whiteColor];
    _columnLabel.backgroundColor = [UIColor colorWithRed:0.29 green:0.75 blue:0.47 alpha:1.000];
    _columnLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_columnLabel];
    
    // 作者头像
    self.picImageView = [UIImageView new];
    _picImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    [_picImageView.layer setBorderWidth:1.5f];
    _picImageView.backgroundColor = [UIColor redColor];
    
    // 图片适应尺寸
    _picImageView.clipsToBounds = YES;
    _picImageView.layer.cornerRadius = 25.f;
    [self.contentView addSubview:_picImageView];
    
    // 作者名字
    self.usernameLabel = [UILabel new];
    _usernameLabel.textColor = [UIColor grayColor];
    _usernameLabel.font = [UIFont systemFontOfSize:12.f];
    _usernameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_usernameLabel];
    
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
    
#warning 图片字符串有问题, 需要进行剪切
    NSURL *cover = [NSURL URLWithString:homeModel.cover];
    [_coverImageView sd_setImageWithURL:cover];
    
    NSURL *pic = [NSURL URLWithString:[homeModel.author objectForKey:@"pic"]];
    [_picImageView sd_setImageWithURL:pic];

    _usernameLabel.text = [homeModel.author objectForKey:@"username"];
    
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
    //    CGFloat height = self.contentView.bounds.size.height;
#warning 图片尺寸需对应实际效果进行设置
    
    CGFloat viewHeight = 15.f;
    _view.frame = CGRectMake(0, 0, width, viewHeight);
    
    _coverImageView.frame = CGRectMake(0, viewHeight, width, width / 2 - 30);
    _columnLabel.frame = CGRectMake(0, 25 + viewHeight, 90, 25);
    
    _picImageView.center = CGPointMake(width / 2, width / 2 - 30 + viewHeight / 2);
    _picImageView.width = 50.f;
    _picImageView.height = 50.f;
    
    
    _usernameLabel.width = 70.f;
    _usernameLabel.height = 20.f;
    _usernameLabel.center = CGPointMake(width / 2, width / 2 + 10 + viewHeight / 2);

    _titleLabel.frame = CGRectMake(0, viewHeight, width - 100, 60);
    _titleLabel.center = CGPointMake(width / 2, width / 2 + 45 + viewHeight / 2);
    
#warning 文字自适应高度
    _subjectLabel.frame = CGRectMake(0, 0, width - 50, 50);
    _subjectLabel.center = CGPointMake(width / 2, width / 2 + 95 + viewHeight / 2);
    
    _icon_urlImageView.frame = CGRectMake(0, 0, 35, 35);
    _icon_urlImageView.center = CGPointMake(width / 2, width / 2 + 155 + viewHeight / 2);
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
