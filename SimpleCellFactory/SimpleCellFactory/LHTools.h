//
//  LHTools.h
//  SimpleCellFactory
//
//  Created by apple on 16/5/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, AnimationType) {
    Show,
    Hide
};

@interface LHTools : NSObject

/** 标题Lable  */
+(UILabel*)titleLableWithFrame:(CGRect)frame;

/** 子标题Lable*/
+(UILabel*)digestLableWithFrame:(CGRect)frame;

/** 跟帖数Lable*/
+(UILabel*)replyCountLableWithFrame:(CGRect)frame;

/** 跟帖数Lable宽度*/
+(void)replyCountLableWidth:(NSNumber*)data Height:(CGFloat)height font:(CGFloat)font view:(UILabel*)lable;

/** 时间Lable*/
+(UILabel*)timeLableWithFrame:(CGRect)frame;

/** 时间戳转日期*/
+(NSString*)timeStampToDate:(NSNumber*)time;
@end
