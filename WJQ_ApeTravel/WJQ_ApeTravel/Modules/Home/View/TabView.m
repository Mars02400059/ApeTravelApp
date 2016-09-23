//
//  TabView.m
//  WJQ_ApeTravel
//
//  Created by dllo on 16/9/22.
//  Copyright © 2016年 Mars02400059. All rights reserved.
//

#import "TabView.h"

@interface TabView ()

@property (nonatomic, strong) UIImageView *icon_urlImageView;
@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation TabView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.icon_urlImageView = [[UIImageView alloc] init];
        [self addSubview:_icon_urlImageView];
        
        self.nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:15.f];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_nameLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.bounds.size.width;
    _icon_urlImageView.width = width / 2;
    _icon_urlImageView.height = width / 2;
    _icon_urlImageView.center = CGPointMake(width / 2, width / 2 - 15);
    
    _nameLabel.width = self.width;
    _nameLabel.height = 20;
    _nameLabel.center = CGPointMake(width / 2, width / 2 + 25);
    
}

- (void)setTabDic:(NSDictionary *)tabDic {
    _tabDic = tabDic;
    NSURL *url = [NSURL URLWithString:[tabDic objectForKey:@"icon_url"]];
    [_icon_urlImageView sd_setImageWithURL:url];
    _nameLabel.text = [tabDic objectForKey:@"name"];
}

@end
