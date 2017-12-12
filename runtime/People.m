//
//  People.m
//  runtime
//
//  Created by 张豪 on 2017/12/12.
//  Copyright © 2017年 张豪. All rights reserved.
//

#import "People.h"
#import "NSObject+JSONExtention.h"
#import <objc/runtime.h>
@implementation People
@synthesize name;
@synthesize age;
@synthesize dog;
@synthesize books;

- (NSString *)arrayObjectClass {
    return @"Book";
}

@end
