//
//  LHOneImageTableViewCell.m
//  SimpleCellFactory
//
//  Created by apple on 16/5/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LHOneImageTableViewCell.h"

/** 图片与文字以及边线的间距*/
#define ONEIMAGESPACE 10

/** 图片与屏幕宽度的比例*/
#define IMAGESCALE 0.25

@implementation LHOneImageTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatUI];
    }
    
    return self;
}

-(void)creatUI{
    
    self.titleImage = [[UIImageView alloc]initWithFrame:CGRectMake(ONEIMAGESPACE, ONEIMAGESPACE, UISCREENWIDTH*IMAGESCALE, ONEIMAGECELLHEIGHT-2*ONEIMAGESPACE)];
    [self addSubview:self.titleImage];
    
    self.titleLable = [LHTools titleLableWithFrame:CGRectMake(1.5*ONEIMAGESPACE+UISCREENWIDTH*IMAGESCALE, ONEIMAGESPACE, UISCREENWIDTH*0.7, ONEIMAGECELLHEIGHT*0.3)];
    [self addSubview:self.titleLable];
    
    self.digestLable = [LHTools digestLableWithFrame:CGRectMake(1.5*ONEIMAGESPACE+UISCREENWIDTH*IMAGESCALE, ONEIMAGESPACE+ONEIMAGECELLHEIGHT*0.3, UISCREENWIDTH*0.7, ONEIMAGECELLHEIGHT*0.4)];
    [self addSubview:self.digestLable];
    
    
    self.replyCountLable = [LHTools replyCountLableWithFrame:CGRectMake(UISCREENWIDTH-50, ONEIMAGESPACE+ONEIMAGECELLHEIGHT*0.6, 40, 20)];
    [self addSubview:self.replyCountLable];
    
}




-(void)getDataWithModel:(id)model{
    
    LHNewsModel *newsModel = (LHNewsModel*)model;
    
    [self.titleImage sd_setImageWithURL:[NSURL URLWithString:newsModel.imgsrc] placeholderImage:nil];
    self.titleLable.text = newsModel.title;
    self.digestLable.text = newsModel.digest;
    if ([newsModel.skipType  isEqual: @"special"]) {
        self.replyCountLable.text = @"专题";
        self.replyCountLable.textColor = [UIColor redColor];
    }
    else if ([newsModel.skipType isEqual:@"live"]){
        self.replyCountLable.text = @"直播";
        self.replyCountLable.textColor = [UIColor blueColor];
    }
    else{
        [LHTools replyCountLableWidth:newsModel.replyCount Height:20 font:12 view:self.replyCountLable];
        self.replyCountLable.textColor = [UIColor grayColor];
    }
    
}

@end
