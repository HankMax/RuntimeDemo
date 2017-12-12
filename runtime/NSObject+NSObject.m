//
//  NSObject+NSObject.m
//  runtime
//
//  Created by 张豪 on 2017/12/11.
//  Copyright © 2017年 张豪. All rights reserved.
//

#import "NSObject+NSObject.h"
#import <objc/message.h>

@implementation NSObject (NSObject)
char nameKey;
+ (void)load {
    Method m1 = class_getInstanceMethod([NSObject class], @selector(init));
    Method m2 = class_getInstanceMethod([NSObject class], @selector(zh_init));
    method_exchangeImplementations(m1, m2);
}

- (instancetype)zh_init {
    
    NSLog(@"创建一个类%@",[self description]);
    return [self zh_init];
}

- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, &nameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)name {
    return objc_getAssociatedObject(self, &nameKey);
}


@end
