//
//  AZBaseButton.m
//  WJQ_ApeTravel
//
//  Created by dllo on 16/9/23.
//  Copyright © 2016年 Mars02400059. All rights reserved.
//

#import "AZBaseButton.h"

@interface AZBaseButton ()



@end

@implementation AZBaseButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.click = YES;
        self.clickTwo = YES;
        self.width = 55.f;
        self.height = 30.f;
        self.titleLabel.font = [UIFont systemFontOfSize:15.f];
        [self setTitleColor:[UIColor colorWithWhite:0.476 alpha:1.000] forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setBackgroundImage:[UIImage imageNamed:@"气泡"]forState:UIControlStateNormal];
    
    }
    return self;
}




@end
