//
//  NSObject+JSONExtention.h
//  runtime
//
//  Created by 张豪 on 2017/12/12.
//  Copyright © 2017年 张豪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JSONExtention)
// 返回数组中都是什么类型的模型对象
- (NSString *)arrayObjectClass ;

-(void)setDic:(NSDictionary *)dic;
@end
