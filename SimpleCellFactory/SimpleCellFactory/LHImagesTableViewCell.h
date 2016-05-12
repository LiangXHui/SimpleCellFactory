//
//  LHImagesTableViewCell.h
//  SimpleCellFactory
//
//  Created by apple on 16/5/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHBaseTableViewCell.h"

@interface LHImagesTableViewCell : LHBaseTableViewCell

/** 三个图片*/

@property(nonatomic,strong)UIImageView *imageCenter;
@property(nonatomic,strong)UIImageView *imageRight;


/** 跟帖数*/
@property(nonatomic,strong)UILabel *replyCountLable;

@end
