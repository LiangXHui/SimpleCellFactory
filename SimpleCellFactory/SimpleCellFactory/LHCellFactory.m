//
//  LHCellFactory.m
//  SimpleCellFactory
//
//  Created by apple on 16/5/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LHCellFactory.h"

@implementation LHCellFactory

+(LHBaseTableViewCell *)cellWithTableView:(UITableView *)tableView Model:(id)model IndexPath:(NSIndexPath *)indexPath{
    return  [self cellWithTableView:tableView Model:model IndexPath:indexPath Type:[self cellTypeWithModel:model]];
}

+(CGFloat)cellHightWithModel:(id)model{
    return [self cellHightWithModel:model Type:[self cellTypeWithModel:model]];
}

+(CellType)cellTypeWithModel:(id)model{
    
    LHNewsModel *newsModel = (LHNewsModel*)model;
    if (newsModel.imgType)                                          return NewsOneBigImageCell;
    else if (newsModel.imgextra)                                    return NewsImagesCell;
    else if ([newsModel.skipType isEqual:@"special"])               return NewsOneImageCellSpecial;
    else                                                            return NewsOneImageCell;
    
}

+(LHBaseTableViewCell *)cellWithTableView:(UITableView *)tableView Model:(id)model IndexPath:(NSIndexPath *)indexPath Type:(CellType)type{
    LHBaseTableViewCell *result = nil;
    switch (type) {
        case NewsOneImageCell:
            result = [tableView dequeueReusableCellWithIdentifier:NEWSONEIMAGECELL];
            break;
        case NewsOneBigImageCell:
            result = [tableView dequeueReusableCellWithIdentifier:NEWSONEBIGIMAGECELL];
            break;
        case NewsImagesCell:
            result = [tableView dequeueReusableCellWithIdentifier:NEWSIMAGESCELL];
            break;
        case NewsOneImageCellSpecial:
            result = [tableView dequeueReusableCellWithIdentifier:NEWSONEIMAGECELLSPECIAL];
            break;
    }
    
    [result getDataWithModel:model];
    return result;
}

+(CGFloat)cellHightWithModel:(id)model Type:(CellType)type{
    
    switch (type) {
        case NewsOneImageCell:
            return ONEIMAGECELLHEIGHT;
            break;
        case NewsOneBigImageCell:
            return ONEBIGIMAGECELLHEIGHT;
            break;
        case NewsImagesCell:
            return IMAGESCELLHEIGHT;
            break;
        case NewsOneImageCellSpecial:
            return ONEIMAGECELLHEIGHT;
            break;
    }
    
}
@end
