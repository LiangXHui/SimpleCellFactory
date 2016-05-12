//
//  LHCellFactory.h
//  SimpleCellFactory
//
//  Created by apple on 16/5/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LHImagesTableViewCell.h"
#import "LHOneImageTableViewCell.h"
#import "LHOneBigImageTableViewCell.h"
#import "LHBaseTableViewCell.h"

@interface LHCellFactory : NSObject

typedef NS_ENUM(NSUInteger, CellType){
    
    NewsOneImageCell = 0,
    NewsOneImageCellSpecial,
    // NewsOneImageCellLive,
    NewsImagesCell,
    NewsOneBigImageCell,
};


+(CellType)cellTypeWithModel:(id)model;

+(LHBaseTableViewCell*)cellWithTableView:(UITableView*)tableView Model:(id)model IndexPath:(NSIndexPath*)indexPath;

+(LHBaseTableViewCell*)cellWithTableView:(UITableView*)tableView Model:(id)model IndexPath:(NSIndexPath*)indexPath Type:(CellType)type;

+(CGFloat)cellHightWithModel:(id)model;

+(CGFloat)cellHightWithModel:(id)model Type:(CellType)type;
@end
