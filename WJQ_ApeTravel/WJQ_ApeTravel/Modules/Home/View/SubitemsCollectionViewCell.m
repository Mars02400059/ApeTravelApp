//
//  SubitemsCollectionViewCell.m
//  WJQ_ApeTravel
//
//  Created by dllo on 16/9/22.
//  Copyright © 2016年 Mars02400059. All rights reserved.
//

#import "SubitemsCollectionViewCell.h"

@interface SubitemsCollectionViewCell ()



@property (nonatomic, strong) UIImageView *item_coverImageView;

@property (nonatomic, strong) UILabel *item_nameLabel;

@property (nonatomic, strong) UILabel *item_addressLabel;

@end

@implementation SubitemsCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.layer.borderColor = [UIColor colorWithWhite:0.793 alpha:1.000].CGColor;
        [self.contentView.layer setBorderWidth:1.0f];
        self.contentView.layer.cornerRadius = 3.f;
        self.contentView.clipsToBounds = YES;
        
        [self createSubView];
    }
    return self;
}
// 子视图
- (void)createSubView {
    

    
    self.item_coverImageView = [UIImageView new];
    _item_coverImageView.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:_item_coverImageView];
    
    self.item_nameLabel = [UILabel new];
    _item_nameLabel.font = [UIFont systemFontOfSize:15.f];
    _item_nameLabel.numberOfLines = 0;
    [self.contentView addSubview:_item_nameLabel];
    
    self.item_addressLabel = [UILabel new];
    _item_addressLabel.font = [UIFont systemFontOfSize:15.f];
    _item_addressLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:_item_addressLabel];
    
}

- (void)setSubitemsDic:(NSDictionary *)subitemsDic {
    _subitemsDic = subitemsDic;
    NSURL *url = [NSURL URLWithString:[subitemsDic objectForKey:@"item_cover"]];
    [_item_coverImageView sd_setImageWithURL:url];
    
    _item_nameLabel.text = [subitemsDic objectForKey:@"item_name"];
    
    _item_addressLabel.text = [subitemsDic objectForKey:@"item_address"];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.contentView.bounds.size.width;
    _item_coverImageView.frame = CGRectMake(0, 0, width, 100);
    
    _item_nameLabel.frame = CGRectMake(5, 110, width - 5 - 10, 50);
    
    _item_addressLabel.frame = CGRectMake(20, 150, width - 40, 30);
}



@end
