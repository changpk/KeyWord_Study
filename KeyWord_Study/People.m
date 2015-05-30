//
//  People.m
//  KeyWord_Study
//
//  Created by changpengkai on 15/5/30.
//  Copyright (c) 2015年 com.pengkaichang. All rights reserved.
//

#import "People.h"

@implementation People

/*
- (instancetype)initWithDictionary:(NSDictionary *)dic {
    
    if (self = [super init]) {
        
        self.name = dic[@"name"];
        self.age = [dic[@"age"] integerValue];
        self.man = [dic[@"man"] boolValue];
    }
    
    return self;
}
*/

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    if ([key isEqualToString:@"id"]) {
        
        NSLog(@"子类自己解决");
    }else {
        
        [super setValue:value forKey:key];
    }
}

@end
