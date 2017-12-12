//
//  People.h
//  runtime
//
//  Created by 张豪 on 2017/12/12.
//  Copyright © 2017年 张豪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Book.h"
@interface People : NSObject
@property(nonatomic,copy) NSString *name;
@property(nonatomic,assign) NSInteger age;
@property(nonatomic,strong) Dog *dog;
@property(nonatomic,strong) NSArray<Book *> *books;


@end
