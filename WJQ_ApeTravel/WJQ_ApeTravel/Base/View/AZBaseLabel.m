//
//  AZBaseLabel.m
//  WJQ_ApeTravel
//
//  Created by dllo on 16/9/23.
//  Copyright © 2016年 Mars02400059. All rights reserved.
//

#import "AZBaseLabel.h"

@implementation AZBaseLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 5.f;
        self.clipsToBounds = YES;
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.borderWidth = 2.f;
        self.backgroundColor = [UIColor colorWithRed:0.29 green:0.75 blue:0.47 alpha:1.000];
        
    }
    return self;
}

@end
