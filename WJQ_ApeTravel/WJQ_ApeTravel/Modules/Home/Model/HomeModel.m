//
//  HomeModel.m
//  WJQ_ApeTravel
//
//  Created by dllo on 16/9/21.
//  Copyright © 2016年 Mars02400059. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel

- (void)setCover:(NSString *)cover {
    NSMutableString *str = [NSMutableString stringWithString:cover];
    [str replaceOccurrencesOfString:@"webp" withString:@"jpg" options:NSCaseInsensitiveSearch range:NSMakeRange(0, str.length)];
    _cover = str;
}



@end
