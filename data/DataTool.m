


//
//  DataTool.m
//  data
//
//  Created by angelwin on 16/7/6.
//  Copyright © 2016年 com@angelwin. All rights reserved.
//

#import "DataTool.h"
#import "FMDB.h"
#import "PandianParam.h"

@implementation DataTool
+ (NSString *)fmdbPath{
    NSString *str = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *fmdbPath = [str stringByAppendingPathComponent:@"fmdb.sqlite"];
    return fmdbPath;
}
+ (void)createBaseTable{
    
   
 FMDatabase  *dataBase = [FMDatabase databaseWithPath:[self fmdbPath]];
    [dataBase open];
    
    //创建空的表(更新操作)
   [dataBase executeUpdate:@"create table if not exists t_Pandian(id integer primary key Autoincrement , Barcode text, Quantity integer)"];
     [dataBase close];

    
}
+ (void)inserDataForTableWith:(NSString *)BarCode Quantity:(int)Qty{
    FMDatabase  *dataBase = [FMDatabase databaseWithPath:[self fmdbPath]];
    [dataBase open];
    FMResultSet *set = [dataBase executeQueryWithFormat:@"select * from t_Pandian where BarCode=%@",BarCode];
    while ([set next]) {
        [dataBase executeUpdateWithFormat:@"update  t_Pandian set Quantity=Quantity+%d where Barcode=%@", Qty,BarCode];
        [dataBase close];
        return;
    }
    [dataBase executeUpdate:@"insert into t_Pandian (Barcode,Quantity) values (?,?)", BarCode, @(Qty)];
    [dataBase close];

}
+ (NSArray *)DataArry{
    FMDatabase  *dataBase = [FMDatabase databaseWithPath:[self fmdbPath]];
    [dataBase open];
    FMResultSet *set = [dataBase executeQuery:@"select *from t_Pandian"];
    NSMutableArray *arrM = [[NSMutableArray alloc]init];
    while ([set next]) {
        PandianParam *param = [[PandianParam alloc]init];
        param.Barcode = [set stringForColumn:@"BarCode"];
        param.Quantity = [set intForColumn:@"Quantity"];
        [arrM addObject:param];
    }
    [dataBase close];
    return  [arrM copy];
}

@end
