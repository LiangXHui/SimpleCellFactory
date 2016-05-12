//
//  LHOneBigImageTableViewCell.m
//  SimpleCellFactory
//
//  Created by apple on 16/5/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LHOneBigImageTableViewCell.h"

/** 图片与文字以及边线的间距*/
#define ONEBIGIMAGESPACE 10

/** 图片占据Cell高度的比例*/
#define BIGIMAGESCALE 0.65

@implementation LHOneBigImageTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatUI];
    }
    return self;
}

-(void)creatUI{
    
    self.titleImage = [[UIImageView alloc]initWithFrame:CGRectMake(ONEBIGIMAGESPACE, ONEBIGIMAGESPACE, UISCREENWIDTH-2*ONEBIGIMAGESPACE, ONEBIGIMAGECELLHEIGHT*BIGIMAGESCALE)];
    [self addSubview:self.titleImage];
    
    self.titleLable = [LHTools titleLableWithFrame:CGRectMake(ONEBIGIMAGESPACE, ONEBIGIMAGECELLHEIGHT*BIGIMAGESCALE+ONEBIGIMAGESPACE*1.5, UISCREENWIDTH-2*ONEBIGIMAGESPACE, 20)];
    [self addSubview:self.titleLable];
    
    self.digestLable = [LHTools digestLableWithFrame:CGRectMake(ONEBIGIMAGESPACE, ONEBIGIMAGECELLHEIGHT*BIGIMAGESCALE+ONEBIGIMAGESPACE*1.5+25, UISCREENWIDTH-2*ONEBIGIMAGESPACE, 30)];
    [self addSubview:self.digestLable];
    
    self.replyCountLable = [LHTools replyCountLableWithFrame:CGRectMake(0, ONEBIGIMAGECELLHEIGHT*BIGIMAGESCALE+ONEBIGIMAGESPACE*1.5+45, 0, 20)];
    [self addSubview:self.replyCountLable];
}


-(void)getDataWithModel:(id)model{
    
    LHNewsModel *newsModel = (LHNewsModel*)model;
    [self.titleImage sd_setImageWithURL:[NSURL URLWithString:newsModel.imgsrc] placeholderImage:nil];
    
    self.titleLable.text = newsModel.title;
    
    self.digestLable.text = newsModel.digest;
    
    [LHTools replyCountLableWidth:newsModel.replyCount Height:20 font:12 view:self.replyCountLable];
    
}

@end
