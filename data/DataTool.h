//
//  DataTool.h
//  data
//
//  Created by angelwin on 16/7/6.
//  Copyright © 2016年 com@angelwin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataTool : NSObject
// 创表
+ (void)createBaseTable;
//向表中插入数据
+ (void)inserDataForTableWith:(NSString *)BarCode Quantity:(int)Qty;
//读取 表中插入数据
+ (NSArray *)DataArry;
@end
