//
//  LHNewsModel.m
//  SimpleCellFactory
//
//  Created by apple on 16/5/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LHNewsModel.h"

@implementation LHNewsModel

+(instancetype)newsModelWithDic:(NSDictionary *)dic{
    LHNewsModel *model = [LHNewsModel new];
    [model setValuesForKeysWithDictionary:dic];
    return model;
    
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}
@end
