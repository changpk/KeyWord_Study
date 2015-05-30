//
//  ViewController.m
//  KeyWord_Study
//
//  Created by changpengkai on 15/5/30.
//  Copyright (c) 2015年 com.pengkaichang. All rights reserved.
//

#import "ViewController.h"
#import "People.h"

void simple_va_func(int i,...);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    simple_va_func(100);
}

// @encode的用法
- (void)reserverEncode {
    
    NSNumber *number_1 = [NSNumber numberWithInteger:10];
    
    // obicType 能获得数据的类型的ASCII码用C语言字符串表示
    const char * numberType = [number_1 objCType];
    
    // 获得数据类型的C语言字符串(__unused 告诉编译器，这个变量不会用到，不用发警告)
    __unused char * dataPatter = @encode(NSInteger);
    
    // 比较数据类型
    if (strcmp(numberType, @encode(NSInteger))) {
        
        NSLog(@"数据类型为NSInteger");
    }
    
    
    // 用途场景：\
    把一些数值-->NSNumber,放到NSDictionary里面 \
    从NSDictonary里面取出来，要知道数据的类型
    
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         [NSNumber numberWithBool:YES],@"key1",
                         [NSNumber numberWithDouble:1.00f],@"key2",
                         [NSNumber numberWithInt:1],@"key3",
                         [NSNumber numberWithFloat:33.0f], @"key4", nil];
    
    for(NSString *key in dic){
        
       // valueForKey 和 objectForkey的区别链接http://www.360doc.com/content/15/0130/21/20918780_445084641.shtml \
        valueForKey 是objectForKey的封装，是KVC的基础；valueForKey的内容是调用objecForKey
        id value = [dic objectForKey:key];
        if([value isKindOfClass:[NSNumber class]]){
            const char * pObjCType = [((NSNumber*)value) objCType];
            if (strcmp(pObjCType, @encode(int))  == 0) {
                NSLog(@"字典中key=%@的值是int类型,值为%d",key,[value intValue]);
            }
            if (strcmp(pObjCType, @encode(float)) == 0) {
                NSLog(@"字典中key=%@的值是float类型,值为%f",key,[value floatValue]);
            }
            if (strcmp(pObjCType, @encode(double))  == 0) {
                NSLog(@"字典中key=%@的值是double类型,值为%f",key,[value doubleValue]);
            }
            if (strcmp(pObjCType, @encode(BOOL)) == 0) {
                NSLog(@"字典中key=%@的值是bool类型,值为%i",key,[value boolValue]);
            }
        }
        
    }
}

// KVC的简单用法
- (void)kvcOptionExample {
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         [NSNumber numberWithBool:NO],@"man",
                         [NSNumber numberWithInteger:1.00],@"age",
                         @"kkk",@"name", nil];
    
    People *people = [[People alloc]initWithDictionary:dic];
    
    // 通过set方法命名，依然可以获取到值
    NSLog(@"kvc is %@",[people valueForKey:@"name"]);
}

// 定义一个简单的C函数，参数个数是可变的
void simple_va_func(int i,...) {
    
    // va_list所定义变量为字符指针:typedef char * va_list;
    va_list arg_ptr;
    
    int j = 0,k = 0;
    
    // VA_START宏，获取可变参数列表的第一个参数的地址（ap是类型为va_list的指针，v是可变参数最左边的参数）
    va_start(arg_ptr, i);
    
    // VA_ARG宏，获取可变参数的当前参数，返回指定类型并将指针指向下一参数（t参数描述了当前参数的类型）
    j = va_arg(arg_ptr, int);
    
    k = va_arg(arg_ptr, int);
    
    // VA_END宏，清空va_list可变参数列表
    va_end(arg_ptr);
    
    printf("%d %d %d\n",i ,j,k);
}

@end
