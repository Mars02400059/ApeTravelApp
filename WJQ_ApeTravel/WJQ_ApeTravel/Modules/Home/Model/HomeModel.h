//
//  HomeModel.h
//  WJQ_ApeTravel
//
//  Created by dllo on 16/9/21.
//  Copyright © 2016年 Mars02400059. All rights reserved.
//

#import "AZBaseModel.h"

@interface HomeModel : AZBaseModel

/// 跳转的WebView
@property (nonatomic, copy) NSString *url;
/// 图片
@property (nonatomic, copy) NSString *cover;
/// 新闻类型 例:必看干货
@property (nonatomic, copy) NSString *column;
/// 新闻标题
@property (nonatomic, copy) NSString *title;
/// 新闻详情
@property (nonatomic, copy) NSString *subject;
/// 图片
@property (nonatomic, copy) NSString *icon_url;
/// cell种类
@property (nonatomic, assign) NSInteger type;
/// 装作者头像与名字
@property (nonatomic, retain) NSDictionary *author;


@end
