//
//  SlideCollectionViewCell.m
//  WJQ_ApeTravel
//
//  Created by dllo on 16/9/22.
//  Copyright © 2016年 Mars02400059. All rights reserved.
//

#import "SlideCollectionViewCell.h"
#import "HomeSlideModel.h"

@interface SlideCollectionViewCell ()

@property (nonatomic, strong) UIImageView *slideImageView;

@end
@implementation SlideCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.slideImageView = [UIImageView new];
        [self.contentView addSubview:_slideImageView];
        
    }
    return self;
}

- (void)setHomeSlideModel:(HomeSlideModel *)homeSlideModel {
    _homeSlideModel = homeSlideModel;
    NSURL *url = [NSURL URLWithString:homeSlideModel.photo];
    [_slideImageView sd_setImageWithURL:url];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _slideImageView.frame = self.contentView.frame;
}

@end
