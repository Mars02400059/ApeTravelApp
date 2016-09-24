//
//  AZBaseButton.h
//  WJQ_ApeTravel
//
//  Created by dllo on 16/9/23.
//  Copyright © 2016年 Mars02400059. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AZBaseButton : UIButton

/// 判断按钮是否处于点击状态
@property (nonatomic, assign) BOOL click;
/// 没用的属性, 只是为了将代码收起来
@property (nonatomic, assign) BOOL clickTwo;
/// 判断按钮为哪个洲
@property (nonatomic, assign) NSNumber *number;

@end
