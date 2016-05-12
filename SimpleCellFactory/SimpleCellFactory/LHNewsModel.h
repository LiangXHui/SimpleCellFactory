//
//  LHNewsModel.h
//  SimpleCellFactory
//
//  Created by apple on 16/5/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHNewsModel : NSObject

/** 新闻ID*/
@property(nonatomic,strong)NSString *postid;
/** webView界面*/
@property(nonatomic,strong)NSString *url_3w;
/** 关注数*/
@property(nonatomic,strong)NSNumber *votecount;
/** 跟帖数*/
@property(nonatomic,strong)NSNumber *replyCount;
/** 新闻长标题*/
@property(nonatomic,strong)NSString *ltitle;
/** 新闻简介*/
@property(nonatomic,strong)NSString *digest;
/** 不详*/
@property(nonatomic,strong)NSString *url;
/** postid*/
@property(nonatomic,strong)NSString *docid;
/** 新闻标题*/
@property(nonatomic,strong)NSString *title;
/** 不详*/
@property(nonatomic,strong)NSString *TAGS;
/** 新闻来源*/
@property(nonatomic,strong)NSString *source;
/** 新闻时间*/
@property(nonatomic,strong)NSString *Imodify;
/** 不详*/
@property(nonatomic,strong)NSNumber *priority;
/** 评论信息标识(新闻类型标识)*/
@property(nonatomic,strong)NSString *boardid;
/** 新闻图片*/
@property(nonatomic,strong)NSString *imgsrc;
/** 不详*/
@property(nonatomic,strong)NSString *subtitle;
/** 新闻发生时间*/
@property(nonatomic,strong)NSString *ptime;
/** 不详*/
@property(nonatomic,strong)NSString *TAG;

/** 专题新闻特有属性*/

/** 专题类型*/
@property(nonatomic,strong)NSString *skipType;
/** 专题标识符*/
@property(nonatomic,strong)NSString *specialID;
/** 专题标识符*/
@property(nonatomic,strong)NSString *skipID;
/** 多图数组*/
@property(nonatomic,strong)NSArray *imgextra;
/** 不详*/
@property(nonatomic,assign)BOOL hasCover;
/** 不详*/
@property(nonatomic,strong)NSArray *ads;
/** --*/
@property(nonatomic,strong)NSNumber *imgType;
/** --*/
@property(nonatomic,strong)NSString *photosetID;

+(instancetype)newsModelWithDic:(NSDictionary*)dic;
@end
