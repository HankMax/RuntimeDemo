//
//  main.m
//  runtime
//
//  Created by 张豪 on 2017/12/11.
//  Copyright © 2017年 张豪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "NSObject+NSObject.h"
#import "NSObject+JSONExtention.h"
#import <objc/runtime.h>
#import "People.h"

void exchangeMethod(void);

void exchangeSystemMethod(void);

void addProperty(void);

void getClassIvars(void);

void encoding(void);

void jsonExchange(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        
        [Person run];
        [Person study];
        
        //方法交换
        exchangeMethod();
        
        //拦截系统方法
        exchangeSystemMethod();
        
        //添加属性
        addProperty();
        
        //获得类的属性
        getClassIvars();
        
        //归档解档
        encoding();
        
        //字典转模型
        jsonExchange();
        
    }
    return 0;
}

void exchangeMethod() {
    Method m1 = class_getClassMethod([Person class], @selector(run));
    Method m2 = class_getClassMethod([Person class], @selector(study));
    method_exchangeImplementations(m1, m2);
    NSLog(@"-----交换方法----");
    [Person run];
    [Person study];
}

void exchangeSystemMethod(){
    Person *p = [[Person alloc] init];
    NSLog(@"%@", p);
}

void addProperty(){
    NSObject *obj = [[NSObject alloc] init];
    [obj setName:@"Objcet"];
    NSLog(@"%@", obj.name);
}

void getClassIvars(){
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([Person class], &outCount);
    
    // 遍历所有成员变量
    for (int i = 0; i < outCount; i++) {
        // 取出i位置对应的成员变量
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        NSLog(@"成员变量名：%s 成员变量类型：%s",name,type);
    }
    // 注意释放内存！
    free(ivars);
}

void encoding(){
    Person *p = [[Person alloc] init];
    [p setName:@"Father"];
    [p setAge:35];
    Person *son = [[Person alloc] init];
    [son setName:@"son"];
    [son setAge:12];
    [p setSon:son];
    
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:p];
    
    Person *p2 = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSLog(@"%@", p2);
}

void jsonExchange(){
    NSDictionary *dic = @{
                          @"name":@"Hank",
                          @"age":@12,
                          @"money":@54.24,
                          @"dog":@{@"name":@"doge",@"age":@2},
                          @"books":@[
                                    @{@"name":@"iOS developer",@"price":@24.24},
                                     @{@"name":@"runtime",@"price":@34.5}
                                    ]
                          };
    People *people = [[People alloc] init];
    [people setDic:dic];
    NSLog(@"%@", people);
}
