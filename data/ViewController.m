//
//  ViewController.m
//  data
//
//  Created by angelwin on 16/7/6.
//  Copyright © 2016年 com@angelwin. All rights reserved.
//

#import "ViewController.h"
#import "DataTool.h"
#import "PandianParam.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
- (void)test{
    [DataTool createBaseTable];
    [DataTool inserDataForTableWith:@"gongke" Quantity:2];
    //    [DataTool inserDataForTableWith:@"zhangli" Quantity:1];
    [DataTool inserDataForTableWith:@"xuzhe" Quantity:1];
    //    [DataTool inserDataForTableWith:@"xuzhe" Quantity:2];
    NSArray *arr =   [DataTool DataArry];
    for (PandianParam *param  in arr) {
        NSLog(@"%@",param.Barcode);
        NSLog(@"%d",param.Quantity);
    }
}

@end
