//
//  Person.h
//  runtime
//
//  Created by 张豪 on 2017/12/11.
//  Copyright © 2017年 张豪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCoding>
@property(nonatomic,copy) NSString* name;
@property(nonatomic,assign) NSInteger age;
@property(nonatomic,strong) Person *son;
+ (void)run;
+ (void)study;
@end
