//
//  AZBaseModel.m
//  WJQ_ApeTravelApp
//
//  Created by dllo on 16/9/20.
//  Copyright © 2016年 Mars02400059. All rights reserved.
//

#import "AZBaseModel.h"

@implementation AZBaseModel

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (AZBaseModel *)AZBaseModelWithDic:(NSDictionary *)dic {
    return [[self alloc] initWithDic:dic];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

}
//
- (id)valueForUndefinedKey:(NSString *)key {
    return nil;
}


@end
