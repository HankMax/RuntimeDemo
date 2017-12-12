//
//  Person.m
//  runtime
//
//  Created by 张豪 on 2017/12/11.
//  Copyright © 2017年 张豪. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
@implementation Person
@synthesize name;
@synthesize age;
@synthesize son;
+ (void)run {
    NSLog(@"跑");
}
+ (void)study{
    NSLog(@"学习");
}

- (NSString *)description {
    return [NSString stringWithFormat:@"\nname:%@\nage:%ld\nson:{%@}",name,(long)age,son];
}

//归档
- (void)encodeWithCoder:(NSCoder *)aCoder {
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([Person class], &outCount);
    for (int i=0; i < outCount; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        id n = [self valueForKey:key];
        [aCoder encodeObject:n forKey:key];
    }
    free(ivars);
}
//解档
- (instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([Person class], &outCount);
    for (int i=0; i < outCount; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        id n = [aDecoder decodeObjectForKey:key];
        [self setValue:n forKey:key];
    }
    free(ivars);
    return self;
}

@end
