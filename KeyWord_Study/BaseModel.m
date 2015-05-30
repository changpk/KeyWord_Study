//
//  BaseModel.m
//  KeyWord_Study
//
//  Created by changpengkai on 15/5/30.
//  Copyright (c) 2015年 com.pengkaichang. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

- (instancetype)initWithDictionary:(NSDictionary *)dic {
    
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

// 子类处理异常
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    // 基类里面去实现
    NSLog(@"Undefined Key: %@", key);
}

@end
