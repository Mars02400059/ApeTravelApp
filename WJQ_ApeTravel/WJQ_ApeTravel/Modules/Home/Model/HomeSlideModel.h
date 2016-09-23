//
//  HomeSlideModel.h
//  WJQ_ApeTravel
//
//  Created by dllo on 16/9/22.
//  Copyright © 2016年 Mars02400059. All rights reserved.
//

#import "AZBaseModel.h"

@interface HomeSlideModel : AZBaseModel

/// 跳转WebView
@property (nonatomic, copy) NSString *url;
/// 轮播图图片
@property (nonatomic, copy) NSString *photo;

@end
