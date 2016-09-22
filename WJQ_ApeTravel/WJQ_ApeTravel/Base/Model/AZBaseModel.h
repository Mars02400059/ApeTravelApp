//
//  AZBaseModel.h
//  WJQ_ApeTravelApp
//
//  Created by dllo on 16/9/20.
//  Copyright © 2016年 Mars02400059. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AZBaseModel : NSObject

/// 基类的初始化方法
- (instancetype)initWithDic:(NSDictionary *)dic;

/// 基类构造器方法

+ (AZBaseModel *)AZBaseModelWithDic:(NSDictionary *)dic;

@end
