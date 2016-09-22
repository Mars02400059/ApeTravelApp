//
//  HomeThreeTableViewCell.m
//  WJQ_ApeTravel
//
//  Created by dllo on 16/9/22.
//  Copyright © 2016年 Mars02400059. All rights reserved.
//

#import "HomeThreeTableViewCell.h"
#import "HomeModel.h"
#import "SubitemsCollectionViewCell.h"

static NSString *const collectionViewCell = @"cell";
@interface HomeThreeTableViewCell ()
<
UICollectionViewDelegate,
UICollectionViewDataSource
>


@property (nonatomic, retain) UILabel *columnLabel;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UILabel *subjectLabel;
@property (nonatomic, retain) UICollectionView *subitemsCollectionView;
@property (nonatomic, retain) UIImageView *icon_urlImageView;

/// 滑动视图存数据数组
@property (nonatomic, retain) NSMutableArray *subitemsArray;

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
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(150, 180);
    flowLayout.minimumLineSpacing = 15.f;
    flowLayout.minimumInteritemSpacing = 0.f;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    self.subitemsCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _subitemsCollectionView.showsVerticalScrollIndicator = NO;
    _subitemsCollectionView.showsHorizontalScrollIndicator = NO;
    _subitemsCollectionView.delegate = self;
    _subitemsCollectionView.dataSource = self;
    _subitemsCollectionView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_subitemsCollectionView];
    self.subitemsArray = [NSMutableArray array];
    [_subitemsCollectionView registerClass:[SubitemsCollectionViewCell class] forCellWithReuseIdentifier:collectionViewCell];
    

    
#warning 手动添加需要清除

    
    // 下方图片
    self.icon_urlImageView = [UIImageView new];
    [self.contentView addSubview:_icon_urlImageView];
}

- (void)setHomeModel:(HomeModel *)homeModel {
    _homeModel = homeModel;
    // 添加图片
    
#warning 图片字符串有问题, 需要进行剪切
    
    _columnLabel.text = homeModel.column;
    _titleLabel.text = homeModel.title;
    
    _subjectLabel.text = homeModel.subject;
    
    [self.subitemsArray addObjectsFromArray:homeModel.subitems];
    
    [_subitemsCollectionView reloadData];
    
    NSURL *icon_url = [NSURL URLWithString:homeModel.icon_url];
    [_icon_urlImageView sd_setImageWithURL:icon_url];
    
  
}

#pragma mark - 横向滑动图

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _subitemsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

        SubitemsCollectionViewCell *cell = [_subitemsCollectionView dequeueReusableCellWithReuseIdentifier:collectionViewCell forIndexPath:indexPath];
        
        cell.subitemsDic = _subitemsArray[indexPath.row];
        
        return cell;

    
}



- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.contentView.bounds.size.width;
    //    CGFloat height = self.contentView.bounds.size.height;

    _columnLabel.frame = CGRectMake(0, 20, 80, 25);
    
    _titleLabel.frame = CGRectMake(0, 0, width - 90, 50);
    _titleLabel.center = CGPointMake(width / 2, 75);

    _subjectLabel.frame = CGRectMake(0, 0, width - 40, 50);
    _subjectLabel.center = CGPointMake(width / 2, 130);
    
    _subitemsCollectionView.frame = CGRectMake(0, 160, width, 180);
    _subitemsCollectionView.contentSize = CGSizeMake(_subitemsCollectionView.bounds.size.width * 2, 0);
    
    _icon_urlImageView.frame = CGRectMake(0, 0, 35, 35);
    _icon_urlImageView.center = CGPointMake(width / 2, 380);
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
