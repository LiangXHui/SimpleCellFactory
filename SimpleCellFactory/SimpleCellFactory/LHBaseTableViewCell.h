//
//  LHBaseTableViewCell.h
//  SimpleCellFactory
//
//  Created by apple on 16/5/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LHBaseTableViewCell : UITableViewCell

/** 小图片*/
@property(nonatomic,strong)UIImageView *titleImage;
/** 标题*/
@property(nonatomic,strong)UILabel *titleLable;
/** 简介*/
@property(nonatomic,strong)UILabel *digestLable;


-(void)getDataWithModel:(id)model;
@end
